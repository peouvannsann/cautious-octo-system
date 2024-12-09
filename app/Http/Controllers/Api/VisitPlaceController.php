<?php

namespace App\Http\Controllers\Api;

use App\Models\VisitedPlace;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;


class VisitPlaceController extends Controller
{
    public function getVisitPlace(Request $request)
    {
        $visite_place = VisitedPlace::paginate(
            $perPage = $request->perPage ?? 10,
            $columns = '*',
            $pageName = 'visited_places',
            $page = $request->page ?? 1);
        return $this->response_format($visite_place);
    }

    /**
     * @OA\Get(
     *     path="/getVisitPlaceByProvince",
     *     operationId="getVisitPlaceByprovince",
     *     tags={"Visit Place"},
     *     summary="get visit place by province",
     *     @OA\Parameter(
     *         name="province",
     *         in="query",
     *         description="province",
     *         required=false,
     *         example="Kampot",
     *         @OA\Schema(type="string"),
     *     ),
     *     @OA\Parameter(
     *         name="cagetories",
     *         in="query",
     *         description="cagetories",
     *         required=false,
     *         example="farm",
     *         @OA\Schema(type="string"),
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
    public function getVisitPlaceByProvince(Request $request)
    {
        $categories = $request->cagetories ? explode(',',$request->cagetories) : $request->cagetories;
        // DB::enableQueryLog();
        $province = $request->province;
        $visite_place = VisitedPlace::where("country", "like", '%'.$province.'%')
        ->where(
            function ($query) use ($categories) {
                foreach ($categories ?? [] as $category) {
                    $query->orWhere('categories', 'like', '%'.$category.'%');
                }
            }
        )
        ->paginate(
            $perPage = $request->perPage ?? 10,
            $columns = '*',
            $pageName = 'visited_places',
            $page = $request->page ?? 1);
        // dd(DB::getQueryLog());
        return $this->response_format($visite_place);
    }

    public function filterVisitPlace(Request $request)
    {
        $categories = $request->cagetories ? explode(',',$request->cagetories) : $request->cagetories;

        if ( empty($categories) ){
            $country = VisitedPlace::paginate(
                $perPage = $request->perPage ?? 10,
                $columns = '*',
                $pageName = 'visited_places',
                $page = $request->page ?? 1);
        }else{
            $country = VisitedPlace::where(
                function ($query) use ($categories) {
                    foreach ($categories as $category) {
                        $query->orWhere('categories', 'like', '%"'.$category.'"%');
                    }
                }
            )->paginate(
                $perPage = $request->perPage ?? 10,
                $columns = '*',
                $pageName = 'visited_places',
                $page = $request->page ?? 1);
        }
        return $this->response_format($country);
    }

}
