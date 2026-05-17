<?php
require_once '../inc/user_session.inc.php';

$PAGE_TITLE = 'Topup';
$URL_NAME = 'dashboard/topup';
require_once '../inc/accessbility_controller.inc.php';

/*if($earn_amount_response_if_available = $WalletController->Update_Successful_Remove_Wallet_Money_Trans_Status('mtn',49,'486371970260883848','azzeetech.it@gmail.com')){
  print_r($earn_amount_response_if_available);
}

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://www.superjaraapi.com/api/network/',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'GET',
  CURLOPT_HTTPHEADER => array(
    'Authorization: Token d15bf2100eee9c28ff7b31db799decfeac08005d',
    'Content-Type: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
$MTN_PLAN = json_decode($response)->AIRTEL_PLAN;


print_r($MTN_PLAN);

foreach ($MTN_PLAN as $key) {
  $TopupController->Store_All_SME_DATA_Plan($key->dataplan_id,$key->network,$key->plan_amount,$key->plan_amount,$key->plan.' '.$key->plan_type,$key->month_validate);
}

*/

/*$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://www.superjaraapi.com/api/data/',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
    "network": 1,
    "mobile_number": "09029096951",
    "plan": 222,
    "Ported_number": true
}',
  CURLOPT_HTTPHEADER => array(
    'Authorization: Token d15bf2100eee9c28ff7b31db799decfeac08005d',
    'Content-Type: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;
*/

$Operator = $Reloadly_API->GenerateReloadlyAPIKey();
print_r($Operator->access_token);

/*
$num= "08148776644";
$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://www.datahouse.com.ng/api/data/',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{"network": "1",
"mobile_number": "08148776644",
"plan": "140",
"Ported_number":true}',
  CURLOPT_HTTPHEADER => array(
    'Authorization: Token 35105b459ac9ed58b1e4d7c4da407f2baf22bf51',
    'Content-Type: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;


$url = 'https://www.md5online.org/api.php';
$key = 'YOUR_VIP_KEY';

//manage your input here, from a form, a file or a database
$md5 = "d3c8e06e57cc1af7ebdba01427e62bc2";

$result = file_get_contents($url."?p=".$key."&h=".$md5);

//do your post action here, with the result
echo $result;




//User Credentials to be checked
$user_id = "Codespeedy";
$password = "User123";
//Key to decrypt
$key = "qwertyuiop"; 
//Comparing with our hashed data
if(md5(md5($user_id . $password) . $key)=='6193eccf4cd9fba9894f093ca103c3f7')
  echo "<br>Username:".$user_id."<br>Password:".$password;




//User Credentials
$user_id = "Codespeedy";
$password = "User123";
//catalyst to the encryption
$key = "qwertyuiop"; 
$encrypt_password = md5(md5($user_id . $password) . $key);
//display encrypted password
echo $encrypt_password;




//data input by the user
$data = "Hello Codespeedy";
//Checcking with our hashed data
if (md5($data) == "ea12b5f69c8ef8d3a89e0437fe6fca88")
  {
  echo "<br>Hello Codespeedy";
  exit;
  }
*/

//require_once '../inc/user_session.inc.php';

//echo  $WalletController->Get_Discount_For_Product('smile',2000);

//echo md5('6541');

/*

  $curl = curl_init();
curl_setopt_array($curl, array(
CURLOPT_URL => "https://easyaccess.com.ng/api/neco_v2.php",
CURLOPT_RETURNTRANSFER => true,
CURLOPT_ENCODING => "",
CURLOPT_MAXREDIRS => 10,
CURLOPT_TIMEOUT => 0,
CURLOPT_FOLLOWLOCATION => true,
CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
CURLOPT_CUSTOMREQUEST => "POST",
CURLOPT_POSTFIELDS => array(
'no_of_pins' =>1,
),
CURLOPT_HTTPHEADER => array(
"AuthorizationToken: 2c7931b91deaf7b29c8b92398c949d09", //replace this with your authorization_token
"cache-control: no-cache"
),
));
$response = curl_exec($curl);
curl_close($curl);
echo $response;


*/

// // Retrieve the request's body
// $body = @file_get_contents("php://input");
// $signature = (isset($_SERVER['HTTP_X_PAYSTACK_SIGNATURE']) ? $_SERVER['HTTP_X_PAYSTACK_SIGNATURE'] : '');

// /* It is a good idea to log all events received. Add code *
//  * here to log the signature and body to db or file       */

// if (!$signature) {
//     // only a post with paystack signature header gets our attention
//     exit();
// }

