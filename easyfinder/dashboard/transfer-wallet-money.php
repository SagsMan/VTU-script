<?php
require_once '../inc/user_session.inc.php';

$PAGE_TITLE = 'Transfer to other Wallet';
$URL_NAME = 'dashboard/transfer-wallet-money';
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
                            <h4 style="color: #003366; font-size: 22px;"><?= $PAGE_TITLE ?></h4>

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
                        <div class="card ">
                            <div class="card-body ">
                                <?php if (
                                    isset($_POST['amount']) &&
                                    !empty($_POST['amount'])
                                ) {
                                    $trans_id = trim($_POST['trans_id']);
                                    if (
                                        $WalletController->Check_Available_Balance_From_Wallet_To_Make_Transaction(
                                            $_POST['amount'],
                                            $Auth->email
                                        )
                                    ) {
                                        if (
                                            $response = $WalletController->Transfer_From_My_Wallet(
                                                $trans_id,
                                                $_POST['amount'],
                                                $Auth->email,
                                                $_POST['transferee']
                                            )
                                        ) {
                                            if ($response === 'Successful') { ?>

                                <div class="col-xl-12">
                                    <div class="card text-white bg-success">
                                        <div class="card-header">
                                            <h5 class="card-title text-white">Transaction Response : Transfer
                                                <?= $response ?> </h5>
                                        </div>
                                        <div class="card-body mb-0">
                                            <div class="table-responsive">
                                                <table class="table text-white" id="table">

                                                    <tr>
                                                        <th>Transferee Email</th>
                                                        <td><?= $_POST[
                                                            'transferee'
                                                        ] ?>
                                                        <td>
                                                    </tr>

                                                    <tr>
                                                        <th>Transferee Full Name </th>
                                                        <td><?= $UserAuth->GetUserId(
                                                            $_POST['transferee']
                                                        )->sname .
                                                            ' ' .
                                                            $UserAuth->GetUserId(
                                                                $_POST[
                                                                    'transferee'
                                                                ]
                                                            )->oname ?>
                                                        <td>
                                                    </tr>

                                                    <tr>
                                                        <th>Amount</th>
                                                        <td><?= $_POST[
                                                            'amount'
                                                        ] ?>
                                                        <td>
                                                    </tr>
                                                    <tr>
                                                        <th>Transferor Email : </th>
                                                        <td><?= $Auth->email ?>
                                                        <td>
                                                    </tr>

                                                    <tr>
                                                        <th>Transaction ID</th>
                                                        <td><?= $trans_id ?>
                                                        <td>
                                                    </tr>

                                                    <tr>
                                                        <th>Status</th>
                                                        <td><?= $response ?>
                                                        <td>
                                                    </tr>
                                                </table>
                                                </td>





                                            </div>
                                        </div>
                                    </div>


                                    <?php } else {
                                                $status = 0;
                                                array_push(
                                                    $SITE_ERRORS,
                                                    'TRANSACTION FAILED'
                                                );
                                                ?>




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
                                                            <th>Transferee Email</th>
                                                            <td><?= $_POST[
                                                                'transferee'
                                                            ] ?>
                                                            <td>
                                                        </tr>

                                                        <tr>
                                                            <th>Transferee Full Name </th>
                                                            <td><?= $UserAuth->GetUserId(
                                                                $_POST[
                                                                    'transferee'
                                                                ]
                                                            )->sname .
                                                                ' ' .
                                                                $UserAuth->GetUserId(
                                                                    $_POST[
                                                                        'transferee'
                                                                    ]
                                                                )->oname ?>
                                                            <td>
                                                        </tr>

                                                        <tr>
                                                            <th>Amount</th>
                                                            <td><?= $_POST[
                                                                'amount'
                                                            ] ?>
                                                            <td>
                                                        </tr>
                                                        <tr>
                                                            <th>Transferor Email : </th>
                                                            <td><?= $Auth->email ?>
                                                            <td>
                                                        </tr>

                                                        <tr>
                                                            <th>Transaction ID</th>
                                                            <td><?= $trans_id ?>
                                                            <td>
                                                        </tr>

                                                        <tr>
                                                            <th>Status</th>
                                                            <td>Failed
                                                            <td>
                                                        </tr>
                                                    </table>
                                                    </td>





                                                </div>
                                            </div>
                                        </div>






                                        <?php }
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
                                            ); ?>
                                        <div class="alert alert-danger" style="text-align:center">Insuficient Balance.
                                            Please <a href="<?= SITE_URL ?>easyfinder/dashboard/credit-wallet">Click Here</a> To
                                            Fund Your Wallet</div>
                                        <a href="<?= SITE_URL ?>easyfinder/dashboard/topup" class="btn btn-primary">Re-try
                                            again</a>

                                        <?php
                                        }
                                    }
                                } elseif (
                                    isset($_GET['email']) &&
                                    strip_tags(trim($_GET['email']))
                                ) {
                                    $trans_id = $WalletController->Generate_Trans_id();
                                    $email = strip_tags(
                                        htmlspecialchars($_GET['email'])
                                    );
                                    if (
                                        $UserInfo = $UserAuth->GetUserId($email)
                                    ) { ?>

                                        <div class="card-header">
                                            <h5 class="card-title text-white">Email : <?= $UserInfo->email ?></h5>
                                        </div>
                                        <div class="card-body mb-0">


                                            <div class="bootstrap-media">
                                                <div class="media">
                                                    <img src="<?= SITE_URL ?>easyfinder/dashboard/images/profile/pic1.png" alt="<?= strtoupper(
    $UserInfo->sname . ' ' . $UserInfo->oname
) ?>" class="img-responsive" style="max-width: 70px">
                                                    <div class="media-body">
                                                        <h3 class="text-white" style="padding: 10px;"><?= strtoupper(
                                                            $UserInfo->sname .
                                                                ' ' .
                                                                $UserInfo->oname
                                                        ) ?></h3>

                                                    </div>
                                                </div>
                                            </div>
                                            <hr style="">


                                            <form class="form-valide-with-icon" method="POST" action="">
                                                <div class="form-group">
                                                    <label>Enter To Transfer Amount : </label>
                                                    <div class="input-group">
                                                        <input type="number" name="amount" value="0"
                                                            class="form-control" id="amount"
                                                            onkeyup="checkAmount(this.value)">

                                                    </div>
                                                    <input type="hidden" name="trans_id" value="<?= $trans_id ?>">
                                                    <input type="hidden" name="transferee"
                                                        value="<?= $UserInfo->email ?>">
                                                </div>
                                                <a href="<?= SITE_URL ?>easyfinder/dashboard"
                                                    class="btn btn-danger btn-sm pull-left">Cancel</a>
                                                <span class="btn btn-danger btn-sm pull-right" data-toggle="modal"
                                                    data-target="#exampleModalpopover" id="btn-continue">Continue</span>

                                            </form>



                                        </div>



                                        <?php } else {array_push(
                                            $SITE_ERRORS,
                                            'User Email You Entered is Not Registered on Utiplus !'
                                        ); ?>

                                        <div class="card-header">
                                            <h4 class="card-title">Find User By Email</h4>
                                        </div>
                                        <div class="card-body mb-0">


                                            <form action="transfer-wallet-money" method="GET"
                                                class="form-valide-with-icon">

                                                <div class="form-group">
                                                    <label class="text-label">Enter User Email : </label>
                                                    <div class="input-group">
                                                        <input type="email" name="email" required=""
                                                            class="form-control" autocomplete="off" placeholder="">
                                                    </div>
                                                </div>

                                                <button class="btn btn-danger">Continue</button>



                                            </form>
                                        </div>

                                        <?php }
                                } else {
                                     ?>





                                        <div class="card-header">
                                            <h4 class="card-title">Find User By Email</h4>
                                        </div>
                                        <div class="card-body mb-0">


                                            <form action="transfer-wallet-money" method="GET"
                                                class="form-valide-with-icon">

                                                <div class="form-group">
                                                    <label class="text-label">Enter User Email : </label>
                                                    <div class="input-group">
                                                        <input type="email" name="email" required=""
                                                            class="form-control" autocomplete="off" placeholder="">
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
                                <h5 class="modal-title">Authetication PIN</h5>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="mb-1"><strong>Enter Your Pass Pin : </strong></label>
                                    <div class="input-group">
                                        <input type="password" name="pass" value="" required="" id="ss_amount"
                                            class="form-control" autocomplete="off">
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
                if ($('#amount').val() < 1) {
                    $('#btn-continue').prop("disabled", true);
                } else {
                    $('#btn-continue').prop("disabled", false);
                }

                function checkAmount(val) {
                    if (val < 1) {
                        $('#btn-continue').prop("disabled", true);
                    } else {
                        $('#btn-continue').prop("disabled", false);
                    }
                }
                $('#btn-submit').on('click', function(e) {
                    e.preventDefault();
                    var form = $('form');
                    var send_to_confirm = "<?= $Auth->pin ?>";
                    var send_to_confirm_entered = $('#ss_amount').val();
                    var ss_amount = md5(send_to_confirm_entered);
                    if (send_to_confirm === ss_amount) {
                        swal.fire({
                            title: "<br><span style='font-size: 20px; color: red'>Do Really Want To Transfer Your Wallet Money ? </span> <br> <p style='font-size:18px; font-weight:1px'>Email : <?= $UserInfo->email ?> <br> Full Name : <?= $UserInfo->sname .
     ' ' .
     $UserInfo->oname ?> <br> Amount : ₦" + document.getElementById('amount').value + "</p>",
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