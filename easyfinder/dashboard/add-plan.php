<?php
require_once '../inc/user_session.inc.php';

if (isset($_POST['add'])) {

    $rules = [
        'plan_type_id' => [
            'required'
        ],
        'api_id' => [
            'required'
        ],
        'plan_id' => [
            'required'
        ],

        'plan' => [
            'required'
        ],

        'validity' => [
            'required'
        ],

        'price' => [
            'required'
        ],

        'network_id' => [
            'required'
        ],
    ];

    $validation_result = SimpleValidator\Validator::validate($_POST, $rules);
    if ($validation_result->isSuccess()) {
        if ($AdminTask->Add_Plan($_POST)) {
            array_push($SITE_SUCCESS, 'New Plan is Successful Added');
        } else {
            array_push($SITE_ERRORS, 'Error Occur ! Maybe Url is already added');
        }
    } else {
        array_push($SITE_ERRORS, $validation_result->getErrors());
    }
}


$PAGE_TITLE   = 'Add Plan';
$URL_NAME     = 'dashboard/add-plan';
require_once("../inc/accessbility_controller.inc.php");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <?php
    require_once 'layout/header-propt.inc.php';
    ?>

    <title><?= $PAGE_TITLE . " | " . SITE_TITLE ?> </title>
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







                <!-- row -->
                <div class="row">

                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title"><?= $PAGE_TITLE  ?></h4>


                                <div class="float-right">
                                    <a href="manage-plan" class="btn btn-primary">
                                    <i class="fs-1">&#8592;</i> Back</a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="basic-form">


                                    <form action="" method="POST">
                                        <div class="form-group row">
                                            <label for="plan_type_id" class="col-sm-4 col-form-label">Plan Type <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <select class="form-control" id="plan_type_id" name="plan_type_id" required>
                                                    <option value="">Select Data Type</option>
                                                    <?php foreach ($AdminTask->Get_Plan_Types() as $plan): ?>
                                                        <option value="<?php echo $plan->id ?>">
                                                            <?php echo $plan->data_type; ?>
                                                        </option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="api_id" class="col-sm-4 col-form-label">API Setting <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <select class="form-control" id="api_id" name="api_id" required>
                                                    <option value="">Select Provider</option>
                                                    <?php foreach ($AdminTask->Get_API_Settings() as $apiSetting): ?>
                                                        <option value="<?php echo $apiSetting->id ?>">
                                                            <?php echo $apiSetting->api_name; ?>
                                                        </option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label>Plan ID: </label>
                                            <input type="number" name="plan_id" class="form-control" placeholder="E.g 211 , 222, 223 etc" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Plan:</label>
                                            <input type="text" name="plan" class="form-control" placeholder="E.g MTN SME 1.0 GB" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Data Validity:</label>
                                            <input type="text" name="validity" class="form-control" placeholder="E.g 30 DAYS" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Plan Price:</label>
                                            <input type="number" name="price" class="form-control" placeholder="E.g 230 , 460 etc" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Network ID:</label>
                                            <input type="number" name="network_id" class="form-control" placeholder="eg 1, 2, 3, or 4" required="">
                                        </div>

                                        <div class="form-group">
                                            <input name="add" type="submit" class="btn btn-primary" value="Add Now">
                                        </div>
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

    </div>

    <?php
    require_once 'layout/footer-propt.inc.php';
    ?>

</body>

</html>