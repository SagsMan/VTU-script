<?php
require_once '../inc/user_session.inc.php';
if (isset($_POST['continue_sub']) && !empty($_POST['amount'])) {
    $_POST["variation_code"] = explode("{BRK}", $_POST["variation_code"])[0];
    if ($_POST['serviceID'] == "showmax"){
        $_POST["billersCode"] = $_POST['phone'];
    }
    $rules = [
        'amount' => ['required', 'numeric'],
    ];

    $validation_result = SimpleValidator\Validator::validate($_POST, $rules);
    if ($validation_result->isSuccess()) {
        $amount = strip_tags(intval($_POST['amount']));
        $serviceID = strip_tags(htmlspecialchars($_POST['serviceID']));
        $billersCode = strip_tags(
                htmlspecialchars($_POST['billersCode'])
        );
        $variation_code = strip_tags(
            htmlspecialchars($_POST['variation_code'])
        );
        $phone = strip_tags(htmlspecialchars($_POST['phone']));
        $subscription_type = strip_tags(
            htmlspecialchars($_POST['subscription_type'])
        );
        $quantity = strip_tags(htmlspecialchars($_POST['quantity']));
        $trans_id = $WalletController->Generate_Trans_id();
    }
}

$PAGE_TITLE = 'Payment Summary';
$URL_NAME = 'dashboard/view-payment-summary';

