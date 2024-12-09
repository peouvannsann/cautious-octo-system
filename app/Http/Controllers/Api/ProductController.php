<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Product;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        
    }
    /**
     * @OA\Get(
     *     path="/getProduct",
     *     operationId="getProduct",
     *     tags={"Products"},
     *     summary="get products",
     *     @OA\Parameter(
     *         name="brand_id",
     *         in="query",
     *         description="brand_id",
     *         required=false,
     *         example=1,
     *         @OA\Schema(type="int")
     *     ),
     *     @OA\Parameter(
     *         name="search",
     *         in="query",
     *         description="search Index",
     *         required=false,
     *         example="shoe",
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Parameter(
     *         name="page",
     *         in="query",
     *         description="Page Index",
     *         required=false,
     *         example=1,
     *         @OA\Schema(type="int")
     *     ),
     *     @OA\Parameter(
     *         name="perPage",
     *         in="query",
     *         description="perPage Index",
     *         required=false,
     *         example=10,
     *         @OA\Schema(type="int")
     *     ),
     *     @OA\Response(response="201", description="User registered successfully"),
     *     @OA\Response(response="422", description="Validation errors"),
     *     security={{"bearerAuth":{}}}
     * )
    */
    public function getProduct(Request $request)
    {
        // $products = Product::where("brand_id", $request->brand_id)->paginate(
        // $perPage = $request->perPage ?? 10,
        // $columns = '*',
        // $pageName = 'products',
        // $page = $request->page ?? 1);
        $product_search = $request->search;
        $products = Product::where("brand_id", $request->brand_id)->where('name', 'like', '%'.$product_search.'%')->get();
        // $products = Brand::where('id', $request->brand_id)->with([
        //     'products' => function($query) use ($product_search) {
        //         $query->where('name', 'like', '%'.$product_search.'%');
        //     }
        // ])->get();

        if ( count($products) < 1 ){
            $products = Product::get();
        }
        return $this->response_format($products);

    }

    public function getNewArrival(Request $request)
    {

    }

    
}
