<?php

namespace App\Traits;

use DateTime;
use Exception;
use DateTimeZone;
use SimpleXMLElement;
use App\Services\BaseService;
use App\Services\RestAPIService;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\File;

trait CoreMethod{

    protected function UploadLabel($service_array, $file_content)
	{
        $file_dir = storage_path($service_array["method"]."/".$service_array["company"]."/".$service_array["service"]);
        // Check if the label file exists or not (create one)
        if ( !$this->file_exists($file_dir) ) {
            File::makeDirectory($file_dir, 0777, true, true);
            Log::info("Directory ".$file_dir." created");
        }
        
        $directory_file = $file_dir."/".date("YmdHis").".pdf";
        Log::info("label directory ==>".$directory_file);

        if ( $directory_file ){
            /* Mark: Check label's path exists or not */
            if ( file_put_contents($directory_file, $file_content) )
            {
                if ( $this->file_exists( $directory_file ) ) return $this->file_response($directory_file, true);
            }
        }

        return $this->file_response("", false);

	}

    protected function file_response($directory_file, $status)
    {
        return [
            "status"    => $status,
            "directory" => $directory_file
        ];
    }

    protected function label_message($responses)
    {
        log_info("Start Mapping Response");
        // $pattern = '/\{".*?(\}\}\})|\{".*?(\}\})/';
        $pattern = '/\{(?:[^{}]|(?R))*\}/';
        preg_match_all($pattern, $responses->body(), $matches);

        if ( !empty( $matches[0] ) ) {
            $response_array = json_decode($matches[0][0], true);
            if ( !empty($response_array) )
            {

                $label_msg_response = [
                    "id"            => $response_array["messages"][0]['id'],
                    "message"       => $response_array["messages"][0]["messageContent"],
                    "parcel_number" => $response_array["labelV2Response"]["parcelNumber"] ?? ""
                ];
                if ( $label_msg_response['id'] != 0 ) throw new Exception($label_msg_response['message'], $label_msg_response['id']);
                return $label_msg_response;
    
            }
            
        }
        return [];

    }

    protected function file_exists($file)
    {
        if ( File::exists($file) ) return true;

        return false;
    }

    protected function getMappingFile($service_array, $json_file, $extension="json")
    {
        return resource_path("wrapper_json_folder/".$service_array['company']."/".$service_array["service"]."/".$json_file.".".$extension);
    }

    protected function getServiceArray($request_uri, $format="json")
    {
        $service_section = explode( "/",  $request_uri);
        $service_section = [
            "company" => $service_section[2],
            "service" => $service_section[3],
            "method"  => $service_section[4]
        ];
        $this->setConfigEnv($service_section, $format);
        return $service_section;
    }

    protected function load_json_from_file($original_json)
    {
        $extension = explode(".", $original_json);
        if ( $extension[1] != "json" ){
            $soapResponse = file_get_contents($original_json);
            $xml = new SimpleXMLElement($soapResponse);
            $xml->registerXPathNamespace('char', 'http://chargeur.tracking.geopost.com/');
            return $xml;
        }
        $jsonData = File::get($original_json);
        // Decode JSON data into an array
        return json_decode($jsonData, true);
    }

    protected function reg_check_request_mapping($value)
    {
        return preg_split('/[.]/', $value);
    }

    /* None-use */
    protected function get_payload_value($original_request_array, $key )
    {
        $original_key = $this->reg_check_request_mapping($key);
        $resultArray  = $original_request_array;
        $currentArray = &$resultArray;
        
        foreach ($original_key as $item)
        {
            if (isset($currentArray[$item]))
            {
                if ( !is_string($currentArray[$item]) )
                {
                    $currentArray[$item] = $currentArray[$item];
                }
            }

            // Move the reference to the nested array
            if ( !is_string($currentArray[$item] ?? [] ) )
            {
                $currentArray = &$currentArray[$item];
            }
        }

        if ( isset( $currentArray[$item] ) ){
            $result = $currentArray[$item];
            return $result;
        }
        else{
            return false;
        }
    }

    protected function getCurrentDate($test, $test1)
    {
        $parisTimeZone = new DateTimeZone('Europe/Paris');
        $parisTime = new DateTime('now', $parisTimeZone);
        return $parisTime->format('Y-m-d');
    }

    protected function getValueFromCombineKey($valueList, $jsonList) {
        $result = '';

        foreach ($valueList as $key) {
            $combineKeys = preg_split('/\.|\//', $key);
            $value = $this->valueFromDict($jsonList, ...$combineKeys) ?: '';
            $result .= ' ' . strval($value);
        }

        return trim($result);
    }

