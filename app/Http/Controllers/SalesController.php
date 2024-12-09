<?php

namespace App\Http\Controllers;

use App\Models\Sales;
use Illuminate\Http\Request;
use App\Jobs\SalesCsvProcess;
use Illuminate\Support\Facades\Bus;

class SalesController extends Controller
{

    public function index()
    {
        return view("upload-file");
    }

    public function upload()
    {
        if (request()->has("mycsv")) {

            // $data = array_map('str_getcsv', file(request()->mycsv));
            $data = file(request()->mycsv);

            // $header = $data[0];
            // unset($data[0]);

            // Chunking
            $chunks = array_chunk($data,500);
            // dd($chunks[0]);
            
            foreach($chunks as $key => $chunk) {
                $name = "/tmp{$key}.csv";
                $path = storage_path("temp");
                file_put_contents($path.$name, $chunk);
                // return $path.$name;
            }

            // foreach ($data as $item) {
            //     $sales = array_combine($header, $item);
            //     Sales::create($sales);
            // }
            return "Done";
            
        }
    }

    public function store()
    {
        $path = storage_path('temp');
        $files = glob("$path/*.csv");
        
        // Job Batch
        $header = [];
        $batch = Bus::batch([])->dispatch();
        foreach ($files as $key => $file) {
            
            $data = array_map('str_getcsv', file($file));

            if ($key == 0) {
                $header = $data[0];
                unset($data[0]);
            }

            $batch->add(new SalesCsvProcess($data, $header));
            SalesCsvProcess::dispatch($data, $header);
            // unlink($file);
        }

        // Job
        // $header = [];
        // foreach ($files as $key => $file) {
            
        //     $data = array_map('str_getcsv', file($file));

        //     if ($key == 0) {
        //         $header = $data[0];
        //         unset($data[0]);
        //     }
        //     SalesCsvProcess::dispatch($data, $header);
        //     unlink($file);
        // }
        return $batch;
    }

    public function batch()
    {
        $batchId = request('id');
        return Bus::findBatch($batchId);
    }
}
