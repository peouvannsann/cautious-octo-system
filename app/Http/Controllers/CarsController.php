<?php

namespace App\Http\Controllers;

use App\Models\Car;
use App\Models\ProductCar;
use Illuminate\Http\Request;

class CarsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cars = Car::all()->toJson();
        dd($cars);
        // dd($cars->toArray());
        return view("cars.index", [
            'cars' => $cars
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view("cars.create");
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // $car = new Car;
        // $car->name = $request->input('name');
        // $car->founded = $request->input('founded');
        // $car->description = $request->input('description');
        // $car->save();

        $car = Car::create([
            'name'        => $request->input("name"),
            'founded'     => $request->input("founded"),
            'description' => $request->input("name"),
        ]);
        return redirect('/cars');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        /**NOTE: 
        * has 1 relationship
        */
        // $car = Car::find($id);
        // $hq = $car->headquarter;
        // dd($hq);

        $car = Car::find($id);
        $products = ProductCar::find($id);
        var_dump($products);
        // return $car->productCar;
        
        // return $car->engines->toArray();
        /**NOTE: 
        * has 1 through : 1 to 1 relationship
        */
        // return $car->productionDate->toArray();


    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $car = Car::where("id", $id)->first();
        
        return view("cars.edit")->with('car',$car);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $car = Car::where("id", $id)
        ->update([
            'name'        => $request->input("name"),
            'founded'     => $request->input("founded"),
            'description' => $request->input("name"),
        ]);
        return redirect("/cars");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $car = Car::where("id", $id)->first();
        $car->delete();
        return redirect("/cars");
    }
}