// define('PAYSTACK_SECRET_KEY','sk_xxxx_xxxxxx');
// // confirm the event's signature
// if( $signature !== hash_hmac('sha512', $body, PAYSTACK_SECRET_KEY) ){
//   // silently forget this ever happened
//   exit();
// }

// http_response_code(200);
// // parse event (which is json string) as object
// // Give value to your customer but don't give any output
// // Remember that this is a call from Paystack's servers and
// // Your customer is not seeing the response here at all
// $event = json_decode($body);
// switch($event->event){
//     // charge.success
//     case 'charge.success':
//         // TIP: you may still verify the transaction
//             // before giving value.
//         break;
// }
// exit();

/*$result_rsult_pin_bought =[];

$Airtime_result = array( 'success' => 'true', 'message' => 'E-pin was Successful', 'pin' => '215763897882', 'pin2' => '215763897882<=>SSS12334', 'amount' => 705, 'transaction_date' => '17-01-2022 11:10:44 pm','reference_no' => 'ID86348767297', 'status' => 'Successful' );


$Airtime_result = json_encode($Airtime_result);
$Airtime_result = json_decode($Airtime_result);
if(isset($Airtime_result->pin)){
  array_push($result_rsult_pin_bought, str_replace("<=>"," Serial Number : ",$Airtime_result->pin));
}

if(isset($Airtime_result->pin2)){
  array_push($result_rsult_pin_bought, str_replace("<=>"," Serial Number : ",$Airtime_result->pin2));
}

foreach ($result_rsult_pin_bought as $value) {
  echo $value;
}*/

/*$curl = curl_init();
curl_setopt_array($curl, array(
    CURLOPT_URL => "https://api.paystack.co/bank/resolve?account_number=0062343539&bank_code=044",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => "",
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 30,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "GET",
    CURLOPT_HTTPHEADER => array(
    "Authorization: Bearer sk_live_8342ee8de6b75d18a7d8a41afd668e71a3eb6963",
    "Cache-Control: no-cache",
    ),
));
$response = curl_exec($curl);
$err = curl_error($curl);
curl_close($curl);
if ($err) {
    echo "cURL Error #:" . $err;
} else {
    echo $response;
}*/

/* $url = "https://api.paystack.co/transferrecipient";
  $fields = [
    'type' => "nuban",
    'name' => 'ABDULAZEEZ ADENIYI ABDULWAHEED',
    'account_number' => '0062343539',
    'bank_code' => '044',
    'currency' => "NGN"
  ];
  $fields_string = http_build_query($fields);
  //open connection
  $ch = curl_init();
  
  //set the url, number of POST vars, POST data
  curl_setopt($ch,CURLOPT_URL, $url);
  curl_setopt($ch,CURLOPT_POST, true);
  curl_setopt($ch,CURLOPT_POSTFIELDS, $fields_string);
  curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    "Authorization: Bearer sk_test_372870f260359a4c764f533ec358884a1398b831",
    "Cache-Control: no-cache",
  ));
  
  //So that curl_exec returns the contents of the cURL; rather than echoing it
  curl_setopt($ch,CURLOPT_RETURNTRANSFER, true); 
  
  //execute post
  $result = curl_exec($ch);
  print_r(json_decode($result));*/

/*
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
'mobileno' => '08148776644',
'dataplan' => 45,
),
CURLOPT_HTTPHEADER => array(
"AuthorizationToken: 46515507fc6b5da70ed86f87db9855e0", //replace this with your authorization_token
"cache-control: no-cache"
),
));
$response = curl_exec($curl);
curl_close($curl);

if($response){
   print_r(json_decode($response));
}else{
  return false;
}*/

/*$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://www.datahouse.com.ng/api/topup/',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>' {"network": "1",
 "amount" :"300", 
 "mobile_number": "08148776644",
 "Ported_number":true,
 "airtime_type":"VTU"}',
  CURLOPT_HTTPHEADER => array(
    'Authorization: Token 630e90c465df180bb0b542dc9b40a2143c65c832',
    'Content-Type: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;*/

/*
$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://www.datahouse.com.ng/api/billpayment/',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{ "disco_name": "16",
"amount" : "500",
"meter_number": "45059894142", 
"MeterType": "1" }
',
  CURLOPT_HTTPHEADER => array(
    'Authorization: Token 630e90c465df180bb0b542dc9b40a2143c65c832',
    'Content-Type: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;

*/

/*$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://www.datahouse.com.ng/api/data/',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{"network": 1,
"mobile_number": "08148776644",
"plan": 119,
"Ported_number":true}',
  CURLOPT_HTTPHEADER => array(
    'Authorization: Token 630e90c465df180bb0b542dc9b40a2143c65c832',
    'Content-Type: application/json'
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;

*/

