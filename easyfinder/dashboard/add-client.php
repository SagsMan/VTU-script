<?php
require_once '../inc/user_session.inc.php';

if (isset($_POST['add'])) {

    $rules = [
        'c_name' => [
            'required'
        ],
        'c_state' => [
            'required'
        ],

        'c_town' => [
            'required'
        ]
    ];

    $validation_result = SimpleValidator\Validator::validate($_POST, $rules);
    if ($validation_result->isSuccess()) {


        $imgfile = $_FILES["c_img"]["name"];
        // get the image extension
        $extension = substr($imgfile, strlen($imgfile) - 4, strlen($imgfile));
        // allowed extensions
        $allowed_extensions = array(".jpg", ".png", "jpeg");
        // Validation for allowed extensions .in_array() function searches an array for a specific value.
        if (!in_array($extension, $allowed_extensions)) {
            array_push($SITE_ERRORS, "Invalid format. Only jpg / pngformat allowed");
        } else if (($_FILES["c_img"]["size"] > 500000)) {
            array_push($SITE_ERRORS, "Your img size must not grater 500KB");
        } else {
            //rename the image file
            $imgnewfile = md5($_POST['c_name']) . $extension;
            if ($AdminTask->Add_Client($_POST, $imgnewfile)) {
                move_uploaded_file($_FILES["c_img"]["tmp_name"], "images/client_img/" . $imgnewfile);
                array_push($SITE_SUCCESS, 'New Client is Successful Added');
            } else {
                array_push($SITE_ERRORS, 'Error Occur ! Maybe Url is already added');
            }
        }
    } else {
        array_push($SITE_ERRORS, $validation_result->getErrors());
    }
}


$PAGE_TITLE   = 'Add Client';
$URL_NAME     = 'dashboard/add-client';
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
                            </div>
                            <div class="card-body">
                                <div class="basic-form">


                                    <form action="" method="POST" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label>Client Name: </label>
                                            <input type="text" name="c_name" class="form-control" placeholder="" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Client Town:</label>
                                            <input type="text" name="c_town" class="form-control" placeholder="" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Client State:</label>
                                            <input type="text" name="c_state" class="form-control" placeholder="" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Client Image:</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Upload Logo</span>
                                                </div>
                                                <div class="custom-file">
                                                    <input type="file" name="c_img" class="custom-file-input" required="">
                                                    <label class="custom-file-label">Choose file</label>
                                                </div>
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