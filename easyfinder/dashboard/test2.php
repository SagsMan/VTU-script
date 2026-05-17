<?php

$curl = curl_init();
curl_setopt_array($curl, array(
CURLOPT_URL => "https://easyaccess.com.ng/api/data.php",
CURLOPT_RETURNTRANSFER => true,
CURLOPT_ENCODING => "",
CURLOPT_MAXREDIRS => 10,
CURLOPT_TIMEOUT => 0,
CURLOPT_FOLLOWLOCATION => true,
CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
CURLOPT_CUSTOMREQUEST => "POST",
CURLOPT_POSTFIELDS => array(
'network' =>01,
'mobileno' => '08062466112',
'dataplan' => 51,
'client_reference' => 'tranx68965989534243243242', //update this on your script to receive webhook notifications
),
CURLOPT_HTTPHEADER => array(
"AuthorizationToken: 2c7931b91deaf7b29c8b92398c949d09", //replace this with your authorization_token
"cache-control: no-cache"
),
));
$response = curl_exec($curl);
curl_close($curl);
echo $response;