require_once '../inc/accessbility_controller.inc.php';
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
                            <li class="breadcrumb-item"><a href="javascript:void(0)"><?= SITE_TITLE ?></a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)"><?= $PAGE_TITLE ?></a></li>
                        </ol>
                    </div>
                </div>



                <div class="row ">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body ">





                                <?php if (isset($_POST['buy_now']) && !empty($_POST['amount'])) {
    if (
        !$WalletController->Check_If_My_Transaction_Id_Exist(
            $_POST['request_id'],
            'transactions_tbl'
        )
    ) {
        $dis_amount = $WalletController->Get_Discount_For_Product(
            $_POST['serviceID'],
            $_POST['amount']
        );
        $payable_amount = $_POST['amount'] - $dis_amount;

        if (
            $TopupController->Store_My_Trans(
                $_POST['request_id'],
                $payable_amount,
                $_POST['amount'],
                $Auth->email,
                $_POST['phone'],
                $Auth->phone,
                $_POST['serviceID']
            )
        ) {
            if (
                $WalletController->Check_Available_Balance_From_Wallet_To_Make_Transaction(
                    $payable_amount,
                    $Auth->email
                )
            ) {
                if (
                    $WalletController->Make_Tansaction_From_My_Wallet(
                        $_POST['request_id'],
                        $payable_amount,
                        $Auth->email
                    )
                ) {
                    if (
                        $Airtime_result = $TopupController->buyTvSubscription(
                            $_POST,
                            $Auth,
                        )
                    ) {
                        if (
                            isset($Airtime_result->response_description) &&
                            strlen($Airtime_result->response_description)
                        ) {
                            if (
                                $Airtime_result->response_description ===
                                'TRANSACTION SUCCESSFUL'
                            ) {
                                $status = 1;
                                if (!empty($Airtime_result->purchased_code)) {
                                    $TopupController->Store_Buy_Token_OR_Pin(
                                        $Airtime_result->purchased_code,
                                        $Auth->email,
                                        $Airtime_result->requestId
                                    );
                                }
                                if (
                                    $WalletController->Update_Successful_Remove_Wallet_Money_Trans_Status(
                                        $_POST['serviceID'],
                                        $payable_amount,
                                        $Airtime_result->requestId,
                                        $Auth->email
                                    )
                                ) {
                                    if (
                                        $TopupController->Confirm_My_Trans(
                                            $Airtime_result->response_description,
                                            $Airtime_result->requestId,
                                            $Airtime_result->content
                                                ->transactions->transactionId,
                                            $status
                                        )
                                    ) { ?>




                                <div class="col-xl-10 offset-md-1">
                                    <div class="card text-black bg-success light">
                                        <div class="card-header">
                                            <h6 class="card-title text-white"><?= $Airtime_result->content->transactions
        ->type ?> : <?= $Airtime_result->response_description ?> </h6>
                                        </div>
                                        <div class="card-body mb-0 ">

                                            <div class="table-responsive">
                                                <table class="table text-white" id="table">

                                                    <?php if (isset($Airtime_result->ReceiptNumber)) { ?>
                                                    <tr>
                                                        <th>Receipt Number</th>
                                                        <td><?= $Airtime_result->ReceiptNumber ?>
                                                        <td>
                                                    </tr>

                                                    <?php } ?>
                                                    <tr>
                                                        <th>Product Name</th>
                                                        <td><?= $Airtime_result->content->transactions->product_name ?>
                                                        <td>
                                                    </tr>

                                                    <tr>
                                                        <th>Unique ID</th>
                                                        <td><?= $Airtime_result->content->transactions->unique_element ?>
                                                        <td>
                                                    </tr>
                                                    <?php if (isset($Airtime_result->CustomerName)) { ?>
                                                    <tr>
                                                        <th>Customer Name</th>
                                                        <td><?= $Airtime_result->CustomerName ?>
                                                        <td>
                                                    </tr>
                                                    <?php } ?>
                                                    <tr>
                                                        <th>Amount</th>
                                                        <td><?= $Airtime_result->content->transactions->unit_price ?>
                                                        <td>
                                                    </tr>
                                                    <tr>
                                                        <th>Email : </th>
                                                        <td><?= $Airtime_result->content->transactions->email ?>
                                                        <td>
                                                    </tr>
                                                    <?php if (!empty($Airtime_result->purchased_code)) { ?>
                                                    <tr>
                                                        <th>Token</th>
                                                        <td><?= $Airtime_result->purchased_code ?>
                                                        <td>
                                                    </tr>
                                                    <?php } ?>
                                                    <tr>
                                                        <th>Transaction ID</th>
                                                        <td><?= $Airtime_result->content->transactions->transactionId ?>
                                                        <td>
                                                    </tr>

                                                    <tr>
                                                        <th>Request ID</th>
                                                        <td><?= $Airtime_result->requestId ?>
                                                        <td>
                                                    </tr>


                                                    <tr>
                                                        <th>Status</th>
                                                        <td><?= $Airtime_result->response_description ?>
                                                        <td>
                                                    </tr>
                                                </table>


                                            </div>
                                        </div>
                                    </div>
                                </div>





                                <?php }
                                }
                            } else {
                                $status = 2;

                                if (
                                    $trans_info = $TopupController->Get_Trans_Info(
                                        $_POST['request_id']
                                    )
                                ) {
                                    if (
                                        $TopupController->Confirm_My_Trans(
                                            $Airtime_result->response_description,
                                            $trans_info->request_id,
                                            $Airtime_result->content
                                                ->transactions->transactionId,
                                            $status
                                        )
                                    ) {
                                        if (
                                            $WalletController->Update_Refund_failed_Wallet_Money_Trans_Status(
                                                $trans_info->request_id,
                                                $Auth->email,
                                                $trans_info->amount
                                            )
                                        ) { ?>


                                <div class="col-xl-12">
                                    <div class="card text-black bg-danger light">
                                        <div class="card-header">
                                            <h6 class="card-title text-white"><?= $trans_info->product_name ?> :
                                                <?= $Airtime_result->response_description ?> </h6>
                                        </div>
                                        <div class="card-body mb-0 ">

                                            <div class="table-responsive">
                                                <table class="table text-white" id="table">

                                                    <?php if (isset($Airtime_result->ReceiptNumber)) { ?>
                                                    <tr>
                                                        <th>Receipt Number</th>
                                                        <td><?= $Airtime_result->ReceiptNumber ?>
                                                        <td>
                                                    </tr>

                                                    <?php } ?>
                                                    <tr>
                                                        <th>Product Name</th>
                                                        <td><?= $trans_info->product_name ?>
                                                        <td>
                                                    </tr>

                                                    <tr>
                                                        <th>Unique ID</th>
                                                        <td><?= $trans_info->unique_element ?>
                                                        <td>
                                                    </tr>
                                                    <?php if (isset($Airtime_result->CustomerName)) { ?>
                                                    <tr>
                                                        <th>Customer Name</th>
                                                        <td><?= $Airtime_result->CustomerName ?>
                                                        <td>
                                                    </tr>
                                                    <?php } ?>
                                                    <tr>
                                                        <th>Amount</th>
                                                        <td><?= $trans_info->amount ?>
                                                        <td>
                                                    </tr>
                                                    <tr>
                                                        <th>Email : </th>
                                                        <td><?= $trans_info->email ?>
                                                        <td>
                                                    </tr>
                                                    <?php if (!empty($Airtime_result->purchased_code)) { ?>
                                                    <tr>
                                                        <th>Token</th>
                                                        <td><?= $Airtime_result->purchased_code ?>
                                                        <td>
                                                    </tr>
                                                    <?php } ?>
                                                    <tr>
                                                        <th>Transaction ID</th>
                                                        <td><?= $trans_info->transaction_id ?>
                                                        <td>
                                                    </tr>

                                                    <tr>
                                                        <th>Request ID</th>
                                                        <td><?= $trans_info->request_id ?>
                                                        <td>
                                                    </tr>


                                                    <tr>
                                                        <th>Status</th>
                                                        <td><?= $Airtime_result->response_description ?>
                                                        <td>
                                                    </tr>
                                                </table>


                                            </div>
                                        </div>
                                    </div>
                                </div>



                                <?php }
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                if (
                    $TopupController->Confirm_My_Trans(
                        'Insuficient Balance',
                        $_POST['request_id']
                    )
                ) {
                    array_push(
                        $SITE_ERRORS,
                        'Insuficient Balance. Please fund your wallet and try again!'
                    ); ?>
                                <div class="alert alert-danger" style="text-align:center">Insuficient Balance. Please <a
                                        href="<?= SITE_URL ?>easyfinder/dashboard/credit-wallet">Click Here</a> To Fund Your
                                    Wallet</div>
                                <a href="<?= SITE_URL ?>easyfinder/dashboard" class="btn btn-danger">Check Your Balance</a>

                                <?php
                }
            }
        }
    } else {
        array_push($SITE_ERRORS, 'Duplicate Transaction Id or Key!'); ?>

                                <div class="alert alert-danger" style="text-align:center">Duplicate Transaction Id or
                                    Key</div>
                                <a href="<?= SITE_URL ?>easyfinder/dashboard/" class="btn btn-primary">Re-try again</a>

                                <?php
    }
} else {
    if (isset($amount) && !empty($amount)) { 
        ?>



                                <div class="col-xl-12">
                                    <div class="card text-black bg-secondary">
                                        <div class="card-header">
                                            <h6 class="card-title text-white">Please Confirm your Transaction Details
                                                are as Follows:</h6>
                                        </div>
                                        <div class="card-body mb-0 ">
                                            <div class="table-responsive">
                                                <table class="table text-white" id="table">


                                                    <tr>
                                                        <th>Product</th>
                                                        <td><?= strtoupper(
            $serviceID
        ) ?> Subscription (<?= $subscription_type ?>)
                                                        <td>
                                                    </tr>
                                                    <?php if ($serviceID != 'showmax') { ?>
                                                    <tr>
                                                        <th><?= strtoupper($serviceID) ?> Smartcard Number</th>
                                                        <td><?= $billersCode ?>
                                                        <td>
                                                    </tr>
                                                    <?php } ?>
                                                    <tr>
                                                        <th>Amount</th>
                                                        <td><?= $amount ?> + <i>₦50 (Convenience Fee)</i>
                                                        <td>
                                                    </tr>
                                                    <tr>
                                                        <th>Total Payable Amount</th>
                                                        <td><?= $payable = $amount + 50 ?>
                                                        <td>
                                                    </tr>
                                                    <tr>
                                                        <th>Transaction ID</th>
                                                        <td><span style="color: #003366"><?= $trans_id ?></span>
                                                        <td>
                                                    </tr>
                                                    <tr>
                                                        <th>Status</th>
                                                        <td>Pending
                                                        <td>
                                                    </tr>
                                                </table>
                                            </div>

                                            <form method="POST">

                                                <input type="hidden" name="request_id" value="<?= $trans_id ?>">
                                                <input type="hidden" name="serviceID" value="<?= $serviceID ?>">
                                                <?php if ($serviceID != 'showmax') { ?>
                                                <input type="hidden" name="billersCode" value="<?= $billersCode ?>">
                                                <?php } ?>
                                                <input type="hidden" name="variation_code"
                                                    value="<?= $variation_code ?>">
                                                <input type="hidden" name="amount" value="<?= $payable ?>">
                                                <input type="hidden" name="phone" value="<?= $phone ?>">
                                                <input type="hidden" name="subscription_type"
                                                    value="<?= $subscription_type ?>">
                                                <input type="hidden" name="quantity" value="<?= $quantity ?>">
                                                <input type="hidden" name="buy_now" value="checked">


                                                <div class="form-group">

                                                    <span class="btn btn-primary" data-toggle="modal"
                                                        data-target="#exampleModalpopover" id="btn-continue">Check
                                                        out</span>
                                                </div>


                                            </form>

                                        </div>
                                    </div>
                                </div>


                                <?php }
} ?>


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
                        <label class="mb-1"><strong>Enter Your Pass Pin : </strong></label>
                        <div class="input-group">
                            <input type="password" name="pass" value="" required="" id="ss_amount" class="form-control"
                                autocomplete="off">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger light" data-dismiss="modal">Close</button>
                    <a href="#" class="btn btn-primary" id="btn-submit" data-dismiss="modal">Continue</a>
                </div>

            </div>
        </div>


    </div>







    <?php
    require_once 'layout/footer.inc.php';
    require_once 'layout/footer-propt.inc.php';
    ?>









    <script type="text/javascript">
    $('#btn-submit').on('click', function(e) {
        e.preventDefault();
        var form = $('form');
        var send_to_confirm = "<?= $Auth->pin ?>";
        var send_to_confirm_entered = $('#ss_amount').val();
        var ss_amount = md5(send_to_confirm_entered);
        if (send_to_confirm === ss_amount) {
            swal.fire({
                title: "<br><span style='font-size: 20px; color:red'>Please confirm your request? </span> <br> <p style='font-size:18px; font-weight:1px'>Product : <?= strtoupper(
                        $serviceID
                    ) ?> Subscription (<?= $subscription_type ?>) <br> Smartcard Number : <?= $billersCode ?> <br> Amount :  <?= $payable ?></p>",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#003366",
                confirmButtonText: "Confirm",
            }).then(function(result) {
                if (result.value === true) {
                    //console.log("Submitted");
                    form.submit();
                }
            });
        } else {
            toastr.error("Invalid Pass Pin. Please try again !", "Error Occurs!", {
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
            })
        }
    });
    </script>
</body>

</html>