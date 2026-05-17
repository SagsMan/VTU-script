<?php

 

require_once '../inc/user_session.inc.php';

// Ensure request_id is valid
if (!isset($_GET['request_id']) || !is_numeric($_GET['request_id'])) {
    die('Invalid request.');
}

$requestId = intval($_GET['request_id']);


if (isset($_POST['submitcac'])) {
    $oname = $Auth->sname;
    $email = $Auth->email;
    $balance = intval($WalletController->Get_Single_User_Wallet_Balance($email)->balance);
    $timestamp = time();
    $price = COMPANY_CAC_PRICE;
    $errors = [];
    $success = [];

    // Generate request_id
    $new_request_id = uniqid('cac_', true);

    // Form validation
    if (empty($_POST['proposed_name_1'])) {
        $errors[] = "Proposed name option 1 is required.";
    }

    if (empty($_POST['proposed_name_2'])) {
        $errors[] = "Proposed name option 2 is required.";
    }

    if (empty($_POST['classification'])) {
        $errors[] = "Classification is required.";
    }

    if (empty($_POST['nature_of_company'])) {
        $errors[] = "Nature of the company is required.";
    }

    if (empty($_POST['company_address'])) {
        $errors[] = "Company address is required.";
    }

    if (empty($_POST['proprietor_1_name'])) {
        $errors[] = "Proprietor 1 name is required.";
    }

    if (empty($_POST['proprietor_1_address'])) {
        $errors[] = "Proprietor 1 address is required.";
    }

    if (empty($_POST['proprietor_1_phone']) || !ctype_digit($_POST['proprietor_1_phone'])) {
        $errors[] = "Proprietor 1 phone number is required and must contain only numbers.";
    }

    if (empty($_POST['proprietor_1_email'])) {
        $errors[] = "Proprietor 1 email is required.";
    }

    if (!isset($_FILES['proprietor_1_passport']) || $_FILES['proprietor_1_passport']['error'] !== UPLOAD_ERR_OK) {
        $errors[] = "Proprietor 1 passport is required.";
    }

    if (!isset($_FILES['proprietor_1_signature']) || $_FILES['proprietor_1_signature']['error'] !== UPLOAD_ERR_OK) {
        $errors[] = "Proprietor 1 signature is required.";
    }

    if (empty($_POST['proprietor_1_nin'])) {
        $errors[] = "Proprietor 1 NIN is required.";
    }

    if (empty($_POST['proprietor_2_name'])) {
        $errors[] = "Proprietor 2 name is required.";
    }

    if (empty($_POST['proprietor_2_address'])) {
        $errors[] = "Proprietor 2 address is required.";
    }

    if (empty($_POST['proprietor_2_phone']) || !ctype_digit($_POST['proprietor_2_phone'])) {
        $errors[] = "Proprietor 2 phone number is required and must contain only numbers.";
    }

    if (empty($_POST['proprietor_2_email'])) {
        $errors[] = "Proprietor 2 email is required.";
    }

    if (!isset($_FILES['proprietor_2_passport']) || $_FILES['proprietor_2_passport']['error'] !== UPLOAD_ERR_OK) {
        $errors[] = "Proprietor 2 passport is required.";
    }

    if (!isset($_FILES['proprietor_2_signature']) || $_FILES['proprietor_2_signature']['error'] !== UPLOAD_ERR_OK) {
        $errors[] = "Proprietor 2 signature is required.";
    }

    if (empty($_POST['proprietor_2_nin'])) {
        $errors[] = "Proprietor 2 NIN is required.";
    }

    if (empty($errors) && $WalletController->Make_Tansaction_From_My_Wallet("cac_payment_{$timestamp}", $price, $email)) {
        // Handle file uploads and generate new file names
        $proprietor_1_passport = "{$oname}_proprietor_1_passport_{$timestamp}." . pathinfo($_FILES['proprietor_1_passport']['name'], PATHINFO_EXTENSION);
        $proprietor_1_signature = "{$oname}_proprietor_1_signature_{$timestamp}." . pathinfo($_FILES['proprietor_1_signature']['name'], PATHINFO_EXTENSION);
        $proprietor_2_passport = "{$oname}_proprietor_2_passport_{$timestamp}." . pathinfo($_FILES['proprietor_2_passport']['name'], PATHINFO_EXTENSION);
        $proprietor_2_signature = "{$oname}_proprietor_2_signature_{$timestamp}." . pathinfo($_FILES['proprietor_2_signature']['name'], PATHINFO_EXTENSION);

        $paths = [
            'proprietor_1_passport' => '../uploads/' . $proprietor_1_passport,
            'proprietor_1_signature' => '../uploads/' . $proprietor_1_signature,
            'proprietor_2_passport' => '../uploads/' . $proprietor_2_passport,
            'proprietor_2_signature' => '../uploads/' . $proprietor_2_signature,
        ];

        // Move uploaded files to the specified paths
        if (move_uploaded_file($_FILES['proprietor_1_passport']['tmp_name'], $paths['proprietor_1_passport']) &&
            move_uploaded_file($_FILES['proprietor_1_signature']['tmp_name'], $paths['proprietor_1_signature']) &&
            move_uploaded_file($_FILES['proprietor_2_passport']['tmp_name'], $paths['proprietor_2_passport']) &&
            move_uploaded_file($_FILES['proprietor_2_signature']['tmp_name'], $paths['proprietor_2_signature'])
        ) {
            // Update the database
            $updateData = [
                'proposed_name_1' => $_POST['proposed_name_1'],
                'proposed_name_2' => $_POST['proposed_name_2'],
                'classification' => $_POST['classification'],
                'nature_of_company' => $_POST['nature_of_company'],
                'company_address' => $_POST['company_address'],
                'proprietor_1_name' => $_POST['proprietor_1_name'],
                'proprietor_1_address' => $_POST['proprietor_1_address'],
                'proprietor_1_phone' => $_POST['proprietor_1_phone'],
                'proprietor_1_email' => $_POST['proprietor_1_email'],
                'proprietor_1_nin' => $_POST['proprietor_1_nin'],
                'proprietor_2_name' => $_POST['proprietor_2_name'],
                'proprietor_2_address' => $_POST['proprietor_2_address'],
                'proprietor_2_phone' => $_POST['proprietor_2_phone'],
                'proprietor_2_email' => $_POST['proprietor_2_email'],
                'proprietor_2_nin' => $_POST['proprietor_2_nin']
            ];

            if ($AdminTask->Update_Request2($requestId, $updateData, $paths)) {
                $success[] = 'CAC request updated successfully!';
            } else {
                $errors[] = 'Failed to update CAC request. Please try again.';
            }
        } else {
            $errors[] = 'Failed to upload files. Please try again.';
        }
    }
}

