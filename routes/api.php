<?php

use App\Http\Controllers\ProductController;
use App\Http\Controllers\ApplicationController;
use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Public routes
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::get('/applications', [ApplicationController::class, 'index']);
Route::get('/applications/{id}', [ApplicationController::class, 'checkApplicationStatus']);
Route::get('/charity/approved/{id}', [ApplicationController::class, 'getCharityApproved']);
Route::get('/charity/location/{id}', [ApplicationController::class, 'getCharityLocation']);
Route::get('/applications/checkstatus/{id}/{direction}', [ApplicationController::class, 'checkApplicationStatus']);

Route::post('/applications', [ApplicationController::class, 'create']);
Route::post('/applications/create', [ApplicationController::class, 'create']);
Route::post('/applications/move', [ApplicationController::class, 'moveApplication']);

Route::post('/logout', [AuthController::class, 'logout']);



Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
