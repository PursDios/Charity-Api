<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use View;

class WaifuController extends Controller
{
    public function getWaifu()
    {   
        //I think there is a way of building up the query using the http client in laravel
        //But i had a bit of a hard time either understanding or finding the correct functionality
        //https://laravel.com/docs/8.x/http-client

        $url = "https://api.waifu.pics";
        $suitabilityForWork = request()->suitabilityForWork ?: 'sfw';
        $category = request()->category ?: 'waifu';

        $response = Http::get($url . '/' . $suitabilityForWork . '/' . $category);

        if(!$response->ok()) {
            return View::make('waifuPics')->with(array('error' => 'Invalid request or api is down'));
        }

        //if for whatever reason the request was successful but the format was not as expected.
        $response = $response->json() ?: null;

        //If successful then we are checking there is a response and that there is  URL element in that response.
        if(isset($response) && isset($response['url'])) {
            //return to the view with the new data (could be done using JS or eager loading with additional time)
            //Passing back both the image and the options from before.
            return View::make('waifuPics')->with(array('waifu' => $response, 'category' => $category, 'suitabilityForWork' => $suitabilityForWork));
        }

        //shouldn't ever reach here unless the format has changed but we should definitly have logic in place to handle it. 
        return View::make('waifuPics')->with(array('error' => 'Invalid Formatting or JSON Response.'));
    }

    public function getMultipleWaifus() {
        //TODO
    }
}
