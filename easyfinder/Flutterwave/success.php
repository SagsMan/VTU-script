<?php

$curl = curl_init();

curl_setopt_array($curl, [
  CURLOPT_URL => "https://api.flutterwave.com/v3/billers/BIL099/products/AT099/orders",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => "{\"customer\":{\"name\":\"Ekene Eze\",\"email\":\"ekene@flw.com\",\"phone_number\":\"08148776644\"},\"country\":\"NG\",\"amount\":\"50\",\"reference\":\"FLWTTOT100545429\"}",
  CURLOPT_HTTPHEADER => [
    "Accept: application/json",
    "Authorization: Bearer FLWSECK-82946d87fae3107c2619caa716590409-X",
    "Content-Type: application/json"
  ],
]);

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}

   