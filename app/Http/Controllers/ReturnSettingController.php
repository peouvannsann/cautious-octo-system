<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ReturnSetting;
use Illuminate\Support\Facades\Session;

class ReturnSettingController extends Controller
{
    public function saveSelectedItem(Request $request){

        $data = $request->all();
        $session_merchant = Session::has('merchant_id') ? Session::get("merchant_id") : 84;
        // check key module exists in table
        $key_module_exists = ReturnSetting::where('key_module', $data['key_module'])->where('merchant_id', $session_merchant)->exists();
        
        $reason_list = [];
        if(isset($data['value'])){
            foreach ($data['value'] as $key => $value) {
                $reason_list[$value['reason_id']] = $value;
            }
        }else{
            $data['value'] = [];
        }
        
        if (!$key_module_exists){
            ReturnSetting::create([
                "key_module" => $data['key_module'],
                "key_value" => json_encode($reason_list),
                "merchant_id" => (int)$session_merchant
            ]);
        }else{

            ReturnSetting::where('merchant_id', (int)$session_merchant)->update([
                "key_value" => json_encode($reason_list),
            ]);
            
        }
        return response()->json([
            "name" => $reason_list
        ]);
    }
}
