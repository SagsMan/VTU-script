<?php
require_once '../inc/user_session.inc.php';

$PAGE_TITLE = 'Generate Exam PIN';
$URL_NAME = 'dashboard/exam-pin';

$EXAMS = ["waec-registration" => ["name" => "WAEC Reg.", "variation" => "api/service-variations?serviceID=waec-registration", "id_verify" => null, "pay" => "api/pay"], "waec" => ["name" => "WAEC Result Checker", "variation" => "api/service-variations?serviceID=waec",  "id_verify" => null, "pay" => "api/pay"], "jamb" => ["name" => "JAMB PIN", "variation" => "api/service-variations?serviceID=jamb",  "id_verify" => "api/merchant-verify", "pay" => "api/pay"]];

require_once '../inc/accessbility_controller.inc.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST'){
  $post_content = file_get_contents('php://input');
  $post = json_decode($post_content, true);

  if (isset($post["pay"]) && $post["pay"] == true && isset($post["pin"]) && !empty($post["pin"]) && isset($post["id"]) && !empty($post["id"]) && isset($post["plan"]) && !empty($post["plan"]) && isset($post["number"]) && !empty($post["number"]) && isset($post["amount"]) && !empty($post["amount"])){
    $pin = md5($post["pin"]);
    $id = $post["id"];
    $plan = $post["plan"];
    $number = $post["number"];
    $trans_id = trim($WalletController->Generate_Trans_id());
    $amount = $post["amount"];

    if ($pin != $Auth->pin){
    	echo json_encode(["status" => "failed", "msg" => "incorrect pin"]);
        die();
    }

    if (!$WalletController->Check_Available_Balance_From_Wallet_To_Make_Transaction($amount, $Auth->email)) {
        echo json_encode(["status" => "failed", "msg" => "insufficient wallet balance"]);
        die();
    }

    if (!isset($EXAMS[$id])){
        echo json_encode(["status" => "failed", "msg" => "unknown exam service", "data" => []]);
        die();
    }

    $exam = $EXAMS[$id];

    $url = VTPASS_LINK.$exam["pay"];

    if ($id == "jamb"){
    	$params = [
          "request_id" => $trans_id,
          "billersCode" => $number,
          "serviceID" => $id,
          "variation_code" => $plan,
          "phone" =>  $Auth->phone,
       ];
    }else{
       $params = [
          "request_id" => $trans_id,
          "serviceID" => $id,
          "variation_code" => $plan,
          "phone" => $Auth->phone,
      ];
    }

    if ($WalletController->Make_Tansaction_From_My_Wallet($trans_id, $amount, $Auth->email)){

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, CURL_SSL_VERIFY);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($params));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Content-Type: application/json',
        'Accept: application/json',
        'Authorization: Basic ' . VTPASS_AUTH,
    ]);

    $res = curl_exec($ch);

    if (curl_errno($ch)) {
        $WalletController->Update_Refund_failed_Wallet_Money_Trans_Status($trans_id, $Auth->email, $amount);
        echo json_encode(["status" => "failed", "msg" => "cURL Error: " . curl_error($ch), "data" => []]);
    }

    $json = json_decode($res, true);

    if (!$json["code"] || $json["code"] != "000" || $json["content"]["error"]){
        $WalletController->Update_Refund_failed_Wallet_Money_Trans_Status($trans_id, $Auth->email, $amount);
        echo json_encode(["status" => "failed", "msg" => "failed trying to pay"]);
        die();
    }

    $data = $json["content"];
    if (strtolower($data["transactions"]["status"]) == "delivered"){
        $WalletController->Update_Successful_Remove_Wallet_Money_Trans_Status('exam-tv', $amount, $trans_id, $Auth->email);
        $text = "";
        if ($id == "jamb"){
        	$pin = trim(explode(":", $json["Pin"])[1]);
        	$text = "PIN: {$pin}";
        }else if ($id == "waec-registration"){
        	foreach ($json["tokens"] as $key => $tk){
        		$text .= "Token ".($key + 1).": {$tk}. ";
        	}
        }else if ($id == "waec"){
        	foreach ($json["cards"] as $key => $card){
        		$text .= "Card ".($key + 1).": Serial No. = {$card['Serial']}, PIN = {$card['Pin']}. ";
        	}
        }
        echo json_encode(["status" => "success", "msg" => "payment made successfully", "data" => $text]);
    }else{
        $WalletController->Update_Refund_failed_Wallet_Money_Trans_Status($trans_id, $Auth->email, $amount);
        echo json_encode(["status" => "failed", "msg" => "something went wrong"]);
    }
    }
   }

  if (isset($post["verify"]) && isset($post["id_number"]) && !empty($post["id_number"]) && isset($post["id"]) && !empty($post["id"]) && isset($post["type"]) && !empty($post["type"])){
    $id_num = $post["id_number"];
    $id = $post["id"];
    $type = $post["type"];

    if (!isset($EXAMS[$id])){
        echo json_encode(["status" => "failed", "msg" => "unknown exam service", "data" => []]);
        die();
    }

    $exam = $EXAMS[$id];

    if ($exam["id_verify"] == null){
        echo json_encode(["status" => "failed", "msg" => "{$id} does not require profile ID verification"]);
        die();
    }

    $url = VTPASS_LINK.$exam["id_verify"];

    $params = [
    'billersCode' => $id_num,
    'serviceID' => $id,
    'type' => $type,
    ];

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, CURL_SSL_VERIFY);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($params));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Content-Type: application/json',
        'Accept: application/json',
        'Authorization: Basic ' . VTPASS_AUTH,
    ]);

    $res = curl_exec($ch);

    if (curl_errno($ch)) {
        echo json_encode(["status" => "failed", "error" => "cURL Error: " . curl_error($ch), "data" => []]);
    }

    $json = json_decode($res, true);

    if (!$json["code"] || $json["code"] != "000" || $json["content"]["error"]){
        echo json_encode(["status" => "failed", "msg" => "failed trying to verifying id number"]);
        die();
    }

    $data = $json["content"];
        $array = [
        "name" => $data["Customer_Name"],
        ];
    echo json_encode(["status" => "success", "data" => $array]);
 }