/*$url = "https://api.paystack.co/subaccount";
  $fields = [
    'business_name' => "Developer",
    'bank_code' => "033",
    'account_number' => "2112393049",
    'percentage_charge' => 0.2
  ];
  $fields_string = http_build_query($fields);
  //open connection
  $ch = curl_init();
  
  //set the url, number of POST vars, POST data
  curl_setopt($ch,CURLOPT_URL, $url);
  curl_setopt($ch,CURLOPT_POST, true);
  curl_setopt($ch,CURLOPT_POSTFIELDS, $fields_string);
  curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    "Authorization: Bearer sk_live_dbaf81d66bd8b4b0bf1973ce83c6fae6500c885b",
    "Cache-Control: no-cache",
  ));
  
  //So that curl_exec returns the contents of the cURL; rather than echoing it
  curl_setopt($ch,CURLOPT_RETURNTRANSFER, true); 
  
  //execute post
  $result = curl_exec($ch);
  echo $result;*/
?>


<script type="text/javascript">
function md5cycle(x, k) {
    var a = x[0],
        b = x[1],
        c = x[2],
        d = x[3];

    a = ff(a, b, c, d, k[0], 7, -680876936);
    d = ff(d, a, b, c, k[1], 12, -389564586);
    c = ff(c, d, a, b, k[2], 17, 606105819);
    b = ff(b, c, d, a, k[3], 22, -1044525330);
    a = ff(a, b, c, d, k[4], 7, -176418897);
    d = ff(d, a, b, c, k[5], 12, 1200080426);
    c = ff(c, d, a, b, k[6], 17, -1473231341);
    b = ff(b, c, d, a, k[7], 22, -45705983);
    a = ff(a, b, c, d, k[8], 7, 1770035416);
    d = ff(d, a, b, c, k[9], 12, -1958414417);
    c = ff(c, d, a, b, k[10], 17, -42063);
    b = ff(b, c, d, a, k[11], 22, -1990404162);
    a = ff(a, b, c, d, k[12], 7, 1804603682);
    d = ff(d, a, b, c, k[13], 12, -40341101);
    c = ff(c, d, a, b, k[14], 17, -1502002290);
    b = ff(b, c, d, a, k[15], 22, 1236535329);

    a = gg(a, b, c, d, k[1], 5, -165796510);
    d = gg(d, a, b, c, k[6], 9, -1069501632);
    c = gg(c, d, a, b, k[11], 14, 643717713);
    b = gg(b, c, d, a, k[0], 20, -373897302);
    a = gg(a, b, c, d, k[5], 5, -701558691);
    d = gg(d, a, b, c, k[10], 9, 38016083);
    c = gg(c, d, a, b, k[15], 14, -660478335);
    b = gg(b, c, d, a, k[4], 20, -405537848);
    a = gg(a, b, c, d, k[9], 5, 568446438);
    d = gg(d, a, b, c, k[14], 9, -1019803690);
    c = gg(c, d, a, b, k[3], 14, -187363961);
    b = gg(b, c, d, a, k[8], 20, 1163531501);
    a = gg(a, b, c, d, k[13], 5, -1444681467);
    d = gg(d, a, b, c, k[2], 9, -51403784);
    c = gg(c, d, a, b, k[7], 14, 1735328473);
    b = gg(b, c, d, a, k[12], 20, -1926607734);

    a = hh(a, b, c, d, k[5], 4, -378558);
    d = hh(d, a, b, c, k[8], 11, -2022574463);
    c = hh(c, d, a, b, k[11], 16, 1839030562);
    b = hh(b, c, d, a, k[14], 23, -35309556);
    a = hh(a, b, c, d, k[1], 4, -1530992060);
    d = hh(d, a, b, c, k[4], 11, 1272893353);
    c = hh(c, d, a, b, k[7], 16, -155497632);
    b = hh(b, c, d, a, k[10], 23, -1094730640);
    a = hh(a, b, c, d, k[13], 4, 681279174);
    d = hh(d, a, b, c, k[0], 11, -358537222);
    c = hh(c, d, a, b, k[3], 16, -722521979);
    b = hh(b, c, d, a, k[6], 23, 76029189);
    a = hh(a, b, c, d, k[9], 4, -640364487);
    d = hh(d, a, b, c, k[12], 11, -421815835);
    c = hh(c, d, a, b, k[15], 16, 530742520);
    b = hh(b, c, d, a, k[2], 23, -995338651);

    a = ii(a, b, c, d, k[0], 6, -198630844);
    d = ii(d, a, b, c, k[7], 10, 1126891415);
    c = ii(c, d, a, b, k[14], 15, -1416354905);
    b = ii(b, c, d, a, k[5], 21, -57434055);
    a = ii(a, b, c, d, k[12], 6, 1700485571);
    d = ii(d, a, b, c, k[3], 10, -1894986606);
    c = ii(c, d, a, b, k[10], 15, -1051523);
    b = ii(b, c, d, a, k[1], 21, -2054922799);
    a = ii(a, b, c, d, k[8], 6, 1873313359);
    d = ii(d, a, b, c, k[15], 10, -30611744);
    c = ii(c, d, a, b, k[6], 15, -1560198380);
    b = ii(b, c, d, a, k[13], 21, 1309151649);
    a = ii(a, b, c, d, k[4], 6, -145523070);
    d = ii(d, a, b, c, k[11], 10, -1120210379);
    c = ii(c, d, a, b, k[2], 15, 718787259);
    b = ii(b, c, d, a, k[9], 21, -343485551);

    x[0] = add32(a, x[0]);
    x[1] = add32(b, x[1]);
    x[2] = add32(c, x[2]);
    x[3] = add32(d, x[3]);

}

