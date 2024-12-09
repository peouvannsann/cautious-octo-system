<?php

namespace App\Services;

use App\Traits\CoreMethod;
use Spatie\ArrayToXml\ArrayToXml;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Response;

class RestAPIService
{
    use CoreMethod;

    private $config_env;
    protected $get_service;
    protected $envelop_namespace = 'envelop_namespace';
    protected $header            = 'header';
    protected $body_type         = 'body_type';
    protected $method            = 'method';
    protected $xpath             = 'xpath';

    public function __construct() {
        
    }

    public function setConfigEnv($config_env, $type="json")
    {
        $this->config_env = config("carrier_".env('carrier_wrapper_environment'))[$config_env['company']][$config_env['service']][$type];
    }

    public function getConfigEnv()
    {
        return $this->config_env;
    }

    public function getConfigEnvNameSpace()
    {
        return $this->getConfigEnv()[$this->envelop_namespace];
    }

    public function getConfigEnvHeader()
    {
        return $this->getConfigEnv()[$this->header];
    }

    public function getConfigEnvBodyType()
    {
        return $this->getConfigEnv()[$this->body_type];
    }

    public function getConfigEnvXPath()
    {
        return $this->getConfigEnv()[$this->xpath];
    }

    public function getUrl()
    {
        return $this->getConfigEnv()[ $this->getServiceArray()[$this->method] ];
    }

    public function xmlResponse($response)
    {
        $array_xml = $this->xmlToArray($response->body());

        if ( isset( $array_xml['errorMessage'] ) && isset( $array_xml['errorCode'] ) ){
            $xml_response = [
                "message" => $array_xml['errorMessage'],
                "code" => $array_xml['errorCode'],
            ];
            log_error("Xml Response => ", $xml_response);
            return $xml_response;
        }
    }

    public function soapXmlEnvelopElement($namespace)
    {
        return [
            'rootElementName' => 'ns0:Envelope',
            '_attributes' => $namespace,
        ];
    }

    public function soapXmlBodyElement($body)
    {
        return [
            'ns0:Header' => [],
            'ns0:Body' => [
                "ns1:track" => $body
            ],
        ];
    }

    public function arrayToXml($body, $header)
    {
        $result = ArrayToXml::convert(
            $this->soapXmlBodyElement($body), 
            $this->soapXmlEnvelopElement($header), 
            true, '
            ascii'
        );

        return $result;
        /* 
            $array = [
                'ns0:Header' => [],
                'ns0:Body' => [
                    "ns1:track" => [
                        "accountNumber" => "922967",
                        "password" => "Happy2018*",
                        "skybillNumber" => "8R42809798481",
                    ]
                ],
            ];
            // $result = ArrayToXml::convert($array, [], true, 'UTF-8', '1.1', [], true);
            $result = ArrayToXml::convert($array, [
                'rootElementName' => 'ns0:Envelope',
                '_attributes' => [
                    'xmlns:ns0' => 'http://schemas.xmlsoap.org/soap/envelope/',
                    'xmlns:ns1' => 'http://chargeur.tracking.geopost.com/',
                ],
            ], true, 'ascii');
            */
    }

    public function mappingXmlToArray($original_request_array,$mapping_json, $payload_array)
    {
        $mapping_json = $this->mapping_xml($original_request_array,$mapping_json, $payload_array);
        
        $array_to_xml_mapped = [];
        foreach ($mapping_json as $key => $value) {
            $explode_key = explode( "/",  $key);
            $child_key   = array_pop($explode_key);

            $result_xpath = $original_request_array->xpath($this->getConfigEnvXPath());
            if ( !empty( $result_xpath ) ){
                $array_to_xml_mapped[$child_key] = $value['value'];
                // $result_xpath[0]->$child_key = $value['value'];
            }else{
                // $result_xpath[0]->addChild($child_key, $value['value']);
            }
        }
        return $array_to_xml_mapped;
        
    }

    public function clean_xml($original_request_array,$mapping_json, $payload_array)
    {
        $array_to_xml_mapped = $this->mappingXmlToArray($original_request_array,$mapping_json, $payload_array);
        return $this->arrayToXml( $array_to_xml_mapped, $this->getConfigEnvNameSpace() );
    }

    public function httpRequest($original_request_array)
    {   
        log_debug("url => ".$this->getUrl() );
        log_debug("header => ", $this->getConfigEnvHeader());

        if ( $this->getConfigEnvBodyType() == "text/json" ){
            $responses = Http::withHeaders( $this->getConfigEnvHeader() )->post($this->getUrl(), $original_request_array);
            /* Mark: get Message and parcel from label */
        }else{
            $responses = Http::withHeaders( $this->getConfigEnvHeader() )->withBody( $original_request_array, $this->getConfigEnvBodyType() )
            ->post($this->getUrl());
            $label_array = $this->xmlResponse($responses);
        }

        log_debug("label status => ".$responses->status());
    
        return $responses;
    }

    public function xmlLabel()
    {
        
    }

    public function setServiceArray($request_uri, $format="json")
    {
        $service_section = explode( "/",  $request_uri);
        $service_section = [
            "company" => $service_section[2],
            "service" => $service_section[3],
            "method"  => $service_section[4]
        ];
        $this->setConfigEnv($service_section, $format);
        $this->get_service = $service_section;
        return $service_section;
    }

    public function getServiceArray()
    {
        return $this->get_service;
    }

    public function arrayToXmlAndReturnXml($request)
    {
        $json_to_array = $request->all();
        $result = ArrayToXml::convert(
            [
                'ns0:Header' => [],
                'ns0:Body' => [
                    "ns1:track" => $json_to_array
                ],
            ], 
            [
                'rootElementName' => 'ns0:Envelope',
                '_attributes' => [
                    'xmlns:ns0' => 'http://schemas.xmlsoap.org/soap/envelope/'
                ],
            ], 
            true, '
            ascii'
        );
        return Response::make($result, '200')->header('Content-Type', 'text/xml');
    }
}