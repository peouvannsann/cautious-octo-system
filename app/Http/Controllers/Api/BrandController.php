<?php

namespace App\Http\Controllers\Api;

use App\Models\Brand;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;


class BrandController extends Controller
{
    /**
     * @OA\Get(
     *     path="/getbrand",
     *     operationId="getBrand",
     *     tags={"Brand"},
     *     summary="get brand",
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
    public function getBrand(Request $request) {
        $brands = Brand::with('category')->paginate(
            $perPage = $request->perPage ?? 10,
            $columns = '*',
            $pageName = 'brands',
            $page = $request->page ?? 1);;
        return $this->response_format($brands);
    }
}
