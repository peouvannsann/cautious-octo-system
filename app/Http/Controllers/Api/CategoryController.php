<?php

namespace App\Http\Controllers\Api;

use App\Models\Brand;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Enums\PlaceCategoriesEnum;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class CategoryController extends Controller
{

    public function getCategory() {
        return Category::get();
    }
    /**
     * @OA\Get(
     *     path="/getPopularFilter",
     *     operationId="getPopularFilter",
     *     tags={"Category"},
     *     summary="get category ",
     *     @OA\Response(response="201", description="Category successfully"),
     *     @OA\Response(response="422", description="Validation errors"),
     *     security={{"bearerAuth":{}}}
     * )
    */
    public function getPopularFilter()
    {
        $data = array_column(PlaceCategoriesEnum::cases(), 'value');
        return $this->response_format($data);
    }
}
