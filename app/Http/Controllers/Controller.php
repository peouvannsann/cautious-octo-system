<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

/**
 * @OA\Info(
 *     version="1.0.0",
 *     title="Kodementor Api Documentation",
 *     description="Kodementor Api Documentation",
 *     @OA\Contact(
 *         name="Vijay Rana",
 *         email="info@kodementor.com"
 *     ),
 *     @OA\License(
 *         name="Apache 2.0",
 *         url="http://www.apache.org/licenses/LICENSE-2.0.html"
 *     )
 * ),
 * @OA\Server(
 *     url="/api",
 * ),
 * @OA\SecurityScheme(
 *     type="http",
 *     securityScheme="bearerAuth",
 *     scheme="bearer",
 *     bearerFormat="plainTextToken"
 * )
 */
class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected function response_format($data)
    {
        if ( $data ){
            return response()->json([
                'status' => true,
                'message' => 'Successfully',
                'data' => $data
            ], 200);
        }else{
            return response()->json([
                'status' => true,
                'message' => 'Successfully',
                'data' => []
            ], 500);
        }
    }
}
