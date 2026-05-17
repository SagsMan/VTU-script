<?php
require_once '../inc/user_session.inc.php';

$PAGE_TITLE   = 'Registered School';
$URL_NAME     = 'manage-register-school';
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
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4 style="color: green"><?= $PAGE_TITLE ?></h4>
                            
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">TruedTech</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)"><?= $PAGE_TITLE ?></a></li>
                        </ol>
                    </div>
                </div>




      
                <div class="row">
                  <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Patient</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example5" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                          
                                               <th>Id</th>
                                              
                                              <th>School ID</th>
                                              <th>School Url</th>
                                              <th>Registered By</th>
                                              <th>Status</th>
                                           
                                              <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                  if($School_partiners = $AdminTask->Get_All_School_Users($Auth->email,$Auth->admin_role)){
                                    foreach ($School_partiners as $School_partiner) {

                                   ?>
                                   <tr>
                                    <td><?= $School_partiner->id ?></td>
                                  <td><?= $School_partiner->school_id ?></td>
                                  <td><a href="https://<?= $School_partiner->url?>.truedtech.com/admin" target="_blank"><?= $School_partiner->url?>.truedtech.com</td>
                                  <td><?= $School_partiner->email ?></td>
                                  <td><?= $School_partiner->status == 1 ? '<span class="badge light badge-success">
                            <i class="fa fa-circle text-success mr-1"></i>Active</span>' : '<span class="badge light badge-danger">
                            <i class="fa fa-circle text-danger mr-1"></i>Inactive</span>' ?></td>
                        
                        </td>
                                                <td>
                          <div class="dropdown ml-auto text-right">
                            <div class="btn-link" data-toggle="dropdown">
                              <svg width="24px" height="24px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="24" height="24"></rect><circle fill="#000000" cx="5" cy="12" r="2"></circle><circle fill="#000000" cx="12" cy="12" r="2"></circle><circle fill="#000000" cx="19" cy="12" r="2"></circle></g></svg>
                            </div>


                            <div class="dropdown-menu dropdown-menu-right">
                              <?php
if(in_array(1,explode(',', $Auth->admin_role)) || in_array(2,explode(',', $Auth->admin_role))){
        ?>  
        <a class="dropdown-item" data-toggle="modal" data-target="#modal-default_<?= $School_partiner->id?>">Edit</a>
            <?php
            }                
          ?>
                              <a class="dropdown-item"  href="#" id="delete_<?php echo $School_partiner->id; ?>" onClick = "if(confirm('Are you sure want to delete this?')){edit_data_ajax('disabled_data', 'registered_school_tbl', '<?php echo $School_partiner->id; ?>'); }"><?= $School_partiner->status == 1 ? 'Disactive' : 'Active' ?></a>
                              
                            </div>
                          </div>
                        </td>                       
                                            </tr>






<div class="modal fade" id="modal-default_<?= $School_partiner->id ?>">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Edit <?= $PAGE_TITLE ?></h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
  <form id="frmCart">        
    <div class="modal-body">
              


    
    <?php
 if($edit_Schools = $AdminTask->Get_Single_School_For_User($Auth->email,$Auth->admin_role,$School_partiner->id)){
  foreach ($edit_Schools  as $edit_School) {
  
    ?>

<div class="form-group">
              <label>Enter New Url Name:</label>
              <input class="form-control" type="text" id="url_<?= $School_partiner->id ?>" value="<?= $School_partiner->url?>">
              <input type="hidden" id="school_id_<?= $School_partiner->id ?>" value="<?= $School_partiner->id ?>">
              <input type="hidden" id="old_url_<?= $School_partiner->id ?>" value="<?= $School_partiner->url ?>">
              
            </div>
          
            

    <?php
}
}

    ?>




            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              <input type="button" value="Save changes" id="addc_<?php echo $School_partiner->id; ?>" onClick = "edit_data_ajax('edit_School', 'table', '<?php echo $School_partiner->id; ?>')" class="btn btn-primary">
            </div>
            </form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->





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








            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->

    </div>
 
  <?php
   require_once 'layout/footer-propt.inc.php';
   ?>
 





<script>


function edit_data_ajax(action,table,code) {
  if(valid(code)){
  var queryString = "";
  if(action != "") {
    switch(action) {
      case "edit_School":
        queryString = 'action='+action+'&url='+ $("#url_"+code).val() +'&school_id='+$("#school_id_"+code).val() + '&old_url='+ $("#old_url_"+code).val();
        $("#addc_"+code).val('Saving...');
      break;

      case "disabled_data":
        queryString = 'action='+action+'&table='+table +'&id='+$("#school_id_"+code).val();
        $("#delete_"+code).hide();
        $("#addc_"+code).hide();
      break;
     
    }  
  }
  jQuery.ajax({
  url: "../inc/get-data-ajax.inc",
  data:queryString,
  type: "POST",
  success:function(data){
    if(data == 1){
    toastr.success("Your data changed successfully");
    }else{
toastr.error(data);
    }
  $("#addc_"+code).val('Saved');
  },
  error:function (){
    toastr.error('Network failed. Please try agian !');
    $("#addc_"+code).val('Save changes');
  }
  });
}
}



function valid(code) {
  var valid = true; 
  $(".demoInputBox").css('background-color','');
  $(".info").html('');
  
  if($("#url_"+code).val().length < 3){ 
   toastr.error('Please Enter Class Name!');
    $("#url_"+code).css('background-color','#FFF0DF');
    valid = false;
  }
  
  return valid;
}

</script>





</body>
</html>