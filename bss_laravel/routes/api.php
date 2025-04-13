<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\api\AuthController;

// Route::post('/register', [AuthController::class, 'register']);
Route::post('/register', [AuthController::class, 'register'])->withoutMiddleware(['auth:sanctum']);
Route::post('/login', [AuthController::class, 'login'])->withoutMiddleware(['auth:sanctum']);
// Route::post('/register', function () {
//     return response()->json(['message' => 'Route ditemukan'], 200);
// });


Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
