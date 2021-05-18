<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\Application;
use App\Models\UserRoles;
use App\Models\Users;
use App\Models\Charities;
use App\Models\Countries;

class ApplicationController extends Controller
{
    public function index()
    {
        return Application::all();
    }

    public function create(Request $request) 
    {
        $request->validate([
            'charity_id' => 'required',
            'user_id' => 'required',
        ]);

        //applications will default to a single status (this should probably not be set by the user)
        return Application::create(array_merge($request->all(), ['stage' => 'Organisational Approval']));
    }

    public function checkUserPermissions($userId, $permission) 
    {
        $roles = UserRoles::select("role")
                    ->where("user_id", $userId)
                    ->get();

        //100% not the correct way to do this but I've been tripping over Laravel functions for 15 minutes.
        $roles = collect($roles->toArray())->flatten();

        if(in_array($permission, $roles->toArray())) {
            return true;
        }

        return false;
    }

    public function moveApplication(Request $request) 
    {
        $request->validate([
            'application_id' => 'required',
            'user_id'        => 'required',
            'direction'      => 'required',
        ]);
        
        if (!$this->checkUserPermissions($request->user_id, "admin_applications")) {
            return ["message" => 'You do not have permission to perform this action'];
        }

        if(!$this->verifyApplicationStatus($request->application_id, $request->direction)) {
            return ["message" => 'Application cannot be moved.'];
        }

        $application = Application::select("*")->where("application_id", $request->application_id)->first();
        
        if($application->stage == 'Organisation Approval') {
            return ['message' => 'Application requires approval'];
        }

        if($request->direction) {
            if($application->stage == 'Allow to Proceed') {
                $application->stage = 'Paid';

                //if only we were using id instead of application_id I'm pretty sure I could just do:
                //$application->save();

                DB::table("applications")->where('application_id', $application->application_id)->update(['stage' => 'Paid']);

                return ['message' => 'Application Pushed to Paid stage'];
            }

            return ['message' => 'Application is not in a "Allow to Proceed" stage'];
            
        } else if (!$request->direction) {
            if($application->stage == 'Allow to Proceed') {
                $application->stage = 'Organisation Approval';
                DB::table("applications")->where('application_id', $application->application_id)->update(['stage' => 'Organisation Approval']);
                return ['message' => 'Application Pulled back to Organisation Approval stage'];
            }
        }

        return ['message' => 'Something has gone wrong!'];
    }

    /**
     * Entry point for the checkStatus endpoint.
     * (bit messy but does the job. Could definitly be cleaned up and done better but running out of time)
     * 
     * @return JSON
     */
    public function checkApplicationStatus($applicationId, bool $direction)
    {
        if ($this->verifyApplicationStatus($applicationId, $direction)) {
            if ($direction) {
                return ["message" => 'application can be moved forwards'];
            }

            return ["message" => 'application can be moved backwards'];
        } else {
            if($direction) {
                return ["message" => 'application cannot be moved forwards'];
            } else {
                return ["message" => 'application cannot be moved backwards'];
            }
        }
    }

    /**
     * checks the status of an application and whether or not it can be moved
     * 
     * @return boolean
     */
    public function verifyApplicationStatus($applicationId, bool $direction)
    {
        //direction 0 backwards, direction 1 forwards.
        $application = Application::select("*")
                        ->where('application_id', $applicationId)
                        ->first();

        if ($direction) {
            if (!(strtotime("now") > strtotime($application->created_at))) {
                var_dump("time");
                return false;
            }
            if (!$this->getCharityLocation($application->charity_id) == 'GBR') {
                var_dump("charityLoc");
                return false;
            }
            if (!$this->getCharityApproved($application->charity_id)) {
                var_dump("charityAprv");
                return false;
            }
        } else if (!$direction) {
            if (!$this->getCharityLocation($application->charity_id) == 'GBR') {
                var_dump("charityLoc");
                return false;
            }
        }

        return true;
    }

    public function getCharityLocation ($charityId) {
        $charity = Charities::select("country_id")
                    ->where('charity_id', $charityId)
                    ->first();

        return Countries::select("country_code")
                    ->where("country_id", $charity->country_id)
                    ->first()->country_code;
    }

    public function getCharityApproved($charityId) {
        return Charities::select("is_approved")
                    ->where("charity_id", $charityId)
                    ->first()->is_approved;
    }
}