if (isset($post["variation"]) && isset($post["id"]) && !empty($post["id"])){
    $id = $post["id"];
    if (!isset($EXAMS[$id])){
        echo json_encode(["status" => "failed", "msg" => "unknown exam service", "data" => []]);
        die();
    }

    $exam = $EXAMS[$id];
    $url = VTPASS_LINK.$exam["variation"];
    $res = file_get_contents($url);
    $json = json_decode($res, true);
    if (!isset($json["response_description"]) || $json["response_description"] != "000" || $json["content"]["error"]){
        echo json_encode(["status" => "failed", "msg" => "failed trying to fetch variations", "data" => []]);
        die();
    }
    $variations = $json["content"]["variations"];
    if (!$variations){
        echo json_encode(["status" => "failed", "msg" => "service variations not available", "data" => []]);
        die();
    }
    $data = [];
    foreach ($variations as $item){
            $c_fee = $json["content"]["convinience_fee"];
            $amount = (int) $item["variation_amount"];
            if (strpos($c_fee, "%") != FALSE){
                $num = (int) str_replace("%", "", $c_fee);
                $fees = ($num/100) * $amount;
                $amount += $fees;
            }else if (strpos($c_fee, "N") != FALSE || strpos($c_fee, "n") != FALSE){
                $fees = (int) str_replace("n", "", str_replace("N", "", $c_fee));
                $amount += $fees;
            }

            $data[] = [
                "id" => $item["variation_code"],
                "name" => $item["name"]." - ".$amount,
                "amount" => $amount,
            ];
    }
    echo json_encode(["status" => "success", "data" => $data]);
}
exit();
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <?php require_once 'layout/header-propt.inc.php'; ?>

    <title><?= $PAGE_TITLE . ' | ' . SITE_TITLE ?> </title>
    <style type="text/css">
        table {
            width: 100%
        }

        #table th,
        #table td {
            border: none;
            padding: 7px;
        }
    </style>
</head>

