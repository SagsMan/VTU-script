<?php

$ip = ($_SERVER['REMOTE_ADDR'])?$_SERVER['REMOTE_ADDR']:$_SERVER['REMOTE_HOST'];
if( $ip != "35.242.133.146") die("Invalid IP");

$raw_request = file_get_contents('php://input');

  $request_array = json_decode( $raw_request,true );
  
$host = '127.0.0.1';
$port = 3306;
$database = 'eduowrav_payboxed';
$user = 'eduowrav_payboxed';
$password = '64c4*[]cG9Cb';

$connect = mysqli_connect($host, $user, $password, $database, $port);
// your Secret Key found in your monnidy dashboard, developer menu


$SECRET_KEY = '881J3RXH6Z6LDVJWG76P1YHW8VCECAE5';


// next, we need to compute and compare hash sent via header as "monnify-signature". To check if it is same as hash we generate using our secret key and the request payload. If it is not then the request is rejected
$signature = $_SERVER['HTTP_MONNIFY_SIGNATURE']; // monnify-signature is sent as an header to your webhook endpoint, we get the value and store in this variable
$computedHash = hash_hmac('sha512', $raw_request, $SECRET_KEY); // hash generated
if( $computedHash != $signature){
    echo "404";
}else{
  
    // echo "OK";
    $event_type = $request_array['eventType'];
$email = $request_array['eventData']['customer']['email'];
$charge = ($request_array['eventData']['amountPaid']) < 10000 ? 50 : 100 ;//0.02 * ($request_array['eventData']['amountPaid']);
$amount_paid = $request_array['eventData']['amountPaid']- $charge;


$amt = $request_array['eventData']['amountPaid'];
$reference =$request_array['eventData']['transactionReference'] ;
if($event_type==="SUCCESSFUL_TRANSACTION"){
    $exist = mysqli_query($connect, "SELECT * FROM wallet_history_tbl WHERE trans_id = '$reference' ");
    if(mysqli_num_rows($exist) > 0 ){
        echo "OK";
    }else{
 
    $updateQuery = mysqli_query($connect,"UPDATE wallet_tbl SET balance = balance + $amount_paid WHERE user_id = '$email'");

     $insertHistory = mysqli_query($connect,"INSERT INTO wallet_history_tbl (trans_id,email,trans_amount,trans_date,status,wallet_status) VALUES ('$reference','$email','$amt',now(),'0','credit')");
if (!$insertHistory) {
    echo "404";//"Error inserting wallet history: " . mysqli_error($connect);
}else{
    echo "OK";
}

        
    }
}
    // updatepayment($event_type,$amount_paid,$email);
}

 
// parse request to array

?>