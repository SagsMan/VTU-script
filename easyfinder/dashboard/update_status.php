<?php
require_once '../inc/user_session.inc.php';
require_once("../inc/accessbility_controller.inc.php");

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['request_id']) && isset($_POST['status'])) {
    $requestId = intval($_POST['request_id']);
    $status = intval($_POST['status']);

    if ($AdminTask->updateCACRequestStatus($requestId, $status)) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to update status.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid request.']);
}
