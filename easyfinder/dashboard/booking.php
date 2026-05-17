<?php
require_once '../inc/user_session.inc.php';

$PAGE_TITLE = 'Data Topup';
$URL_NAME = 'dashboard/topup';
require_once '../inc/accessbility_controller.inc.php';

//require_once("../app/Controller/textcontrooler.php");
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
                        <div class="card  ">
                            <div class="card-body ">
                                <?php if (isset($_POST['buy_airtime']) && !empty($_POST['amount'])) {
                                    $trans_id = trim($_POST['trans_id']);
                                    $dis_amount = $WalletController->Get_Discount_For_Product(
                                        $_POST['network_name'],
                                        $_POST['amount']
                                    );
                                    $payable_amount = $_POST['amount'] - $dis_amount;
                                    if (
                                        $TopupController->Store_My_Trans(
                                            $trans_id,
                                            $payable_amount,
                                            $Auth->email,
                                            $_POST['mobile_num'],
                                            $Auth->phone,
                                            $_POST['network_name'],
                                            1
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
                                                    $trans_id,
                                                    $payable_amount,
                                                    $Auth->email
                                                )
                                            ) {
                                                if (
                                                    $Airtime_result = $TopupController->buyAirtime(
                                                        $_POST,
                                                        $Auth->email,
                                                        VTPASS_USERNAME,
                                                        VTPASS_PASSWORD,
                                                        $trans_id
                                                    )
                                                ) { ?>



                                                    <?php if (
                                                        isset($Airtime_result->response_description) &&
                                                        strlen($Airtime_result->response_description)
                                                    ) {
                                                        if ($Airtime_result->response_description === 'TRANSACTION SUCCESSFUL') {
                                                            $status = 1;
                                                            if (
                                                                $WalletController->Update_Successful_Remove_Wallet_Money_Trans_Status(
                                                                    $Airtime_result->requestId,
                                                                    $Auth->email
                                                                )
                                                            ) {
                                                                if (
                                                                    $TopupController->Confirm_My_Trans(
                                                                        $Airtime_result->response_description,
                                                                        $Airtime_result->requestId,
                                                                        $Airtime_result->content->transactions->transactionId,
                                                                        $status
                                                                    )
                                                                ) { ?>

                                                                    <div class="col-xl-12">
                                                                        <div class="card text-white bg-success">
                                                                            <div class="card-header">
                                                                                <h5 class="card-title text-white"><?= $Airtime_result
                                                                                                                        ->content->transactions
                                                                                                                        ->type ?> : <?= $Airtime_result->response_description ?> </h5>
                                                                            </div>
                                                                            <div class="card-body mb-0">


                                                                                <div class="table-responsive">
                                                                                    <table class="table text-white" id="table">

                                                                                        <tr>
                                                                                            <th>Product Name</th>
                                                                                            <td><?= $Airtime_result->content->transactions->product_name ?>
                                                                                            <td>
                                                                                        </tr>

                                                                                        <tr>
                                                                                            <th>Phone Number</th>
                                                                                            <td><?= $Airtime_result->content->transactions->unique_element ?>
                                                                                            <td>
                                                                                        </tr>

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
                                                            $status = 0;

                                                            if ($trans_info = $TopupController->Get_Trans_Info($trans_id)) {
                                                                if (
                                                                    $TopupController->Confirm_My_Trans(
                                                                        $Airtime_result->response_description,
                                                                        $trans_info->request_id,
                                                                        $Airtime_result->content->transactions->transactionId,
                                                                        $status
                                                                    )
                                                                ) {
                                                                    if (
                                                                        $WalletController->Update_Refund_failed_Wallet_Money_Trans_Status(
                                                                            $trans_info->request_id,
                                                                            $Auth->email,
                                                                            $trans_info->amount
                                                                        )
                                                                    ) {
                                                                        array_push($SITE_ERRORS, 'TRANSACTION FAILED'); ?>

                                                                        <div class="col-xl-12">
                                                                            <div class="card text-white bg-danger">
                                                                                <div class="card-header">
                                                                                    <h5 class="card-title text-white"><?= strtoupper(
                                                                                                                            $trans_info->product_name
                                                                                                                        ) ?> : <?= $Airtime_result->response_description ?> </h5>
                                                                                </div>
                                                                                <div class="card-body mb-0">


                                                                                    <div class="table-responsive">
                                                                                        <table class="table text-white" id="table">

                                                                                            <tr>
                                                                                                <th>Product Name</th>
                                                                                                <td><?= $trans_info->product_name ?>
                                                                                                <td>
                                                                                            </tr>

                                                                                            <tr>
                                                                                                <th>Phone Number</th>
                                                                                                <td><?= $trans_info->unique_element ?>
                                                                                                <td>
                                                                                            </tr>

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


                                            <?php
                                                                    }
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
                                                    $trans_id
                                                )
                                            ) {
                                                array_push(
                                                    $SITE_ERRORS,
                                                    'Insuficient Balance. Please fund your wallet and try again!'
                                                );
                                            } ?>
                                            <div class="alert alert-danger" style="text-align:center">Insuficient Balance. Please <a href="<?= SITE_URL ?>easyfinder/dashboard/credit-wallet">Click Here</a> To Fund Your Wallet</div>
                                            <a href="<?= SITE_URL ?>easyfinder/dashboard/topup" class="btn btn-primary">Re-try again</a>

                                        <?php
                                        }
                                    }
                                } elseif (
                                    isset($_GET['phone']) &&
                                    is_numeric(strip_tags(trim($_GET['phone'])))
                                ) {
                                    $trans_id = $WalletController->Generate_Trans_id();
                                    $phone_num = strip_tags(htmlspecialchars($_GET['phone']));
                                    if (
                                        $Operator = $Reloadly_API->AutoDectedOperatorNumber(
                                            $phone_num,
                                            'NG',
                                            RELOADLY_API
                                        )
                                    ) {
                                        switch ($Operator->name) {
                                            case 'MTN Nigeria':
                                                $serviceID = 'mtn-data';
                                                break;

                                            case 'Airtel Nigeria':
                                                $serviceID = 'airtel-data';
                                                break;

                                            case 'Glo Nigeria':
                                                $serviceID = 'glo-data';
                                                break;

                                            case '9Mobile (Etisalat) Nigeria':
                                                $serviceID = 'etisalat-data';
                                                break;

                                            default:
                                                $serviceID = 'smile';
                                        } ?>

                                        <div class="card-header">
                                            <h5 class="card-title text-white">Phone No.: <?= $phone_num ?></h5>
                                        </div>
                                        <div class="card-body mb-0">


                                            <div class="bootstrap-media">
                                                <div class="media">
                                                    <img src="<?= $Operator
                                                                    ->logoUrls[1] ?>" alt="<?= $Operator
                                                                        ->logoUrls[1] ?>" class="img-responsive" style="max-width: 70px">
                                                    <div class="media-body">
                                                        <h3 class="text-white" style="padding: 10px;"><?= $Operator->name ?></h3>

                                                    </div>
                                                </div>
                                            </div>
                                            <hr style="">


                                            <form class="form-valide-with-icon" method="POST" action="">
                                                <div class="form-group col-md-12 ">
                                                    <label> Select Bundle : </label>
                                                    <select data-shb-product-option="data-shb-product-option" id="s_option_1" data-live-search="true" name="variation_code" class="form-control select select-block select-bordered selectpicker variation-type" required="">
                                                        <option value="">Choose Option</option>
                                                        <?php if (
                                                            $response = $TopupController->GetTvSubscriptionVariations(
                                                                $serviceID
                                                            )
                                                        ) {
                                                            $Variations = json_decode(
                                                                $response,
                                                                true
                                                            );
                                                            $Variation_js = json_decode($response);
                                                            foreach (
                                                                $Variations['content']['variations']
                                                                as $value
                                                            ) { ?>
                                                                <option value="<?= $value['variation_code'] ?>" style="max-width: 300px"><?= $value['name'] ?></option>
                                                        <?php }
                                                        } ?>
                                                    </select>
                                                </div>

                                                <div class="col-md-12 form-group">
                                                    <label>Amount : </label><br>
                                                    <span style="color: red">(Minimum: ₦50 - Maximum: ₦50000)</span>
                                                    <div class="input-group">
                                                        <input type="Number" class="form-control" placeholder="Enter Amount" id="s_amount" name="amount" readonly="" required="">

                                                        <input type="hidden" name="buy_airtime">
                                                        <input type="hidden" name="mobile_num" value="<?= $phone_num ?>">
                                                        <input type="hidden" name="network_name" value="<?= $serviceID ?>">
                                                        <input type="hidden" name="trans_id" value="<?= $trans_id ?>">

                                                    </div>
                                                </div>
                                                <a href="data-topup" class="btn btn-danger btn-sm pull-left light">Cancel</a>
                                                <span class="btn btn-danger btn-sm pull-right" data-toggle="modal" data-target="#exampleModalpopover">Buy Now</span>

                                            </form>




                                        </div>


                                    <?php
                                    }
                                } else {
                                    $add = EduTech\Controller\textcontrooler::add(); ?>





                                    <div class="card-header">
                                        <h4 class="card-title text-white">DATA Bundle</h4>
                                    </div>
                                    <div class="card-body">

                                        <form action="data-topup" method="GET" class="form-valide-with-icon">

                                            <div class="form-group">
                                                <label class="text-label">Phone Number : </label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"> +234 </span>
                                                    </div>
                                                    <input type="tel" name="phone" required="" class="form-control" autocomplete="off" placeholder="Eg: 08060989901">
                                                </div>
                                            </div>

                                            <button class="btn btn-danger">Continue</button>



                                        </form>

                                    </div>






                                <?php
                                } ?>



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
                                <input type="password" name="pass" value="" required="" id="ss_amount" class="form-control" autocomplete="off">
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
            var mainVariation = <?= json_encode($Variation_js->content->variations) ?>;


            $(document).on('change', function(e) {
                if (e.target.dataset.shbProductOption != undefined) {
                    var varx;
                    var options = document.querySelectorAll("[data-shb-product-option]");
                    for (var i = 0; i < options.length; i++) {
                        if (options[i].value == '') {
                            varx = "";
                        } else {
                            varx = options[i].value;
                        }

                    }
                    var stock = -1; // default stock value
                    // check the mainProduct object if the selection is in stock
                    for (var i = 0; i < mainVariation.length; i++) {
                        var code = mainVariation[i].variation_code;
                        //alert(JSON.stringify(code));           
                        if (JSON.stringify(code) == JSON.stringify(varx)) {

                            var amount = mainVariation[i].variation_amount;
                            var identifier = mainVariation[i].variation_code;
                            var var_idx = mainVariation[i].variation_code;
                            var sub_type = mainVariation[i].name;
                        }
                    }

                    if ($('#s_option_1').val() != '') {
                        $('#otherDetails').css('display', 'block');
                        $('#price-per-qty').html('');
                        if (amount == undefined) {
                            $('#s_amount').attr('value', '0');
                            $('#s_amount').attr('readonly');
                        } else if (amount == 0) {
                            $('#s_amount').attr('value', '0');
                            $('#s_amount').removeAttr('readonly');
                        }
                        var p_amount_edit = 1;
                        if ((amount > 1) && (p_amount_edit == 0)) {
                            $('#s_amount').attr('readonly', 'readonly');
                        }
                        $('#s_amount').attr('value', amount);
                        $('#s_amount').val(amount);
                        $('#sub_type').attr('value', sub_type);
                        $('#sub_type').val(sub_type);
                        $('#price-per-qty').html('(N' + Math.round(amount).toFixed(0) + ' per month)');

                        if (identifier != undefined) {
                            $('#s_identifier').attr('value', identifier);
                        }
                        $('#var_idx').attr('value', var_idx);
                    } else {
                        $('#otherDetails').css('display', 'none');
                    }
                }
            });
            $('.selectpicker').selectpicker({
                style: 'btn-info',
                size: 4
            });






            $('#btn-submit').on('click', function(e) {
                e.preventDefault();
                var form = $('form');
                var send_to_confirm = "<?= $Auth->pin ?>";
                var send_to_confirm_entered = $('#ss_amount').val();
                var ss_amount = md5(send_to_confirm_entered);
                if (send_to_confirm === ss_amount) {
                    swal.fire({
                        title: "<br><span style='font-size: 26px'>Please confirm your request? </span> <br> <p style='font-size:18px; font-weight:1px'>Phone : <?= $phone_num ?> <br> Operator : <?= $Operator->name ?> <br> Amount : <?= $Operator->senderCurrencySymbol ?> " + document.getElementById('s_amount').value + "<br>Data Bundle </p>",
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