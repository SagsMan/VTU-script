<?php
require_once '../inc/user_session.inc.php';

$PAGE_TITLE   = 'My Earning';
$URL_NAME     = 'dashboard/my-earn';
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

   <?php  require_once 'layout/preloader.inc.php'; ?>

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
          <?php  include('layout/minor-top-navbar.inc.php'); ?>
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
                                <h4 class="card-title"><?=$PAGE_TITLE ?></h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                               <th>#</th>
                                              <th>Amount Earn</th>
                                              <th>Earn From </th>
                                              <th>Trans Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>


                                            <?php
                            $total_earn=0;
                          if($MyEarns = $WalletController->Get_User_Earn_History($Auth->email,$Auth->admin_role)){
                            $sn=0;
                            
                          foreach ($MyEarns as $MyEarn) {
                            $sn++;
                            $total_earn += $MyEarn->earn_amount;
                            ?>
                                            <tr>
                                              <td><?= $sn ?></td>
                                    <td>N<?= $MyEarn->earn_amount ?></td>
                                    <td><?= strtoupper($UserAuth->GetUserId($MyEarn->buyer_email)->sname.' '.$UserAuth->GetUserId($MyEarn->buyer_email)->oname) ?></td>
                                   
                                    <td><?= $MyEarn->date_trans ?></td>

                                      </tr>


                                      <?php
                                    }
                                    
                                    }
                                      ?>
                                      
                                                                      
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                        <td colspan="2"></td>
                                        <th>Total Earn</th>
                                       
                                        <td style="color: green">N<?= $total_earn ?></td>
                                            </tr>
                                        </tfoot>
                                    </table>
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

 

    </div>
 
  <?php
  require_once 'layout/footer.inc.php';
   require_once 'layout/footer-propt.inc.php';
   ?>
  
</body>
</html>