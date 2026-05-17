<?php


//include('library/raveEventHandlerInterface.php');
require("library/Bill.php");
use Flutterwave\Bill;

$data = array(
    "country"=> "NG",
    "customer"=> "+2348148776644",
    "amount"=> 0,
    "is_airtime"=>false,
    "recurrence"=> "ONCE",
    "type"=> "MTN 200 MB DATA BUNDLE",
    "reference"=> "93110496244333"

);

//sample payload for bulkBill()
$bulkdata = array(
    "bulk_reference"=>"edf-12de5223d2f3243474543",
    "callback_url"=>"https://webhook.site/96374895-154d-4aa0-99b5-709a0a128674",
    "bulk_data"=> array(
        array(
        "country"=> "NG",
        "customer"=> "+23490803840303",
        "amount"=> 500,
        "recurrence"=> "WEEKLY",
        "type"=> "AIRTIME",
        "reference"=>"930049200929"
        ),
        array(
        "country"=>"NG",
        "customer"=> "+23490803840304",
        "amount"=> 500,
        "recurrence"=> "WEEKLY",
        "type"=>"AIRTIME",
        "reference"=>"930004912332434232"
        )
    ),
);

$getdata = array(
    //"reference"=>"edf-12de5223d2f32434753432",
     //"id"=>"BIL108",
     "product_id"=>"BIL108"
);

$payment = new Bill();
//$result = $payment->payBill($data);//create a bill paymenr
//$bulkresult = $payment->bulkBill($bulkdata);//create bulk bill payment....
//$getresult = $payment->getBill($getdata);// get bulk result....
//$getAgencies = $payment->getAgencies();
//$getBillCategories = $payment->getBillCategories();
$getBiller = $payment->getBillersProducts($getdata);
print_r($getBiller);