$PAGE_TITLE = 'Update Company CAC Request';
$URL_NAME = "dashboard/edit-company-cac?request_id=$requestId";
$request = $AdminTask->Get_Request_By_Id2($requestId);
if (!$request) {
    die('Request not found.');
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <?php require_once 'layout/header-propt.inc.php'; ?>
    <title><?= $PAGE_TITLE . " | " . SITE_TITLE ?> </title>
</head>

<body>
    <?php require_once 'layout/preloader.inc.php'; ?>

    <div id="main-wrapper">
        <?php require_once 'layout/header.inc.php'; ?>
        <?php require_once 'layout/sidebar.inc.php'; ?>

        <div class="content-body">
            <?php include('layout/minor-top-navbar.inc.php'); ?>
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4 style="color: #003366; font-size: 20px"><?= htmlspecialchars($PAGE_TITLE) ?></h4>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)"><?= htmlspecialchars(SITE_TITLE) ?></a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)"><?= htmlspecialchars($PAGE_TITLE) ?></a></li>
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
                                    <form method="POST" class="form-valide-with-icon" enctype="multipart/form-data">
                                        <h5>Company Details</h5>
                                        <div class="form-group row">
                                            <label for="proposed_name_1" class="col-sm-4 col-form-label">Proposed Name Option 1 <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="proposed_name_1" class="form-control" id="proposed_name_1" value="<?= htmlspecialchars($reqduest->proposed_name_1) ?>" required="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="proposed_name_2" class="col-sm-4 col-form-label">Proposed Name Option 2 <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="proposed_name_2" class="form-control" id="proposed_name_2" value="<?= htmlspecialchars($request->proposed_name_2) ?>" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="classification" class="col-sm-4 col-form-label">Classification <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="classification" class="form-control" id="classification" value="<?= htmlspecialchars($request->classification) ?>" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="nature_of_company" class="col-sm-4 col-form-label">Nature of Company <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="nature_of_company" class="form-control" id="nature_of_company" value="<?= htmlspecialchars($request->nature_of_company) ?>" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="company_address" class="col-sm-4 col-form-label">Company Address <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="company_address" class="form-control" id="company_address" value="<?= htmlspecialchars($request->company_address) ?>" required>
                                            </div>
                                        </div>
                                        <h5>Proprietor 1 Details</h5>
                                        <div class="form-group row">
                                            <label for="proprietor_1_name" class="col-sm-4 col-form-label">Name <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="proprietor_1_name" class="form-control" id="proprietor_1_name" value="<?= htmlspecialchars($request->proprietor_1_name) ?>" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="proprietor_1_address" class="col-sm-4 col-form-label">Address <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="proprietor_1_address" class="form-control" id="proprietor_1_address" value="<?= htmlspecialchars($request->proprietor_1_address) ?>" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="proprietor_1_phone" class="col-sm-4 col-form-label">Phone Number <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="proprietor_1_phone" class="form-control" id="proprietor_1_phone" value="<?= htmlspecialchars($request->proprietor_1_phone) ?>" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="proprietor_1_email" class="col-sm-4 col-form-label">Email <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <input type="email" name="proprietor_1_email" class="form-control" id="proprietor_1_email" value="<?= htmlspecialchars($request->proprietor_1_email) ?>" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="proprietor_1_passport" class="col-sm-4 col-form-label">Passport <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <?php if (!empty($request->proprietor_1_passport)): ?>
                                                    <a href="../uploads/<?= htmlspecialchars($request->proprietor_1_passport) ?>" target="_blank">View Current Passport</a>
                                                <?php endif; ?>
                                                <input type="file" name="proprietor_1_passport" class="form-control-file" id="proprietor_1_passport">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="proprietor_1_signature" class="col-sm-4 col-form-label">Signature <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <?php if (!empty($request->proprietor_1_signature)): ?>
                                                    <a href="../uploads/<?= htmlspecialchars($request->proprietor_1_signature) ?>" target="_blank">View Current Signature</a>
                                                <?php endif; ?>
                                                <input type="file" name="proprietor_1_signature" class="form-control-file" id="proprietor_1_signature">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="proprietor_1_nin" class="col-sm-4 col-form-label">NIN <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="proprietor_1_nin" class="form-control" id="proprietor_1_nin" value="<?= htmlspecialchars($request->proprietor_1_nin) ?>" required>
                                            </div>
                                        </div>
                                        <h5>Proprietor 2 Details</h5>
                                        <div class="form-group row">
                                            <label for="proprietor_2_name" class="col-sm-4 col-form-label">Name <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="proprietor_2_name" class="form-control" id="proprietor_2_name" value="<?= htmlspecialchars($request->proprietor_2_name) ?>" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="proprietor_2_address" class="col-sm-4 col-form-label">Address <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="proprietor_2_address" class="form-control" id="proprietor_2_address" value="<?= htmlspecialchars($request->proprietor_2_address) ?>" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="proprietor_2_phone" class="col-sm-4 col-form-label">Phone Number <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="proprietor_2_phone" class="form-control" id="proprietor_2_phone" value="<?= htmlspecialchars($request->proprietor_2_phone) ?>" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="proprietor_2_email" class="col-sm-4 col-form-label">Email <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <input type="email" name="proprietor_2_email" class="form-control" id="proprietor_2_email" value="<?= htmlspecialchars($request->proprietor_2_email) ?>" required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="proprietor_2_passport" class="col-sm-4 col-form-label">Passport <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <?php if (!empty($request->proprietor_2_passport)): ?>
                                                    <a href="../uploads/<?= htmlspecialchars($request->proprietor_2_passport) ?>" target="_blank">View Current Passport</a>
                                                <?php endif; ?>
                                                <input type="file" name="proprietor_2_passport" class="form-control-file" id="proprietor_2_passport">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="proprietor_2_signature" class="col-sm-4 col-form-label">Signature <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <?php if (!empty($request->proprietor_2_signature)): ?>
                                                    <a href="../uploads/<?= htmlspecialchars($request->proprietor_2_signature) ?>" target="_blank">View Current Signature</a>
                                                <?php endif; ?>
                                                <input type="file" name="proprietor_2_signature" class="form-control-file" id="proprietor_2_signature">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="proprietor_2_nin" class="col-sm-4 col-form-label">NIN <span class="text-danger">*</span></label>
                                            <div class="col-sm-8">
                                                <input type="text" name="proprietor_2_nin" class="form-control" id="proprietor_2_nin" value="<?= htmlspecialchars($request->proprietor_2_nin) ?>" required>
                                            </div>
                                        </div>

                                        <button type="submit" name="submitcac" class="btn btn-primary">Submit</button>
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
