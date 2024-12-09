<?php

namespace App\Http\Controllers\Api;

use App\Enums\CartStatusEnum;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Cart;

class CartController extends Controller
{
        /**
     * @OA\Post(
     *     path="/addCart",
     *     operationId="addCart",
     *     tags={"Cart"},
     *     summary="add Cart",
     *     @OA\RequestBody(
     *        @OA\MediaType(
     *            mediaType="application/json",
     *            @OA\Schema(
     *                example={
     *                   {
     *                       "product_id": 1,
     *                       "qty": 1,
     *                       "price": 10.0
     *                   },
     *                   {
     *                       "product_id": 2,
     *                       "qty": 2,
     *                       "price": 20.0
     *                   }
     *               },
     *            ),
     *        ),
     *
     *    ),
     *     @OA\Response(response="201", description="User registered successfully"),
     *     @OA\Response(response="422", description="Validation errors"),
     *     security={{"bearerAuth":{}}}
     * )
    */
    public function addCart(Request $request)
    {
        $user = $request->user()->id;
        $param = $request->all();
        foreach ($param as $key => $value) {
            $cart_list = [
                "product_id" => $value['product_id'],
                "user_id"    => $user,
                "qty"        => $value['qty'],
                "price"      => $value['price'],
                "status"     => CartStatusEnum::PENDING->value
            ];
            $is_added_order = Cart::create($cart_list);
        }
        return $this->response_format([]);
    }

    
}
