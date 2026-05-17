<?php
namespace EduTech\Controller;
use \PDO;
use EduTech\C_Base;

class ReloadlyApiController extends C_base
{
    public function AutoDectedOperatorNumber($number, $country, $Key)
    {
        $curl = curl_init();

        curl_setopt_array($curl, [
            CURLOPT_URL =>
                'https://topups.reloadly.com/operators/auto-detect/phone/' .
                $number .
                '/countries/' .
                $country .
                '?includeBundles=true&includeData=true&includePin=true&simplified=false&suggestedAmounts=true&suggestedAmountsMap=true',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_SSL_VERIFYPEER => CURL_SSL_VERIFY,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => [
                'Authorization: Bearer ' . $Key,
                'Accept: application/com.reloadly.topups-v1+json',
            ],
        ]);

        $response = curl_exec($curl);
        $err = curl_error($curl);
        curl_close($curl);
        if ($err) {
            return 0;
        }
        return json_decode($response);
    }

    public function GenerateReloadlyAPIKey()
    {
        $curl = curl_init();

        curl_setopt_array($curl, [
            CURLOPT_URL => 'https://auth.reloadly.com/oauth/token',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => '{
  "client_id":"M0GVocnJSKfJjkQ1CdQHMNyKug92ejbS",
  "client_secret":"CmxPdndqLZ-UYu2R3Kd0ug7XM1o94k-yHaOwnc2ODH6DZ69vP7tEyBo3M2Fa1sk",
  "grant_type":"client_credentials",
  "audience":"https://topups.reloadly.com"
}',
            CURLOPT_HTTPHEADER => ['Content-Type: application/json'],
        ]);

        $response = curl_exec($curl);

        curl_close($curl);
        return json_decode($response);
    }
}
?>