<body>

    <?php require_once 'layout/preloader.inc.php'; ?>

    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">


        <?php
        require_once 'layout/header.inc.php';
        require_once 'layout/sidebar.inc.php';
        ?>


        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <?php include 'layout/minor-top-navbar.inc.php'; ?>
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4 style="color: #003366; font-size: 20px"><?= $PAGE_TITLE ?></h4>

                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)"><?= SITE_TITLE ?> </a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)"><?= $PAGE_TITLE ?></a></li>
                        </ol>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-12">
                        <div class="card  text-white bg-secondary">

                        <div class="card-header">
                            <h4 class="card-title text-white"><?= $PAGE_TITLE; ?></h4>
                        </div>
                        <div class="card-body">
                              <div class="form-group">
                                    <label class="text-label">Exam Type : </label>
                                    <div class="input-group">
                                    	<select onchange="toggleBtns('verify_id'); getVariations(this); JambActions(this); hideText();" name="exam_type" id="exam_type" required="">
                                    	<?php foreach ($EXAMS as $key => $exam):?>
                                    		<option value="<?= $key; ?>"><?= $exam['name']; ?></option>
                                    	<?php endforeach; ?>
                                    	</select>
                                    </div>
                                </div>
                                <div class="form-group d-none">
                                    <label class="text-label">Choose Plan : </label>
                                    <div id="exam-plans" class="input-group">
                                    </div>
                                </div>
                                <div id="verify-tab" class="d-none">
                                <div class="form-group">
                                    <label id="id_number_label" class="text-label">Profile ID : </label>
                                    <div class="input-group">
                                        <input onchange="toggleBtns('verify_id'); JambActions();" type="number" name="id_number" id="id_number" required="" class=""
                                            autocomplete="off" placeholder="Eg: 0123456789">
                                    </div>
                                    <div class="mt-1"><small id="id_details"></small></div>
                                </div>

                                <button id="verify_id" onclick="verifyID(this)" class="btn action-btns btn-danger">Verify ID</button>
                                </div>
                                <div id="success-text" class="d-none m-2"></div>
                                <button id="pay_now" onclick="payNow(this)" class="btn action-btns btn-success d-none">Pay Now</button>

                        </div>

                        </div>
                    </div>

                </div>








            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->

    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModalpopover">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Authentication PIN</h5>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="mb-1"><strong>Enter Your PIN : </strong></label>
                        <div class="input-group">
                            <input type="password" name="pin" id="pin" value="" required="" class="form-control" autocomplete="off">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger light" data-dismiss="modal">Close</button>
                    <a href="#" class="btn btn-primary" onclick="processPay()" id="btn-submit" data-dismiss="modal">Continue</a>
                </div>

            </div>
        </div>


    </div>
    <?php
    require_once 'layout/footer.inc.php';
    require_once 'layout/footer-propt.inc.php';
    ?>



    <script type="text/javascript">
        var bURL = "<?= SITE_URL."easyfinder/".$URL_NAME ?>";

        function hideText(){
        	let text = document.querySelector("#success-text");
            text.innerText = "";
            text.classList.add("d-none");
        }

        function toggleBtns(id){
            document.querySelectorAll(".action-btns").forEach(function(btn){
                if (btn.id == id){
                    btn.classList.remove("d-none");
                }else{
                    btn.classList.add("d-none");
                }
            })
        }

        function JambActions(el){
        	if (!el){
        		document.querySelector("#exam_type");
        	}
            let tab = document.querySelector("#verify-tab");
            if (el.value == "jamb"){
                toggleBtns("verify_id");
                tab.classList.remove("d-none");
            }else{
                tab.classList.add("d-none");
                toggleBtns("pay_now");
            }
        }

        function processPay(){
            let pin = document.querySelector("#pin").value;
            let text = document.querySelector("#success-text");
            text.innerText = "";
            text.classList.add("d-none");
            if (!pin){
                return;
            }
            let exam = document.querySelector("#exam_type").value, plan = document.querySelector("#exam_plans").value, number = document.querySelector("#id_number").value;

            if (!number || number == ""){
            	number = 1;
            }

            plan = plan.split("{BRK}");

            const parameters = {
                pay: true,
                pin: pin,
                id: exam,
                plan: plan[0],
                amount: plan[1],
                number: number,
            };
            fetch(bURL, {
                method: 'POST',
                headers: {'Content-Type': 'application/json',},
                body: JSON.stringify(parameters),
            }).then(res => res.json()).then(data => {
                if (!data.status){
                    toastr.error("Something went wrong. Please refresh and try again", "Error Occurs!", {
                        positionClass: "toast-top-right",
                        timeOut: 5e3,
                        closeButton: !0,
                        debug: !1,
                        newestOnTop: !0,
                        progressBar: !0,
                        preventDuplicates: !0,
                        onclick: null,
                        showDuration: "300",
                        hideDuration: "1000",
                        extendedTimeOut: "1000",
                        showEasing: "swing",
                        hideEasing: "linear",
                        showMethod: "fadeIn",
                        hideMethod: "fadeOut",
                        tapToDismiss: !1
                    });
                }else{
                    if (data.status == "success"){
                    	let text = document.querySelector("#success-text");
                    	text.innerText = data.data;
                    	text.classList.remove("d-none");
                        toastr.success(data.msg, "Success!", {
                        positionClass: "toast-top-right",
                        timeOut: 5e3,
                        closeButton: !0,
                        debug: !1,
                        newestOnTop: !0,
                        progressBar: !0,
                        preventDuplicates: !0,
                        onclick: null,
                        showDuration: "300",
                        hideDuration: "1000",
                        extendedTimeOut: "1000",
                        showEasing: "swing",
                        hideEasing: "linear",
                        showMethod: "fadeIn",
                        hideMethod: "fadeOut",
                        tapToDismiss: !1
                    });
                    }else{
                    	toastr.error(data.msg, "Error Occurs!", {
                        positionClass: "toast-top-right",
                        timeOut: 5e3,
                        closeButton: !0,
                        debug: !1,
                        newestOnTop: !0,
                        progressBar: !0,
                        preventDuplicates: !0,
                        onclick: null,
                        showDuration: "300",
                        hideDuration: "1000",
                        extendedTimeOut: "1000",
                        showEasing: "swing",
                        hideEasing: "linear",
                        showMethod: "fadeIn",
                        hideMethod: "fadeOut",
                        tapToDismiss: !1
                    });
                    }
                }
                if (exam.toLowerCase() != "jamb"){
                    toggleBtns("pay_now");
                }else{
                    toggleBtns("verify_id");
                }
            });
        }

        function payNow(){
            const myModalElement = document.getElementById('exampleModalpopover');
            const myModal = new bootstrap.Modal(myModalElement);
            myModal.show();
        }

        function verifyID(btn){
        	plan = document.querySelector("#exam_plans").value;
        	plan = plan.split("{BRK}")[0];

        	if (!plan){
        		return;
        	}

            let id_number = document.querySelector("#id_number").value, exam = document.querySelector("#exam_type").value, id_d = document.querySelector("#id_details");

            id_d.innerHTML = "";

            if (!id_number){
                id_d.innerText = "Enter your exam profile ID number";
                return;
            }

            if (!exam){
                id_d.innerText = "Ooops... Refresh and try again";
                return; 
            }

            parameters = {
                verify:true,
                id_number: id_number,
                type: plan,
                id: exam,
            };
            fetch(bURL, {
                method: 'POST',
                headers: {'Content-Type': 'application/json',},
                body: JSON.stringify(parameters),
            }).then(res => res.text()).then(data => {
                if (!data.status || data.status != "success"){
                    id_d.innerText = "Failed to verify ID number";
                    return;
                }
                data = data.data;
                id_d.innerHTML = `<strong>Name: </strong> - ${data.name}`;
                toggleBtns('pay_now');
            });
        }

        function getVariations(el){
            if (!el){
                el = document.querySelector("#exam_type");
            }
            let serviceId = el.value;
            let exam_plans = document.querySelector("#exam-plans");
            document.querySelector("#id_details").innerHTML = "";
            exam_plans.innerHTML = "";
            exam_plans.parentNode.classList.add("d-none");
            if (serviceId != ""){
                parameters = {
                    "variation": true,
                    "id": serviceId,
                };
                fetch(bURL, {
                    method: 'POST',
                    headers: {'Content-Type': 'application/json',},
                    body: JSON.stringify(parameters),
                }).then(res => res.json()).then(data => {
                    if (!data.status || data.status != "success"){
                        return;
                    }

                        data = data.data;
                        let html = "";
                        data.forEach(function(item){
                            html += `<option value="${item.id}{BRK}${item.amount}">${item.name}</option>`;
                        });
                        
                        exam_plans.innerHTML = `<select name="exam_plans" id="exam_plans" required="">${html}</select>`;
                        exam_plans.parentNode.classList.remove("d-none");
                        
                        if (serviceId != "jamb"){
                        	toggleBtns("pay_now");
                        }else{
                        	toggleBtns("verify_id");
                        	JambActions();
                        }
                });
            }
        }

        $(document).ready(function(){
            getVariations();
        });
    </script>

</body>

</html>