<?php
require_once '../inc/user_session.inc.php';

$PAGE_TITLE   = 'BVN Validation';
$URL_NAME     = 'bvn_validation';
// require_once "../inc/accessbility_controller.inc.php";
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <?php
    require_once 'layout/header-propt.inc.php';
    ?>

    <title><?= $PAGE_TITLE . " | " . SITE_TITLE ?> </title>
    <style>
        /* @page {
            size: A4;
            margin: 0; 
        } */
        @media print {
            body * {
                visibility: hidden;
            }

            .no-print {
                display: none;
            }
            #main-wrapper {
                padding: 0;
                margin: 0;
                border: none;
            }

            #print-section,
            #print-section * {
                visibility: visible;
            }

            #print-section {
                position: absolute;
                left: 0;
                top: 0;
                display: block;
            }
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
            <?php include('layout/minor-top-navbar.inc.php'); ?>
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
                            <li class="breadcrumb-item"><a href="./verifications">Verifications</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)"><?= $PAGE_TITLE ?></a></li>
                        </ol>
                    </div>
                </div>






                <div id="result"></div>
                <!-- row -->
                <div class="row">

                    <div class="col-xl-4 col-lg-6 col-xxl-4 col-sm-6">
                        <div class="card text-white verification-card shadow py-4">
                            <button data-toggle="modal" data-target="#BVNModal">
                                <div class="d-flex align-items-center">
                                    <img src="./images/verification/basic_bvn.png" class="validation-image mr-2" alt="">
                                    <div>
                                        <h5 class="text-white">Basic BVN Slip</h5>
                                        <p class="fs-14" style="color: #7e7e7e">
                                            You'll be charge <span class="badge badge-warning p-1">
                                                ₦ 0
                                            </span> if No record found.
                                        </p>
                                        <div>
                                            <span class="font-weight-bold">Price: </span>
                                            <span class="badge badge-danger p-1"> ₦ <?= BVN_VERIFICATION_PRICE ?></span>
                                        </div>
                                    </div>
                                </div>
                            </button>
                        </div>
                    </div>

                    <div class="col-xl-4 col-lg-6 col-xxl-4 col-sm-6">
                        <div class="card text-white verification-card shadow py-4">
                            <button data-toggle="modal" data-target="#ABVNModal">
                                <div class="d-flex align-items-center">
                                    <img src="./images/verification/bvn_slip.png" class="validation-image mr-2" alt="">
                                    <div>
                                        <h5 class="text-white">Advance BVN Slip</h5>
                                        <p class="fs-14" style="color: #7e7e7e">
                                            You'll be charge <span class="badge badge-warning p-1">
                                                ₦ 0
                                            </span> if No record found.
                                        </p>
                                        <div>
                                            <span class="font-weight-bold">Price: </span>
                                            <span class="badge badge-danger p-1"> ₦ <?= BVN_ADVANCE_VERIFICATION_PRICE ?></span>
                                        </div>
                                    </div>
                                </div>
                            </button>
                        </div>
                    </div>

                </div>


                <div class="row">
                    <div class="col-12">
                        <div class="card shadow">
                            <div class="card-header">
                                <h4 class="card-title fs-16">All Recent Services Perform </h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example" class="display" style="min-width: 845px">
                                    <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Service Type</th>
                                                <th>Photo</th>
                                                <th>Amount</th>
                                                <th>Date</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            if ($bvnDetails = $VerificationController->Get_All_Verifications_By_Type(userEmail: $Auth->email)) {
                                                $i = 0;
                                                foreach ($bvnDetails as $bvnDetail) {
                                                    $i++; ?>
                                                    <tr>
                                                        <td><?php echo $i; ?></td>
                                                        <td><?php echo $bvnDetail->type ?></td>
                                                        <td><img src="data:image/jpeg;base64,<?= $bvnDetail->photo ?>" width="100" alt=""></td>
                                                        <td>₦ <?php echo $bvnDetail->amount ?></td>
                                                        <td><?php echo $bvnDetail->created_at ?></td>
                                                        <td>
                                                            <button class="btn btn-info" onclick="printBVNSlip(<?php echo htmlspecialchars(json_encode($bvnDetail)); ?>)">Print</button>
                                                        </td>
                                                    </tr>
                                            <?php
                                                }
                                            }
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Modals -->
                <div class="modal fade" id="BVNModal">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">BVN Slip > BVN Verification V2</h5>
                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="basic-form">
                                    <form id="bvn-form">
                                        <div class="form-row">
                                            <div class="form-group col-md-12">
                                                <label>BVN</label>
                                                <input type="text" class="form-control" placeholder="0020229898838"
                                                    id="bvn" name="bvn">
                                            </div>
                                        </div>

                                        <button type="submit" class="btn btn-success w-100" id="bvn-form button">
                                            <span class="spinner-grow spinner-grow-sm text-light d-none" id="spinner" role="status" aria-hidden="true"></span>
                                            Verify <span class="badge badge-danger p-1">₦ <?= BVN_VERIFICATION_PRICE ?></span>
                                        </button>
                                        <a href="#" class="fs-12 mt-1">
                                            <i class="ti-help-alt mr-1"></i> Help?
                                        </a>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="ABVNModal">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Advance BVN Slip > BVN Verification V2</h5>
                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="basic-form">
                                    <form id="abvn-form">
                                        <div class="form-row">
                                            <div class="form-group col-md-12">
                                                <label>BVN</label>
                                                <input type="text" class="form-control" placeholder="0020229898838"
                                                    id="advance_bvn" name="bvn">
                                            </div>
                                        </div>

                                        <button type="submit" class="btn btn-success w-100">
                                            <span class="spinner-grow spinner-grow-sm text-light d-none" id="spinner" role="status" aria-hidden="true"></span>
                                            Verify <span class="badge badge-danger p-1">₦ <?= BVN_ADVANCE_VERIFICATION_PRICE ?></span>
                                        </button>
                                        <a href="#" class="fs-12 mt-1">
                                            <i class="ti-help-alt mr-1"></i> Help?
                                        </a>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        <?php
        require_once 'layout/footer.inc.php';
        ?>
    </div>

    <div id="print-section"></div>

    <?php
    require_once 'layout/footer-propt.inc.php';
    ?>

    <script src="./js/dashboard/validation.js?<?php echo time(); ?>"></script>
</body>

</html>