<?php

namespace App\Http\Controllers\Api;

use App\Enums\OrderStatusEnum;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Order;

class OrderController extends Controller
{

    /**
     * @OA\Post(
     *     path="/addOrder",
     *     operationId="addOrder",
     *     tags={"Order"},
     *     summary="add Order",
     *     @OA\RequestBody(
     *        @OA\MediaType(
     *            mediaType="application/json",
     *            @OA\Schema(
     *                example={
     *                   "items" : {1,2,3,4},
     *                   "grant_qty" : 10.0,
     *                   "grant_total" : 20.0,
     *                   "address": {
     *                       "name" : "up",
     *                       "country" : "Cambodia",
     *                       "city" : "Phnom penh",
     *                       "phone number" : "097878765",
     *                       "address" : "1st 225 psa depo2"
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
    public function addOrder(Request $request)
    {
        $param = $request->all();
        $order_list = [
            "grant_qty"   => $param['grant_qty'],
            "grant_total" => $param['grant_total'],
            "status"      => OrderStatusEnum::PENDING->value,
            "items"       => $param['items'],
            "address"     => $param['address']
        ];
        $is_added_order = Order::create($order_list);
        return $is_added_order;
    }

    
}
