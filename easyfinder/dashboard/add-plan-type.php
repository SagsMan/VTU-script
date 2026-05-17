<?php
require_once '../inc/user_session.inc.php';

if (isset($_POST['add'])) {

    $rules = [
        'data_type' => [
            'required'
        ],
        'title' => [
            'required'
        ],
        'network_id' => [
            'required'
        ],
    ];

    $validation_result = SimpleValidator\Validator::validate($_POST, $rules);
    if ($validation_result->isSuccess()) {
        if ($AdminTask->Add_Plan_Type($_POST)) {
            array_push($SITE_SUCCESS, 'New Plan Type is Successful Added');
        } else {
            array_push($SITE_ERRORS, 'Error Occur ! Maybe Url is already added');
        }
    } else {
        array_push($SITE_ERRORS, $validation_result->getErrors());
    }
}

$networks = [
    1 => 'MTN',
    2 => 'GLO',
    3 => '9MOBILE',
    4 => 'AIRTEL'
];

$PAGE_TITLE   = 'Add Plan Type';
$URL_NAME     = 'dashboard/add-plan-type';
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
                                    <a href="manage-plan-type" class="btn btn-primary">
                                        <i class="fs-1">&#8592;</i> Back</a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="basic-form">


                                    <form action="" method="POST">
                                        <div class="form-group">
                                            <label>Data Type: </label>
                                            <input type="text" name="data_type" class="form-control" placeholder="E.g mtncg, glo etc" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Plan Title:</label>
                                            <input type="text" name="title" class="form-control" placeholder="E.g MTN CORPORATE, GLO etc" required="">
                                        </div>

                                        <div class="form-group row">
                                            <label for="network_id" class="col-sm-4 col-form-label">Network <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <select class="form-control" id="network_id" name="network_id" required>
                                                    <option value="">Select Network</option>
                                                    <?php foreach ($networks as $id => $network): ?>
                                                        <option value="<?php echo $id ?>">
                                                            <?php echo $network; ?>
                                                        </option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>
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