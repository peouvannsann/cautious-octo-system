<?php

namespace App\Http\Controllers\Api;

use App\Models\PlanedVistsPlace;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\PlanedVistsPlaceDetail;
use App\Models\User;

class PlanVisitPlaceController extends Controller
{

    /**
     * @OA\Get(
     *     path="/getPlanVisitPlace",
     *     operationId="getPlanVisitPlace",
     *     tags={"Plan"},
     *     summary="get plan ",
     *     @OA\Parameter(
     *         name="date",
     *         in="path",
     *         description="date",
     *         required=false,
     *         example="2024-02-16",
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
    public function getPlanVisitPlace(Request $request)
    {
        // $plan_visite_place = User::where('id', $user_id)->with([
        //     'plans' => function ($query) {
        //         $query->select('id', 'start_date', 'end_date', 'user_id');
        //         $query->with([
        //             'details' => function ($query) {
        //                 $query->orderBy('day')->select('day', 'plan_visit_place_id', 'visit_place_id');
        //                 $query->with(['visitePlace' => function ($query){
        //                     $query->select('id', 'name', 'country');
        //                 }]);
        //             }
        //         ]);
        //     }
        // ])->get(['id','name']);

        // $plan_visite_place = collect($plan_visite_place)->map(function ($plan, $key){
        //     if ( $plan->plans ){
        //         return $plan->plans;
        //     }
        // });
        $user_id = $request->user()->id;
        $visite_place_select = ['id', 'name', 'country', 'location', 'categories'];
        $date = $request->date ?? "";
        $country = $request->country ?? "";
        $plan_visite_place = PlanedVistsPlace::where("user_id", $user_id)
        ->whereDate('start_date', '<=', $date)
        ->orWhereDate('end_date', '>=', $date)
        ->with([
            'details' => function ($query) use($visite_place_select, $country) {
                $query->orderBy('day')->select('day', 'plan_visit_place_id', 'visit_place_id');
                $query->with(['visitePlace']);
                // $query->with(['visitePlace' => function ($query) use($visite_place_select, $country){
                //     $query->select($visite_place_select);
                // }]);
            }
        ])->paginate(
            $perPage = $request->perPage ?? 10,
            $columns = ['id','title' ,'start_date', 'end_date', 'user_id'],
            $pageName = 'planed_visited_places',
            $page = $request->page ?? 1
        );
        // $plan_visite_place = User::where('id', $user_id)->with([
        //     'plans' => function ($query) use($visite_place_select, $date, $country) {
        //         $query->whereDate('start_date', '<=', $date)->orWhereDate('end_date', '>=', $date)->select('id','title' ,'start_date', 'end_date', 'user_id');
        //         // $query->select('id','title' ,'start_date', 'end_date', 'user_id');
        //         $query->with([
        //             'details' => function ($query) use($visite_place_select, $country) {
        //                 $query->orderBy('day')->select('day', 'plan_visit_place_id', 'visit_place_id');
        //                 $query->with(['visitePlace' => function ($query) use($visite_place_select, $country){
        //                     // $query->where('country', 'like', '%' . $country . '%')->select($visite_place_select);
        //                     $query->select($visite_place_select);
        //                 }]);
        //             }
        //         ]);
        //     }
        // ])->paginate(
        //     $perPage = $request->perPage ?? 10,
        //     $columns = [],
        //     $pageName = 'planed_visited_places',
        //     $page = $request->page ?? 1);
        
        $plane_list = $plan_visite_place->toArray();
        
        // $plane_list = $plan_visite_place;
        // foreach ($plane_list->getCollection() as $key => $plans) {
        //     // dd($plans);
        //     $plans->details->groupBy('day');
        //     dd($plans->details);
        //     // foreach ($plans->details->groupBy('day')->all() as $dkey => $details) {
        //     //     dd($details);
        //     // }
        //     // $plane_list['data'][0]['details'] = $tmp_details;
        // }
        foreach ($plane_list['data'] as $key => $plans) {
            $tmp_details = [];
            foreach ($plans['details'] as $dkey => $details) {
                $tmp_details["day".$details['day']][] = $details['visite_place'];
            }
            $plane_list['data'][$key]['details'] = $tmp_details;
        }
        
        return $this->response_format($plane_list);
    }

    /**
        *@OA\Post(
        *    path="/addPlanVisitPlace",
        *    operationId="addPlanVisitPlace",
        *    tags={"Plan"},
        *    summary="add plan",
        *    @OA\RequestBody(
        *        @OA\MediaType(
        *            mediaType="application/json",
        *            @OA\Schema(
        *                @OA\Property(
        *                   collectionFormat="multi",
        *                   property="plan",
        *                   type="array",
        *                   @OA\Items(type="object", format="query"),
        *                ),
        *                example={
        *                    "plan": {
        *                        {
        *                            "title" : "plan A",
        *                            "start_date": "2024-02-20 06:06:28",
        *                            "end_date": "2024-02-22 06:06:28",
        *                            "details": {
        *                                {
        *                                    "day": 1,
        *                                    "visit_place": {
        *                                        1,
        *                                        2
        *                                    }
        *                                },
        *                                {
        *                                    "day": 2,
        *                                    "visit_place": {
        *                                        3,
        *                                        4
        *                                    }
        *                                }
        *                            }
        *                        },
        *                        {
        *                            "title" : "plan A",
        *                            "start_date": "2024-02-22 06:06:28",
        *                            "end_date": "2024-02-25 06:06:28",
        *                            "details": {
        *                                {
        *                                    "day": 1,
        *                                    "visit_place": {
        *                                        5,
        *                                        6
        *                                    }
        *                                }
        *                            }
        *                        }
        *                    }
        *                },
        *            ),
        *        ),
        *
        *    ),
        *     @OA\Response(response="201", description="User registered successfully"),
        *     @OA\Response(response="422", description="Validation errors"),
        *     security={{"bearerAuth":{}}}
        *)
    */
    public function addPlanVisitPlace(Request $request)
    {
        // $user_id = 1;
        /* 
            $plan_sample = [
                "plan" => [
                    [
                        "start_date"  => "2024-02-20 06:06:28",
                        "end_date"    => "2024-02-22 06:06:28",
                        "details" => [
                            "day"         => 1,
                            "visit_place" => [1,2,3,4]
                        ]
                    ],
                    [
                        "start_date"  => "2024-02-20 06:06:28",
                        "end_date"    => "2024-02-22 06:06:28",
                        "details" => [
                            "day"         => 2,
                            "visit_place" => [1,2,3]
                        ]
                    ]
                ]
            ]; 
        */
        $user_id = $request->user()->id;
        $is_user = User::findOrFail($user_id);
        $plan_sample = $request->all();

        $plan_list = [];
        foreach ($plan_sample['plan'] as $key => $plan) {

            $tmp_pan             = new PlanedVistsPlace;
            $tmp_pan->title = $plan['title'];
            $tmp_pan->start_date = $plan['start_date'];
            $tmp_pan->end_date   = $plan['end_date'];
            $is_add_plan         = $is_user->plans()->save($tmp_pan);

            foreach ($plan['details'] as $key => $plan_details) {
                $is_add_plan_details = PlanedVistsPlace::find($is_add_plan->id)->adddDetails()
                ->attach($plan_details['visit_place'], ["day" => $plan_details['day']]);
                // $is_add_plan_details = PlanedVistsPlace::find($is_add_plan->id)->adddDetails()
                // ->syncWithPivotValues($plan['details']['visit_place'], ["day" => $plan['details']['day']]);
            }
        }
        
        return $this->response_format([
            "success"
        ]);
    }
}