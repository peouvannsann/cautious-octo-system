<?php

namespace App\Http\Controllers\Api;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\VerificationCode;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    /**
     * @OA\Post(
     *     path="/auth/register",
     *     operationId="Create User",
     *     tags={"Authenticate"},
     *     summary="Register a new user",
     *     @OA\Parameter(
     *         name="name",
     *         in="query",
     *         description="User's name",
     *         required=true,
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Parameter(
     *         name="email",
     *         in="query",
     *         description="User's email",
     *         required=true,
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Parameter(
     *         name="password",
     *         in="query",
     *         description="User's password",
     *         required=true,
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Response(response="201", description="User registered successfully"),
     *     @OA\Response(response="422", description="Validation errors")
     * )
    */
    public function createUser(Request $request)
    {
        try {
            //Validated
            $validateUser = Validator::make($request->all(), 
            [
                'name' => 'required',
                // 'email' => 'required|email|unique:users,email',
                'email' => 'required|email',
                'password' => 'required'
            ]);

            if($validateUser->fails()){
                return response()->json([
                    'status' => false,
                    'message' => 'validation error',
                    'errors' => $validateUser->errors()
                ], 401);
            }

            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password)
            ]);

            return response()->json([
                'status' => true,
                'message' => 'User Created Successfully',
            ], 201);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /**
     * @OA\Post(
     *     path="/auth/login",
     *     operationId="Login",
     *     tags={"Authenticate"},
     *     summary="Login a new user",
     *     @OA\Parameter(
     *         name="email",
     *         in="query",
     *         description="User's email",
     *         required=true,
     *         example="vannsann1@gmail.com",
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Parameter(
     *         name="password",
     *         in="query",
     *         description="User's password",
     *         required=true,
     *         example="123456",
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Response(response="201", description="User Login successfully"),
     *     @OA\Response(response="422", description="Validation errors")
     * )
    */
    public function loginUser(Request $request)
    {
        try {
            $validateUser = Validator::make($request->all(), 
            [
                'email' => 'required|email',
                'password' => 'required'
            ]);

            if($validateUser->fails()){
                return response()->json([
                    'status' => false,
                    'message' => 'validation error',
                    'errors' => $validateUser->errors()
                ], 401);
            }

            if(!Auth::attempt($request->only(['email', 'password']))){
                return response()->json([
                    'status' => false,
                    'message' => 'Email & Password does not match with our record.',
                ], 401);
            }

            $user = User::where('email', $request->email)->first();

            return response()->json([
                'status' => true,
                'message' => 'User Logged In Successfully',
                'token' => $user->createToken("API TOKEN")->plainTextToken
            ], 200);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ], 500);
        }
    }

    /**
     * @OA\Get(
     *     path="/sendOtpPhone",
     *     operationId="sendOtpPhone",
     *     tags={"OTP"},
     *     summary="get OTP",
     *     @OA\Response(response="201", description="User registered successfully"),
     *     @OA\Response(response="422", description="Validation errors"),
     *     security={{"bearerAuth":{}}}
     * )
    */
    public function sendOtpPhone(Request $request)
    {   
        $user = $request->user()->id;

        # User Does not Have Any Existing OTP
        $verificationCode = VerificationCode::where('user_id', $user)->latest()->first();

        $now = Carbon::now();

        // if($verificationCode && $now->isBefore($verificationCode->expire_at)){
        //     return $verificationCode;
        // }
        $otp = rand(123456, 999999);
        $verification_code = VerificationCode::create([
            'user_id' => $user,
            'otp' => $otp,
            'expire_at' => Carbon::now()->addMinutes(5)
        ]);
        $tel_msg = "Your ONE CARD password reset OTP code is ".$otp.". This code is valid for 5 minutes.";
        
        Http::get('https://api.telegram.org/bot6199210115:AAFw2dFJou5gbzsKBARti_90BXR-OjnjIlg/sendMessage?chat_id=@notimyfirstapp412341&text='.$tel_msg);

        return $this->response_format(["status" => "sent"]);
    }
}
