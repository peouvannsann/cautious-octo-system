<?php

namespace App\Http\Controllers\Api;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\VerificationCode;
use App\Http\Controllers\Controller;
use App\Models\Cards;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Validator;

class CardController extends Controller
{

    /**
     * @OA\Post(
     *     path="/addCard",
     *     operationId="addCard",
     *     tags={"Card"},
     *     summary="add card",
     *     @OA\RequestBody(
     *        @OA\MediaType(
     *            mediaType="application/json",
     *            @OA\Schema(
     *                example={
     *                  {
     *                          "card_owner" : "vannsann",
     *                          "card_number" : "123456789",
     *                          "cvv" : "321",
     *                          "expire_date" : "2/2025"
     *                      },
     *                      {
     *                          "card_owner" : "alex john",
     *                          "card_number" : "987654321",
     *                          "cvv" : "123",
     *                          "expire_date" : "2/2025"
     *                      }
     *                 },
     *            ),
     *        ),
     *
     *    ),
     *     @OA\Response(response="201", description="User registered successfully"),
     *     @OA\Response(response="422", description="Validation errors"),
     *     security={{"bearerAuth":{}}}
     * )
    */
    public function addCard(Request $request)
    {
        $user = $request->user()->id;
        $param = $request->all();
        foreach ($param as $key => $value) {
            $cards = [
                "user_id"     => $user,
                "card_owner"  => $value['card_owner'],
                "card_number" => $value['card_number'],
                "cvv"         => $value['cvv'],
                "expire_date" => $value['expire_date']
            ];
            $is_add_card = Cards::create($cards);
        }
        return $this->response_format([]);
    }

    /**
     * @OA\Get(
     *     path="/getCard",
     *     operationId="getCard",
     *     tags={"Card"},
     *     summary="get card by user",
     *     @OA\Response(response="201", description="User registered successfully"),
     *     @OA\Response(response="422", description="Validation errors"),
     *     security={{"bearerAuth":{}}}
     * )
    */
    public function getCard(Request $request)
    {
        $user = $request->user()->id;
        $cards = Cards::where('user_id', $user)->get();
        return $this->response_format($cards);
    }
}