function cmn(q, a, b, x, s, t) {
    a = add32(add32(a, q), add32(x, t));
    return add32((a << s) | (a >>> (32 - s)), b);
}

function ff(a, b, c, d, x, s, t) {
    return cmn((b & c) | ((~b) & d), a, b, x, s, t);
}

function gg(a, b, c, d, x, s, t) {
    return cmn((b & d) | (c & (~d)), a, b, x, s, t);
}

function hh(a, b, c, d, x, s, t) {
    return cmn(b ^ c ^ d, a, b, x, s, t);
}

function ii(a, b, c, d, x, s, t) {
    return cmn(c ^ (b | (~d)), a, b, x, s, t);
}

function md51(s) {
    txt = '';
    var n = s.length,
        state = [1732584193, -271733879, -1732584194, 271733878],
        i;
    for (i = 64; i <= s.length; i += 64) {
        md5cycle(state, md5blk(s.substring(i - 64, i)));
    }
    s = s.substring(i - 64);
    var tail = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    for (i = 0; i < s.length; i++)
        tail[i >> 2] |= s.charCodeAt(i) << ((i % 4) << 3);
    tail[i >> 2] |= 0x80 << ((i % 4) << 3);
    if (i > 55) {
        md5cycle(state, tail);
        for (i = 0; i < 16; i++) tail[i] = 0;
    }
    tail[14] = n * 8;
    md5cycle(state, tail);
    return state;
}

/* there needs to be support for Unicode here,
 * unless we pretend that we can redefine the MD-5
 * algorithm for multi-byte characters (perhaps
 * by adding every four 16-bit characters and
 * shortening the sum to 32 bits). Otherwise
 * I suggest performing MD-5 as if every character
 * was two bytes--e.g., 0040 0025 = @%--but then
 * how will an ordinary MD-5 sum be matched?
 * There is no way to standardize text to something
 * like UTF-8 before transformation; speed cost is
 * utterly prohibitive. The JavaScript standard
 * itself needs to look at this: it should start
 * providing access to strings as preformed UTF-8
 * 8-bit unsigned value arrays.
 */
function md5blk(s) {
    /* I figured global was faster.   */
    var md5blks = [],
        i; /* Andy King said do it this way. */
    for (i = 0; i < 64; i += 4) {
        md5blks[i >> 2] = s.charCodeAt(i) +
            (s.charCodeAt(i + 1) << 8) +
            (s.charCodeAt(i + 2) << 16) +
            (s.charCodeAt(i + 3) << 24);
    }
    return md5blks;
}

var hex_chr = '0123456789abcdef'.split('');

function rhex(n) {
    var s = '',
        j = 0;
    for (; j < 4; j++)
        s += hex_chr[(n >> (j * 8 + 4)) & 0x0F] +
        hex_chr[(n >> (j * 8)) & 0x0F];
    return s;
}

function hex(x) {
    for (var i = 0; i < x.length; i++)
        x[i] = rhex(x[i]);
    return x.join('');
}

function md5(s) {
    return hex(md51(s));
}

/* this function is much faster,
so if possible we use it. Some IEs
are the only ones I know of that
need the idiotic second function,
generated by an if clause.  */

function add32(a, b) {
    return (a + b) & 0xFFFFFFFF;
}

//alert(md5('6541'))
</script>