    protected function getErrorTrack($track_array)
    {
        return json_encode(array_slice($track_array, 0, 1)[0]);
    }
    
    protected function getValueFromNestedKeys($keys, $dictionary) {
        foreach ($keys as $value) {
            $original_key  = $this->reg_check_request_mapping($value);
            return array_reduce($original_key, function ($carry, $original_key) {
                return is_array($carry) && array_key_exists($original_key, $carry) ? $carry[$original_key] : null;
            }, $dictionary);
        }
    }

    protected function updateNestedDictionary(&$dictionary, $mapList, $val) {
        $lastIndex = count($mapList) - 1;
    
        // Traverse the nested levels, except the last one
        $current = &$dictionary;
        for ($i = 0; $i < $lastIndex; $i++) {
            $key = $mapList[$i];
    
            if (!isset($current[$key]) || !is_array($current[$key])) {
                $current[$key] = [];
            }
    
            $current = &$current[$key];
        }
    
        // Update the final value
        $current[$mapList[$lastIndex]] = $val;
    }

    protected function mapping_json($original_request_array,$mapping_json, $payload_array)
    {
        log_info("==============START Mapping json ==============");
        foreach ($mapping_json as $key => $item) {

            $value_list     = $item['value'];
            $default        = $item['default'];
            $alternative    = $item['alternative'];
            $function       = $item['function'];
            $function_param = $item['params'];
            $required       = $item['required'];

            //1. check value and combine
            $value = $this->getValueFromNestedKeys($value_list, $payload_array);

            //2. value = alternative, if value is empty
            if ( !$value ){
                $value = $this->getValueFromNestedKeys($alternative, $payload_array);
            }

            //3. value = default value, if alternative is ""
            if ( !$value ){
                $value = $default;
            }

            //4. validate required

            //5. execute function for specefic data
            if ( $function ){
                // noted: append value into dynamic argument
                $function_param[] = $value;
                $value = call_user_func_array($function, $function_param);
            }

            $value = $value ?? "";
            $props = preg_split('/\.|\//', $key);
            log_debug("mapping items", [
                "key" => $key,
                "value" => $value
            ]);
            
            $this->updateNestedDictionary($original_request_array, $props, $value);
        }
        log_info("==============END Mapping json ==============");
        return $original_request_array;
    }

    protected function mapping_xml($original_request_array,$mapping_json, $payload_array)
    {
        log_info("==============START Mapping XML ==============");
        foreach ($mapping_json as $key => $item) {

            $value_list     = $item['value'];
            $default        = $item['default'];
            $alternative    = $item['alternative'];
            $function       = $item['function'];
            $function_param = $item['params'];
            $required       = $item['required'];

            //1. check value and combine
            $value = $this->getValueFromNestedKeys($value_list, $payload_array);

            //2. value = alternative, if value is empty
            if ( !$value ){
                $value = $this->getValueFromNestedKeys($alternative, $payload_array);
            }

            //3. value = default value, if alternative is ""
            if ( !$value ){
                $value = $default;
            }

            //4. validate required

            //5. execute function for specefic data
            if ( $function ){
                // noted: append value into dynamic argument
                $function_param[] = $value;
                $value = call_user_func_array($function, $function_param);
            }

            $mapping_json[$key]['value'] = $value;
            log_debug("mapping items", [
                "key" => $key,
                "value" => $value
            ]);
        }
        log_info("Access the mapping xml to json from mapping_json => ", $mapping_json);
        log_info("==============END Mapping json ==============");
        return $mapping_json;
    }

    protected function getClassName($str)
    {
        $class_name = ucfirst($str)."Controller" ?? "";
        $class_name = "App\Http\Controllers\Api\\".$class_name;
        return new $class_name(new BaseService());
    }
    protected function getMethodName($str)
    {
        return $str ?? "";
    }

    protected function getSession($param)
    {
        if (session()->has($param)) {
            return session()->get('uri');
        }
        return "";
    }

    protected function currentDate()
    {
        return date('Y-m-d H:i:s');
    }

    protected function xmlToArray($xmlDate)
    {
        $xmlStringUtf8 = mb_convert_encoding($xmlDate, 'UTF-8', 'auto');
        // $response = simplexml_load_string($xmlStringUtf8);
        $response = preg_replace("/(<\/?)(\w+):([^>]*>)/", "$1$2$3", $xmlStringUtf8);
        $xml = new SimpleXMLElement($response);
        $body = $xml->xpath('//return')[0];
        $array = json_decode(json_encode((array)$body), TRUE);
        return $array;
    }

    protected function isDutiable($origin_countrycode)
    {
        if ( strtolower($origin_countrycode) == "no" || strtolower($origin_countrycode) == "ch") return true;
        return false;
    }
}

