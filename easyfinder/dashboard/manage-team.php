<?php
require_once '../inc/user_session.inc.php';

$PAGE_TITLE   = 'Manage Team';
$URL_NAME     = 'manage-team';
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
    
                                          <th>Team Name</th>
                                          <th>Team Rank</th>
                                          <th>Team Image</th>
                                          <th>Status</th>
                                          <th>Action</th>
  
                                            </tr>
                                        </thead>
                                  <?php
                                  $sn= 0;
                                if($OurTeams = $AdminTask->Get_Our_Team()){
                                foreach ($OurTeams as $OurTeam) {
                                  $sn++;
                                ?>
                                 <tr>
                                  <td><?= $sn ?></td>
                                <td><?= $OurTeam->name ?></td>
                                <td><?= $OurTeam->post ?></td>
                                <td><img src="images/team_img/<?= $OurTeam->img ?>" style="width: 50px"></td>
                                <td><?= $OurTeam->status==1 ? 'Active' : 'Inactive' ?></td>
                               <td>
                          <div class="dropdown ml-auto text-right">
                            <div class="btn-link" data-toggle="dropdown">
                              <svg width="24px" height="24px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="24" height="24"></rect><circle fill="#000000" cx="5" cy="12" r="2"></circle><circle fill="#000000" cx="12" cy="12" r="2"></circle><circle fill="#000000" cx="19" cy="12" r="2"></circle></g></svg>
                            </div>


                            <div class="dropdown-menu dropdown-menu-right">
                              <?php
if(in_array(1,explode(',', $Auth->admin_role)) || in_array(2,explode(',', $Auth->admin_role))){
        ?>  
        <a class="dropdown-item" data-toggle="modal" data-target="#modal-default_<?= $OurTeam->id?>">Edit</a>
            <?php
            }                
          ?>
                              <a class="dropdown-item"  href="#" id="delete_<?php echo $OurTeam->id; ?>" onClick = "if(confirm('Are you sure want to delete this?')){edit_data_ajax('disabled_data', 'our_team_tbl', '<?php echo $OurTeam->id; ?>'); }"><?= $OurTeam->status == 1 ? 'Delete' : 'Deleted' ?></a>
                              
                            </div>
                          </div>
                        </td>                       
                                            </tr>






<div class="modal fade" id="modal-default_<?= $OurTeam->id ?>">
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
              


  

          <div class="form-group">
              <label>Staff Name:</label>
              <input class="form-control" type="text" id="t_name_<?= $OurTeam->id ?>" value="<?= $OurTeam->name?>">
              <input type="hidden" id="id_<?= $OurTeam->id ?>" value="<?= $OurTeam->id ?>">             
            </div>

            <div class="form-group">
              <label>Staff Rank:</label>
              <input class="form-control" type="text" id="t_post_<?= $OurTeam->id ?>" value="<?= $OurTeam->post?>">             
            </div>

             
            



            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              <input type="button" value="Save changes" id="addc_<?php echo $OurTeam->id; ?>" onClick = "edit_data_ajax('edit_team', 'table', '<?php echo $OurTeam->id; ?>')" class="btn btn-primary">
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
      case "edit_team":
        queryString = 'action='+action+'&t_name='+ $("#t_name_"+code).val() +'&id='+$("#id_"+code).val() + '&t_post='+ $("#t_post_"+code).val();
        $("#addc_"+code).val('Saving...');
      break;

      case "disabled_data":
        queryString = 'action='+action+'&table='+table +'&id='+$("#id_"+code).val();
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
  
  if($("#t_name_"+code).val().length < 3){ 
   toastr.error('Please Enter subscription name!');
    $("#t_name_"+code).css('background-color','#FFF0DF');
    valid = false;
  }

  if($("#t_post_"+code).val().length < 1){ 
   toastr.error('Please Enter Subscription Price!');
    $("#t_post_"+code).css('background-color','#FFF0DF');
    valid = false;
  }

  
  return valid;
}

</script>





</body>
</html>