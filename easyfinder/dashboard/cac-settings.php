<?php

require_once '../inc/user_session.inc.php';
$company_cac_price = COMPANY_CAC_PRICE;
$business_cac_price = BUSINESS_CAC_PRICE;
if(isset($_POST['update_prices'])){
    $company_cac_price = $_POST['company_cac_price'];
    $business_cac_price = $_POST['business_cac_price'];

    $errors = [];
    $success = [];

    if (empty($company_cac_price) || !ctype_digit($company_cac_price)) {
        $errors[] = "Company CAC price is required and must be a valid number.";
    }

    if (empty($business_cac_price) || !ctype_digit($business_cac_price)) {
        $errors[] = "Business CAC price is required and must be a valid number.";
    }

    if (empty($errors)) {
        $updateCompanyPrice = $AdminTask->update_general_settings('company_cac_price', $company_cac_price);
        $updateBusinessPrice = $AdminTask->update_general_settings('business_cac_price', $business_cac_price);

        if ($updateCompanyPrice && $updateBusinessPrice) {
            $company_cac_price = $company_cac_price;
            $business_cac_price = $business_cac_price;
            $success[] = "Prices updated successfully!";
        } else {
            $errors[] = "Failed to update prices. Please try again.";
        }
    }
}

$PAGE_TITLE   = 'Modify CAC Prices';
$URL_NAME     = 'dashboard/cac-settings';

require_once("../inc/accessbility_controller.inc.php");
?>
<!DOCTYPE html>
<html lang="en">

<head>
   <?php
   require_once 'layout/header-propt.inc.php';
   ?>
   <title><?= $PAGE_TITLE." | ".SITE_TITLE ?> </title>
</head>
<body>

   <?php require_once 'layout/preloader.inc.php'; ?>

    <div id="main-wrapper">

   <?php
   require_once 'layout/header.inc.php';
   require_once 'layout/sidebar.inc.php';
   ?>

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
                            <li class="breadcrumb-item active"><a href="javascript:void(0)"><?= $PAGE_TITLE ?></a></li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <?php
                                if (!empty($errors)) {
                                    echo '<div class="alert alert-danger">';
                                    foreach ($errors as $error) {
                                        echo "<p>$error</p>";
                                    }
                                    echo '</div>';
                                }

                                if (!empty($success)) {
                                    echo '<div class="alert alert-success">';
                                    foreach ($success as $message) {
                                        echo "<p>$message</p>";
                                    }
                                    echo '</div>';
                                }
                                ?>
                                <div class="basic-form">
                                   <form method="POST" class="form-valide-with-icon">
                                       <div class="form-group">
                                            <label class="mb-1"><strong>Company CAC Price</strong></label>
                                            <div class="input-group">
                                               <input type="text" name="company_cac_price" value="<?= $company_cac_price ?>" required="" class="form-control" placeholder="Enter Company CAC Price">
                                            </div>
                                        </div>
  
                                        <div class="form-group">
                                            <label class="mb-1"><strong>Business CAC Price</strong></label>
                                            <div class="input-group">
                                               <input type="text" name="business_cac_price" required="" value="<?= $business_cac_price ?>" class="form-control" placeholder="Enter Business CAC Price">
                                            </div>
                                        </div>

                                    <div class="text-center mt-4">
                                        <button name="update_prices" type="submit" value="Update Prices" class="btn btn-primary">Update Prices</button>
                                    </div>
                                   </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
 
	<?php
    require_once 'layout/footer.inc.php';
    require_once 'layout/footer-propt.inc.php';
   ?>
	
</body>
</html>
