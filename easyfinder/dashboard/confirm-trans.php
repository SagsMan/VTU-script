<?php
require_once '../inc/user_session.inc.php';

$PAGE_TITLE = 'Confirm Transactions';
$URL_NAME = 'dashboard/credit-wallet';
require_once '../inc/accessbility_controller.inc.php';
include '../inc/payment_api_code.php';

if ($_GET['trans_id']) {
    $tran_id = trim($_GET['trans_id']);

    if ($trans_info = $TopupController->Get_Trans_Info($tran_id)) {
        if (
            $Operator = $Reloadly_API->AutoDectedOperatorNumber(
                $trans_info->unique_element,
                'NG',
                RELOADLY_API
            )
        ) {
            switch ($Operator->name) {
                case 'MTN Nigeria':
                    $network_id = '1';
                    $network_data_name = 'MTN Cheap Data';

                    break;

                case 'Airtel Nigeria':
                    $network_id = '4';
                    $network_data_name = 'Airtel Cheap Data';
                    break;

                case 'Glo Nigeria':
                    $network_id = '2';
                    $network_data_name = 'Glo Cheap Data';
                    break;

                case '9Mobile (Etisalat) Nigeria':
                    $network_id = '3';
                    $network_data_name = '9Mobile Cheap Data';
                    break;

                default:
                    $network_id = '6';
                    $network_data_name = 'Smile Cheap Data';
            }
        }
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

   <?php
//require_once 'layout/preloader.inc.php';
?>

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
                        <div class="card ">
                         <div class="card-body ">
   <div class="card-header">
                        <h4 class="card-title text-white">Confirm Your Transaction</h4>
                            </div>
                            <div class="card-body">

                              <?php if (
                                  $trans_info->status != 1 &&
                                  $trans_info->transaction_id != ''
                              ) {
                                  if (
                                      $Confirm_Result = $TopupController->BuyCheaperDataBundle_Requery(
                                          $trans_info->unique_element,
                                          $trans_info->product_name,
                                          $network_id,
                                          $trans_info->request_id
                                      )
                                  ) {
                                      if (
                                          $WalletController->Update_Successful_Remove_Wallet_Money_Transfer(
                                              $trans_info->request_id,
                                              $Auth->email
                                          )
                                      ) { ?>
                           <div class="alert alert-success">Your Transaction is Confirm Sucessful! Element Id : <?= $trans_info->unique_element ?></div>


                           <?php }
                                  }
                              } ?>


                            <form action="" method="GET" class="form-valide-with-icon">

                                     <div class="form-group">
                                            <label class="text-label">Enter Transaction ID: </label>
                                            <div class="input-group">
                                                <input type="text" name="trans_id" required="" class="form-control" autocomplete="off">
                                            </div>
                                        </div>

                                  <button class="btn btn-danger" >Query Now</button>
                            


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

