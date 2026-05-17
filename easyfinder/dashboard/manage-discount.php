<?php
require_once '../inc/user_session.inc.php';

$PAGE_TITLE = 'Manage Discount';
$URL_NAME = 'dashboard/manage-discount';
require_once '../inc/accessbility_controller.inc.php';

if (isset($_POST['update'])) {
    foreach ($_POST['id'] as $id) {
        if (
            $TopupController->Update_Discount_Percent(
                $_POST['id'][$id],
                $_POST['gene_discount'][$id],
                $_POST['refer_discount'][$id],
                $_POST['agent_discount'][$id]
            )
        ) {
            array_push($SITE_SUCCESS, 'Discount is successfully edited');
        } else {
            array_push($SITE_ERRORS, 'something went wrong!');
        }
        //print_r($id);
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <?php require_once 'layout/header-propt.inc.php'; ?>

    <title><?= $PAGE_TITLE . ' | ' . SITE_TITLE ?> </title>
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





                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title"><?= $PAGE_TITLE ?></h4>
                            </div>
                            <div class="card-body">


                                <form action="" method="POST" class="form-valide-with-icon">

                                    <div class="row">

                                        <?php if (
                                            $discounts = $TopupController->Get_All_Discount()
                                        ) {
                                            foreach (
                                                $discounts
                                                as $discount
                                            ) { ?>

                                        <div class="form-group col-md-3">
                                            <label class="mb-1"><strong>Product ID</strong></label>
                                            <div class="input-group">
                                                <input type="text" readonly="" name="pro_id[<?= $discount->id ?>]"
                                                    value="<?= trim(
                                                        $discount->product_id
                                                    ) ?>" required="" class="form-control">
                                                <input type="hidden" readonly="" name="id[<?= $discount->id ?>]" value="<?= trim(
    $discount->id
) ?>" required="" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group col-md-3">
                                            <label class="mb-1"><strong>General Dicount</strong></label>
                                            <div class="input-group">
                                                <input type="number" name="gene_discount[<?= $discount->id ?>]"
                                                    value="<?= $discount->percentage_off ?>" required=""
                                                    class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group col-md-3">
                                            <label class="mb-1"><strong>Referral Discount</strong></label>
                                            <div class="input-group">
                                                <input type="number" name="refer_discount[<?= $discount->id ?>]"
                                                    value="<?= $discount->referal_share ?>" required=""
                                                    class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group col-md-3">
                                            <label class="mb-1"><strong>Agent Discount </strong></label>
                                            <div class="input-group">
                                                <input type="number" name="agent_discount[<?= $discount->id ?>]"
                                                    value="<?= $discount->agent ?>" required="" class="form-control">
                                            </div>
                                        </div>

                                        <?php }
                                        } ?>
                                    </div>

                                    <div class="text-center mt-4">
                                        <button name="update" type="submit" value="update"
                                            class="btn btn-primary ">Update now</button>
                                    </div>
                                </form>


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

    <?php
    require_once 'layout/footer.inc.php';
    require_once 'layout/footer-propt.inc.php';
    ?>

</body>

</html>