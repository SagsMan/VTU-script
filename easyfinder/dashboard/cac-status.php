<?php
 

require_once '../inc/user_session.inc.php';

$PAGE_TITLE   = 'CAC Status';
$URL_NAME     = 'dashboard/cac-status';
require_once("../inc/accessbility_controller.inc.php"); 

$userEmailOrUsername = $Auth->email; // or $currentUser->username
$CACRequests = $AdminTask->Get_User_CAC_Request($userEmailOrUsername);
$CACRequests2 = $AdminTask->Get_User_CAC_Request2($userEmailOrUsername);
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <?php require_once 'layout/header-propt.inc.php'; ?>
   <title><?= $PAGE_TITLE . " | " . SITE_TITLE ?> </title>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
   <?php require_once 'layout/preloader.inc.php'; ?>
   <div id="main-wrapper">
      <?php
      require_once 'layout/header.inc.php';
      require_once 'layout/sidebar.inc.php';
      ?>
      <div class="content-body">
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
               <div class="col-12">
                  <div class="card">
                     <div class="card-header">
                        <h4 class="card-title">Business <?= $PAGE_TITLE ?></h4>
                     </div>
                     <div class="card-body">
                        <div class="table-responsive">
                           <table id="example5" class="display" style="min-width: 845px">
                              <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Full Name</th>
                                    <th>Email</th>
                                    <th>Business Name</th>
                                    <th>Status</th>
                                    <th>Date Submitted</th>
                                    <th>Action</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <?php
                                 function getStatusLabel($status) {
                                    switch ($status) {
                                       case 0:
                                          return 'Declined';
                                       case 1:
                                          return 'Submitted';
                                       case 2:
                                          return 'Processing';
                                       case 3:
                                          return 'Completed';
                                       default:
                                          return 'Unknown';
                                    }
                                 }

                                 $sn = 0;

                                 if ($CACRequests && count($CACRequests) > 0) {
                                    foreach ($CACRequests as $request) {
                                       $sn++;
                                 ?>
                                             <tr>
                                          <td><?= $sn ?></td>
                                          <td><?= $request->sname ?></td>
                                          <td><?= $request->email ?></td>
                                          <td><?= $request->proposed_name_1 ?></td>
                                          <td><?php echo getStatusLabel($request->status); ?></td>
                                          <td><?= $request->date_submitted ?></td>
                                          
                                          <td>
                                             <div class="dropdown ml-auto text-right">
                                                <div class="btn-link" data-toggle="dropdown">
                                                   <svg width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                      <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                         <rect x="0" y="0" width="24" height="24"></rect>
                                                         <circle fill="#000000" cx="5" cy="12" r="2"></circle>
                                                         <circle fill="#000000" cx="12" cy="12" r="2"></circle>
                                                         <circle fill="#000000" cx="19" cy="12" r="2"></circle>
                                                      </g>
                                                   </svg>
                                                </div>
                                                
                                                <?php
                                         if ($request->status == 3) { // Use '==' or '===' for comparison
?>
    <div class="dropdown-menu dropdown-menu-right">
        <a class="dropdown-item" href="<?= htmlspecialchars($request->cac_doc) ?>">Download Document</a>
    </div>
<?php
} else {
?>
<div class="dropdown-menu dropdown-menu-right">
                                                      <a class="dropdown-item" data-toggle="modal" data-target="#modal-default_<?= $request->id ?>">View CAC Info</a>
                                                        <a class="dropdown-item" href="edit-business-cac?request_id=<?= $request->id ?>">Edit</a>
                                                </div>
<?php
}
?>
                                             </div>
                                          </td>
                                       </tr>

                                       <!-- Modal for Viewing CAC Info -->
                                     <div class="modal fade" id="modal-default_<?= $request->id ?>">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Manage: <?= $request->sname ?> CAC Request</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="request_id" value="<?= $request->id ?>">

                <div class="form-group">
                    <label>Email:</label>
                    <input class="form-control" type="text" value="<?= $request->email ?>" readonly>
                </div>

                <div class="form-group">
                    <label>Name:</label>
                    <input class="form-control" type="text" value="<?= $request->sname ?>" readonly>
                </div>

                <div class="form-group">
                    <label>Proposed Name 1:</label>
                    <input class="form-control" type="text" value="<?= $request->proposed_name_1 ?>" readonly>
                </div>

                <div class="form-group">
                    <label>Proposed Name 2:</label>
                    <input class="form-control" type="text" value="<?= $request->proposed_name_2 ?>" readonly>
                </div>

                <div class="form-group">
                    <label>Proprietor Phone:</label>
                    <input class="form-control" type="text" value="<?= $request->proprietor_phone ?>" readonly>
                </div>

                <div class="form-group">
                    <label>Proprietor Email:</label>
                    <input class="form-control" type="text" value="<?= $request->proprietor_email ?>" readonly>
                </div>

                <div class="form-group">
                    <label>Business Address:</label>
                    <input class="form-control" type="text" value="<?= $request->business_address ?>" readonly>
                </div>

                <div class="form-group">
                    <label>Nature of Business:</label>
                    <input class="form-control" type="text" value="<?= $request->nature_of_business ?>" readonly>
                </div>

                <div class="form-group">
                    <label>Proprietor Address:</label>
                    <input class="form-control" type="text" value="<?= $request->proprietor_address ?>" readonly>
                </div>

                <div class="form-group">
                    <label>Proprietor Passport:</label>
                    <a href="<?= $request->proprietor_passport ?>" target="_blank">View Passport</a>
                </div>

                <div class="form-group">
                    <label>Proprietor Signature:</label>
                    <a href="<?= $request->proprietor_signature ?>" target="_blank">View Signature</a>
                </div>

                <div class="form-group">
                    <label>NIN:</label>
                    <a href="<?= $request->nin ?>" target="_blank">View NIN</a>
                </div>

                <form method="POST">
                    <input type="hidden" id="request_id" name="request_id" value="<?= $request->id ?>">

                    <div class="form-group">
                        <label>Status:</label>
                        <input class="form-control" type="text" value="<?php echo getStatusLabel($request->status); ?>" readonly>
                    </div>

                    <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
                                       <!-- End of Modal -->
                                 <?php
                                    }
                                 } else {
                                 ?>
                                    <tr>
                                       <td colspan="9" class="text-center">No data available</td>
                                    </tr>
                                 <?php
                                 }
                                 ?>
                              </tbody>
                           </table>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            
            
            
              <div class="row">
               <div class="col-12">
                  <div class="card">
                     <div class="card-header">
                        <h4 class="card-title">Company <?= $PAGE_TITLE ?></h4>
                     </div>
                     <div class="card-body">
                           <div class="table-responsive">
                           <table id="example5" class="display" style="min-width: 845px">
                              <thead>
                                 <tr>
                                    <th>Id</th>
                                    <th>Email</th>
                                    <th>Proposed Name 1</th>
                                    <th>Proposed Name 2</th>
                                    <th>Status</th>
                                    <th>Date Submitted</th>
                                    <th>Action</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <?php
                                //  function getStatusLabel($status) {
                                //     switch ($status) {
                                //       case 0:
                                //           return 'Declined';
                                //       case 1:
                                //           return 'Submitted';
                                //       case 2:
                                //           return 'Processing';
                                //       case 3:
                                //           return 'Completed';
                                //       default:
                                //           return 'Unknown';
                                //     }
                                //  }
                                 $sn = 0;
                                 if ($CACRequests2 && count($CACRequests2) > 0) {
                                    foreach ($CACRequests2 as $request) {
                                       $sn++;
                                 ?>
                                       <tr>
                                          <td><?= $sn ?></td>
                                          <td><?= $request->email ?></td>
                                          <td><?= $request->proposed_name_1 ?></td>
                                          <td><?= $request->proposed_name_2 ?></td>
                                          <td><?php echo getStatusLabel($request->status); ?></td>
                                          <td><?= $request->date_submitted ?></td>
                                          
                                          <td>
                                             <div class="dropdown ml-auto text-right">
                                                <div class="btn-link" data-toggle="dropdown">
                                                   <svg width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                      <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                         <rect x="0" y="0" width="24" height="24"></rect>
                                                         <circle fill="#000000" cx="5" cy="12" r="2"></circle>
                                                         <circle fill="#000000" cx="12" cy="12" r="2"></circle>
                                                         <circle fill="#000000" cx="19" cy="12" r="2"></circle>
                                                      </g>
                                                   </svg>
                                                </div>
                                                                 <?php
                                         if ($request->status == 3) { // Use '==' or '===' for comparison
?>
    <div class="dropdown-menu dropdown-menu-right">
        <a class="dropdown-item" href="<?= htmlspecialchars($request->cac_doc) ?>">Download Document</a>
    </div>
<?php
} else {
?>
<div class="dropdown-menu dropdown-menu-right">
                                                      <a class="dropdown-item" data-toggle="modal" data-target="#modal-default_<?= $request->id ?>">View CAC Info</a>
                                                          <a class="dropdown-item" href="edit-company-cac?request_id=<?= $request->id ?>">Edit</a>
                                                </div>
                                                
<?php
}
?>
                                             </div>
                                          </td>
                                       </tr>

                                       <!-- Modal for Viewing and Changing CAC Info -->
                                       <div class="modal fade" id="modal-default_<?= $request->id ?>">
                                           <div class="modal-dialog">
                                               <div class="modal-content">
                                                   <div class="modal-header">
                                                       <h4 class="modal-title">Manage: <?= $request->proposed_name_1 ?> CAC Request</h4>
                                                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                           <span aria-hidden="true">&times;</span>
                                                       </button>
                                                   </div>
                                                   <div class="modal-body">
                                                       <input type="hidden" name="request_id" value="<?= $request->id ?>">

                                                       <div class="form-group">
                                                           <label>Email:</label>
                                                           <input class="form-control" type="text" value="<?= $request->email ?>" readonly>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Proposed Name 1:</label>
                                                           <input class="form-control" type="text" value="<?= $request->proposed_name_1 ?>" readonly>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Proposed Name 2:</label>
                                                           <input class="form-control" type="text" value="<?= $request->proposed_name_2 ?>" readonly>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Classification:</label>
                                                           <input class="form-control" type="text" value="<?= $request->classification ?>" readonly>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Nature of Company:</label>
                                                           <input class="form-control" type="text" value="<?= $request->nature_of_company ?>" readonly>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Company Address:</label>
                                                           <input class="form-control" type="text" value="<?= $request->company_address ?>" readonly>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Proprietor 1 Name:</label>
                                                           <input class="form-control" type="text" value="<?= $request->proprietor_1_name ?>" readonly>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Proprietor 1 Address:</label>
                                                           <input class="form-control" type="text" value="<?= $request->proprietor_1_address ?>" readonly>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Proprietor 1 Phone:</label>
                                                           <input class="form-control" type="text" value="<?= $request->proprietor_1_phone ?>" readonly>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Proprietor 1 Email:</label>
                                                           <input class="form-control" type="text" value="<?= $request->proprietor_1_email ?>" readonly>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Proprietor 1 Passport:</label>
                                                           <a href="<?= $request->proprietor_1_passport ?>" target="_blank">View Passport</a>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Proprietor 1 Signature:</label>
                                                           <a href="<?= $request->proprietor_1_signature ?>" target="_blank">View Signature</a>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Proprietor 1 NIN:</label>
                                                           <input class="form-control" type="text" value="<?= $request->proprietor_1_nin ?>" readonly>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Proprietor 2 Name:</label>
                                                           <input class="form-control" type="text" value="<?= $request->proprietor_2_name ?>" readonly>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Proprietor 2 Address:</label>
                                                           <input class="form-control" type="text" value="<?= $request->proprietor_2_address ?>" readonly>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Proprietor 2 Phone:</label>
                                                           <input class="form-control" type="text" value="<?= $request->proprietor_2_phone ?>" readonly>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Proprietor 2 Email:</label>
                                                           <input class="form-control" type="text" value="<?= $request->proprietor_2_email ?>" readonly>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Proprietor 2 Passport:</label>
                                                           <a href="<?= $request->proprietor_2_passport ?>" target="_blank">View Passport</a>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Proprietor 2 Signature:</label>
                                                           <a href="<?= $request->proprietor_2_signature ?>" target="_blank">View Signature</a>
                                                       </div>

                                                       <div class="form-group">
                                                           <label>Proprietor 2 NIN:</label>
                                                           <input class="form-control" type="text" value="<?= $request->proprietor_2_nin ?>" readonly>
                                                       </div>

                                                       <form method="POST">
                                                           <input type="hidden" id="request_id" name="request_id" value="<?= $request->id ?>">

                                                           <div class="form-group">
                                                               <label>Status:</label>
                                                              <input class="form-control" type="text" value="<?php echo getStatusLabel($request->status); ?>" readonly>
                                                           </div>

                                                           <div class="modal-footer justify-content-between">
                                                               <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                           </div>
                                                       </form>
                                                   </div>
                                               </div>
                                           </div>
                                       </div>
                                       <!-- End of Modal -->
                                       <?php
                                    }
                                 } else {
                                 ?>
                                    <tr>
                                       <td colspan="9" class="text-center">No data available</td>
                                    </tr>
                                 <?php
                                 }
                                 ?>
                              </tbody>
                           </table>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

   <?php require_once 'layout/footer-propt.inc.php'; ?>
</body>
</html>

                                               