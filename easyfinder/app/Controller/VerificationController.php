<?php

namespace EduTech\Controller;

use DateTime;
use \PDO;
use EduTech\C_Base;
use EduTech\SessionHelper\Session;
use SimpleValidator\Validator;
use EduTech\Controller\WalletController;
use EduTech\DB\Conn;
use Endroid\QrCode\Color\Color;
use Endroid\QrCode\Encoding\Encoding;
use Endroid\QrCode\ErrorCorrectionLevel;
use Endroid\QrCode\QrCode;
use Endroid\QrCode\RoundBlockSizeMode;
use Endroid\QrCode\Writer\PngWriter;

class VerificationController extends C_base
{
    private $ref_id;
    private $WalletController, $UserAuth;

    public function __construct()
    {
        $this->WalletController = new WalletController;
        $this->UserAuth = new \EduTech\Controller\UserController;
    }

    public function verifyBvn(array $input)
    {
        if (isset($input['bvn']) && !empty($input['bvn'])) {
            $bvn = $input['bvn'];
            $userEmail = $this->UserAuth->GetUserId($_SESSION['Login_User'])->email;

            $balance = intval($this->WalletController->Get_Single_User_Wallet_Balance($userEmail)->balance);
            $price = BVN_VERIFICATION_PRICE;
            $timestamp = time();

            if ($balance < $price) {
                echo json_encode([
                    'success' => false,
                    'message' => 'Insufficient Wallet Balance, please TopUp your wallet and try again.'
                ]);
                return;
            }

            // Ojah API configuration
            $api_url = DOJA_BASE_URL . '/v1/kyc/bvn/full?bvn=' . urlencode($bvn);
            $api_key = DOJA_API_KEY;
            $appid = DOJA_APP_ID;

            // Initialize cURL
            $ch = curl_init($api_url);

            // Set cURL options
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            // curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Content-Type: application/json',
                'Authorization: ' . $api_key,
                'AppId: ' . $appid
            ]);

            // // Send BVN data
            // $payload = json_encode(['bvn' => $bvn]);
            // curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);

            // Execute the request
            $response = curl_exec($ch);
            $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            $error = curl_error($ch);

            // Close cURL session
            curl_close($ch);

            // file_put_contents('data.txt', print_r(json_decode($response, true), true) . PHP_EOL, FILE_APPEND);

            if ($response === false) {
                echo json_encode([
                    'success' => false,
                    'message' => 'An error occurred during the API request: ' . $error,
                ]);
                exit;
            }

            $data = json_decode($response, true);

            if ($http_code === 200 && isset($data['entity'])) {
                $entity = $data['entity'];

                // Extract relevant details
                $first_name = $entity['first_name'];
                $last_name = $entity['last_name'];
                $middle_name = $entity['middle_name'];
                $gender = $entity['gender'];
                $date_of_birth = $entity['date_of_birth'];
                $phone_number = $entity['phone_number1'];
                $image = $entity['image'];

                // Define table values
                $type = 'Basic BVN Slip';

                $search_query = $bvn; // The `search_query` is the BVN input for this case

                $this->WalletController->Make_Tansaction_From_My_Wallet("bvn_verification_payment_{$timestamp}", $price, $userEmail);

                // Store in `verifications` table
                $this->data = parent::$db->run_insert(
                    'INSERT INTO verifications(type, amount, status, search_query, first_name, last_name, middle_name, gender, date_of_birth, phone_number, photo, email, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())',
                    [
                        $type,
                        $price,
                        'success',
                        $search_query,
                        $first_name,
                        $last_name,
                        $middle_name,
                        $gender,
                        $date_of_birth,
                        $phone_number,
                        $image,
                        $userEmail
                    ]
                );

                $insertedId = Conn::instance()->lastInsertId(); // Get the last inserted ID

                if ($this->data) {
                    echo json_encode([
                        'success' => true,
                        'message' => 'Basic BVN validation saved successfully.',
                        'data' => [
                            'id' => $insertedId,
                            'type' => $type,
                            'amount' => $price,
                            'search_query' => $search_query,
                            'first_name' => $first_name,
                            'last_name' => $last_name,
                            'middle_name' => $middle_name,
                            'gender' => $gender,
                            'date_of_birth' => $date_of_birth,
                            'phone_number' => $phone_number,
                            'photo' => $image,
                            'email' => $userEmail,
                            'created_at' => date('Y-m-d H:i:s')
                        ]
                    ]);
                } else {
                    echo json_encode([
                        'success' => false,
                        'message' => 'Failed to save BVN validation.',
                    ]);
                }
            } else {
                echo json_encode([
                    'success' => false,
                    'message' => 'BVN validation failed. Please try again.',
                ]);
            }
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'BVN is required.',
            ]);
        }
    }

    public function verifyAdvanceBvn(array $input)
    {
        if (isset($input['bvn']) && !empty($input['bvn'])) {
            $bvn = $input['bvn'];
            $userEmail = $this->UserAuth->GetUserId($_SESSION['Login_User'])->email;

            $balance = intval($this->WalletController->Get_Single_User_Wallet_Balance($userEmail)->balance);
            $price = BVN_ADVANCE_VERIFICATION_PRICE;
            $timestamp = time();

            if ($balance < $price) {
                echo json_encode([
                    'success' => false,
                    'message' => 'Insufficient Wallet Balance, please TopUp your wallet and try again.'
                ]);
                return;
            }

            // Ojah API configuration
            $api_url = DOJA_BASE_URL . '/v1/kyc/bvn/advance?bvn=' . urlencode($bvn);
            $api_key = DOJA_API_KEY;
            $appid = DOJA_APP_ID;

            // Initialize cURL
            $ch = curl_init($api_url);

            // Set cURL options
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            // curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Content-Type: application/json',
                'Authorization: ' . $api_key,
                'AppId: ' . $appid
            ]);

            // Execute the request
            $response = curl_exec($ch);
            $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            $error = curl_error($ch);

            // Close cURL session
            curl_close($ch);

            if ($response === false) {
                echo json_encode([
                    'success' => false,
                    'message' => 'An error occurred during the API request: ' . $error,
                ]);
                exit;
            }

            $data = json_decode($response, true);

            if ($http_code === 200 && isset($data['entity'])) {
                $entity = $data['entity'];

                // Extract relevant details
                $first_name = $entity['first_name'];
                $last_name = $entity['last_name'];
                $middle_name = $entity['middle_name'];
                $gender = $entity['gender'];
                $date_of_birth = $entity['date_of_birth'];
                $phone_number = $entity['phone_number1'];
                $image = $entity['image'];
                $owner_email = $entity['email'];
                $enrollment_bank = $entity['enrollment_bank'];
                $enrollment_branch = $entity['enrollment_branch'];
                $registration_date = $entity['registration_date'];
                $residential_address = $entity['residential_address'];
                $nin = $entity['nin'];

                // Define table values
                $type = 'Advanced BVN Slip';

                $search_query = $bvn;

                $this->WalletController->Make_Tansaction_From_My_Wallet("bvn_verification_payment_{$timestamp}", $price, $userEmail);

                // Store in `verifications` table
                $this->data = parent::$db->run_insert(
                    'INSERT INTO verifications(type, amount, status, search_query, first_name, last_name, middle_name, gender, date_of_birth, phone_number, photo, owner_email, enrollment_bank, enrollment_branch, registration_date, residential_address, nin, email, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())',
                    [
                        $type,
                        $price,
                        'success',
                        $search_query,
                        $first_name,
                        $last_name,
                        $middle_name,
                        $gender,
                        $date_of_birth,
                        $phone_number,
                        $image,
                        $owner_email,
                        $enrollment_bank,
                        $enrollment_branch,
                        $registration_date,
                        $residential_address,
                        $nin,
                        $userEmail
                    ]
                );

                $insertedId = Conn::instance()->lastInsertId(); // Get the last inserted ID

                if ($this->data) {
                    echo json_encode([
                        'success' => true,
                        'message' => 'Basic BVN validation saved successfully.',
                        'data' => [
                            'id' => $insertedId,
                            'type' => $type,
                            'amount' => $price,
                            'search_query' => $search_query,
                            'first_name' => $first_name,
                            'last_name' => $last_name,
                            'middle_name' => $middle_name,
                            'gender' => $gender,
                            'date_of_birth' => $date_of_birth,
                            'phone_number' => $phone_number,
                            'photo' => $image,
                            'owner_email' => $owner_email,
                            'enrollment_bank' => $enrollment_bank,
                            'enrollment_branch' => $enrollment_branch,
                           'registration_date' => $registration_date,
                           'residential_address' => $residential_address,
                            'nin' => $nin,
                        ]
                    ]);
                } else {
                    echo json_encode([
                        'success' => false,
                        'message' => 'Failed to save BVN validation.',
                    ]);
                }
            } else {
                echo json_encode([
                    'success' => false,
                    'message' => 'BVN validation failed. Please try again.',
                ]);
            }
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'BVN is required.',
            ]);
        }
    }

    public function submitNINDetail(array $input)
    {
        if (!empty($input['nin']) && !empty($input['type'])) {
            $nin = $input['nin'];
            $type = $input['type'];
            $userEmail = $this->UserAuth->GetUserId($_SESSION['Login_User'])->email;

            $balance = intval($this->WalletController->Get_Single_User_Wallet_Balance($userEmail)->balance);
            $price = 0;
            if ($type == 'Basic NIN Slip') {
                $price = NIN_SEARCH_BASIC_PRICE;
            }

            $timestamp = time();

            if ($balance < $price) {
                echo json_encode([
                    'success' => false,
                    'message' => 'Insufficient Wallet Balance, please TopUp your wallet and try again.'
                ]);
                return;
            }

             // Seamfix API configuration
             $api_url = SEAMFIX_BASE_URL;
             $api_key = SEAMFIX_API_KEY;
             $api_user_id = SEAMFIX_USER_ID;
 
             // Initialize cURL
             $ch = curl_init($api_url);
             curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
             curl_setopt($ch, CURLOPT_POST, true);
             curl_setopt($ch, CURLOPT_HTTPHEADER, [
                 'Content-Type: application/json',
                 'apiKey: ' . $api_key,
                 'userid: ' . $api_user_id
             ]);
             $payload = [
                 'verificationType' => 'NIN-VERIFY',
                 'countryCode' => 'NG',
                 'searchParameter' => $nin
             ];

             curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));

            // Execute the request
            $response = curl_exec($ch);
            $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            $error = curl_error($ch);

            // Close cURL session
            curl_close($ch);

            if ($response === false) {
                echo json_encode([
                    'success' => false,
                    'message' => 'An error occurred during the API request: ' . $error,
                ]);
                exit;
            }

            @file_put_contents('basic_nin.txt', $response . PHP_EOL, FILE_APPEND);
            $data = json_decode($response, true);

            if ($http_code === 200 && isset($data['response'])) {
                $entity = $data['response'][0];

                // Extract relevant details
                $first_name = $entity['firstname'];
                $last_name = $entity['surname'];
                $middle_name = $entity['middlename'];
                $gender = $entity['gender'];
                $photo = $entity['photo'];
                $date_of_birth = $entity['birthdate'];
                $email = $entity['email']??null;
                $phone_number = $entity['telephoneno'];

                $this->WalletController->Make_Tansaction_From_My_Wallet("nin_slip_search_payment_{$timestamp}", $price, $userEmail);

                // Store in `verifications` table
                $this->data = parent::$db->run_insert(
                    'INSERT INTO nin_details(nin, first_name, middle_name, last_name, gender, photo, date_of_birth, email, phone_number, user_email, type, price, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())',
                    [
                        $nin,
                        $first_name,
                        $middle_name,
                        $last_name,
                        $gender,
                        $photo,
                        $date_of_birth,
                        $email,
                        $phone_number,
                        $userEmail,
                        $type,
                        $price
                    ]
                );

                $insertedId = Conn::instance()->lastInsertId(); // Get the last inserted ID

                if ($this->data) {
                    echo json_encode([
                        'success' => true,
                        'message' => 'NIN Slip has been generated successfully.',
                        'data' => [
                            'id' => $insertedId,
                            'nin' => $nin,
                            'first_name' => $first_name,
                           'middle_name' => $middle_name,
                            'last_name' => $last_name,
                            'gender' => $gender,
                            'photo' => $photo,
                            'date_of_birth' => $date_of_birth,
                            'email' => $email,
                            'phone_number' => $phone_number,
                            'type' => $type,
                            'price' => $price,
                            'created_at' => date('Y-m-d H:i:s')
                        ],
                    ]);
                    return;
                } else {
                    echo json_encode([
                        'success' => false,
                        'message' => 'Failed to save search records.',
                    ]);
                    return;
                }
            } else if (isset($data['verificationStatus'])) {
                echo json_encode([
                    'success' => false,
                    'message' => $data['description'],
                ]);
                return;
            }
            else {
                echo json_encode([
                    'success' => false,
                    'message' => 'NIN Search failed. Please try again.',
                ]);
                return;
            }
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'NIN and type are required.',
            ]);
            return;
        }
    }

    public function submitNINRegularDetail(array $input)
    {
        if (!empty($input['nin']) && !empty($input['type'])) {
            $nin = $input['nin'];
            $type = $input['type'];
            $userEmail = $this->UserAuth->GetUserId($_SESSION['Login_User'])->email;

            $balance = intval($this->WalletController->Get_Single_User_Wallet_Balance($userEmail)->balance);
            $price = 0;
            if ($type == 'Regular NIN Slip') {
                $price = NIN_SEARCH_REGULAR_PRICE;
            }

            $timestamp = time();

            if ($balance < $price) {
                echo json_encode([
                    'success' => false,
                    'message' => 'Insufficient Wallet Balance, please TopUp your wallet and try again.'
                ]);
                return;
            }

            // Seamfix API configuration
            $api_url = SEAMFIX_BASE_URL;
            $api_key = SEAMFIX_API_KEY;
            $api_user_id = SEAMFIX_USER_ID;

            // Initialize cURL
            $ch = curl_init($api_url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Content-Type: application/json',
                'apiKey: ' . $api_key,
                'userid: ' . $api_user_id
            ]);
            $payload = [
                'verificationType' => 'NIN-VERIFY',
                'countryCode' => 'NG',
                'searchParameter' => $nin
            ];
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));

            // Execute the request
            $response = curl_exec($ch);
            $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            $error = curl_error($ch);

            // Close cURL session
            curl_close($ch);

            if ($response === false) {
                echo json_encode([
                    'success' => false,
                    'message' => 'An error occurred during the API request: ' . $error,
                ]);
                exit;
            }

            $data = json_decode($response, true);

            if ($http_code === 200 && isset($data['response'])) {
                $entity = $data['response'][0];

                // Extract relevant details
                $first_name = $entity['firstname'];
                $last_name = $entity['surname'];
                $middle_name = $entity['middlename'];
                $gender = $entity['gender'];
                $photo = $entity['photo'];
                $date_of_birth = $entity['birthdate'];
                $email = $entity['email']??null;
                $phone_number = $entity['telephoneno'];
                $tracking_id = $entity['trackingId'];
                $residence_address = $entity['residence_AdressLine1'];
                $residence_lga = $entity['residence_lga'];
                $residence_state = $entity['residence_state'];

                $this->WalletController->Make_Tansaction_From_My_Wallet("nin_slip_search_payment_{$timestamp}", $price, $userEmail);

                // Store in `verifications` table
                $this->data = parent::$db->run_insert(
                    'INSERT INTO nin_details(nin, first_name, middle_name, last_name, gender, photo, date_of_birth, email, phone_number, tracking_id, residence_adressline, residence_lga, residence_state, user_email, type, price, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())',
                    [
                        $nin,
                        $first_name,
                        $middle_name,
                        $last_name,
                        $gender,
                        $photo,
                        $date_of_birth,
                        $email,
                        $phone_number,
                        $tracking_id,
                        $residence_address,
                        $residence_lga,
                        $residence_state,
                        $userEmail,
                        $type,
                        $price
                    ]
                );

                $insertedId = Conn::instance()->lastInsertId(); // Get the last inserted ID

                if ($this->data) {
                    echo json_encode([
                        'success' => true,
                        'message' => 'NIN Slip has been generated successfully.',
                        'data' => [
                            'id' => $insertedId,
                            'nin' => $nin,
                            'first_name' => $first_name,
                            'middle_name' => $middle_name,
                            'last_name' => $last_name,
                            'gender' => $gender,
                            'photo' => $photo,
                            'date_of_birth' => $date_of_birth,
                            'email' => $email,
                            'phone_number' => $phone_number,
                            'tracking_id' => $tracking_id,
                            'residence_adressline' => $residence_address,
                            'residence_lga' => $residence_lga,
                            'residence_state' => $residence_state,
                        ]
                    ]);
                    return;
                } else {
                    echo json_encode([
                        'success' => false,
                        'message' => 'Failed to save search records.',
                    ]);
                    return;
                }
            } else {
                echo json_encode([
                    'success' => false,
                    'message' => 'NIN Search failed. Please try again.',
                ]);
                return;
            }
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'NIN and type are required.',
            ]);
            return;
        }
    }

    public function submitNINImprovedDetail(array $input)
    {
        if (!empty($input['nin']) && !empty($input['type'])) {
            $nin = $input['nin'];
            $type = $input['type'];
            $userEmail = $this->UserAuth->GetUserId($_SESSION['Login_User'])->email;

            $balance = intval($this->WalletController->Get_Single_User_Wallet_Balance($userEmail)->balance);
            $price = 0;
            if ($type == 'Improved NIN Slip') {
                $price = NIN_SEARCH_IMPROVE_PRICE;
            }

            $timestamp = time();

            if ($balance < $price) {
                echo json_encode([
                    'success' => false,
                    'message' => 'Insufficient Wallet Balance, please TopUp your wallet and try again.'
                ]);
                return;
            }

            // Seamfix API configuration
            $api_url = SEAMFIX_BASE_URL;
            $api_key = SEAMFIX_API_KEY;
            $api_user_id = SEAMFIX_USER_ID;

            // Initialize cURL
            $ch = curl_init($api_url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Content-Type: application/json',
                'apiKey: ' . $api_key,
                'userid: ' . $api_user_id
            ]);
            $payload = [
                'verificationType' => 'NIN-VERIFY',
                'countryCode' => 'NG',
                'searchParameter' => $nin
            ];
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));

            // Execute the request
            $response = curl_exec($ch);
            $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            $error = curl_error($ch);

            // Close cURL session
            curl_close($ch);

            if ($response === false) {
                echo json_encode([
                    'success' => false,
                    'message' => 'An error occurred during the API request: ' . $error,
                ]);
                exit;
            }

            $data = json_decode($response, true);

            if ($http_code === 200 && isset($data['response'])) {
                $entity = $data['response'][0];

                // Extract relevant details
                $first_name = $entity['firstname'];
                $last_name = $entity['surname'];
                $middle_name = $entity['middlename'];
                $gender = $entity['gender'];
                $photo = $entity['photo'];
                $date_of_birth = $entity['birthdate'];
                $email = $entity['email']??null;
                $phone_number = $entity['telephoneno'];
                $tracking_id = $entity['trackingId'];
                $residence_address = $entity['residence_AdressLine1'];
                $residence_lga = $entity['residence_lga'];
                $residence_state = $entity['residence_state'];
                $signature = $entity['signature'];

                $this->WalletController->Make_Tansaction_From_My_Wallet("nin_slip_search_payment_{$timestamp}", $price, $userEmail);

                $data = [
                    'nin' => $nin,
                    'first_name' => $first_name,
                    'last_name' => $last_name,
                    'middle_name' => $middle_name,
                    'gender' => $gender,
                    // 'photo' => $photo,
                    'date_of_birth' => $date_of_birth,
                    'email' => $email,
                    'phone_number' => $phone_number,
                    'tracking_id' => $tracking_id,
                    'residence_adressline' => $residence_address,
                    'residence_lga' => $residence_lga,
                    'residence_state' => $residence_state,
                ];

                $qrcode = $this->generateBarcode($data);

                // Store in `verifications` table
                $this->data = parent::$db->run_insert(
                    'INSERT INTO nin_details(nin, first_name, middle_name, last_name, gender, photo, date_of_birth, email, phone_number, tracking_id, residence_adressline, residence_lga, residence_state, qrcode, user_email, type, price, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())',
                    [
                        $nin,
                        $first_name,
                        $middle_name,
                        $last_name,
                        $gender,
                        $photo,
                        $date_of_birth,
                        $email,
                        $phone_number,
                        $tracking_id,
                        $residence_address,
                        $residence_lga,
                        $residence_state,
                        $qrcode,
                        $userEmail,
                        $type,
                        $price
                    ]
                );

                $insertedId = Conn::instance()->lastInsertId(); // Get the last inserted ID

                if ($this->data) {
                    echo json_encode([
                        'success' => true,
                        'message' => 'NIN Slip has been generated successfully.',
                        'data' => $data + ['photo' => $photo, 'qrcode' => $qrcode, 'id' => $insertedId]
                    ]);
                    return;
                } else {
                    echo json_encode([
                        'success' => false,
                        'message' => 'Failed to save search records.',
                    ]);
                    return;
                }
            } else {
                echo json_encode([
                    'success' => false,
                    'message' => 'NIN Search failed. Please try again.',
                ]);
                return;
            }
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'NIN and type are required.',
            ]);
            return;
        }
    }

    public function submitVirtualNINDetail(array $input)
    {
        if (!empty($input['nin']) && !empty($input['type'])) {
            $nin = $input['nin'];
            $type = $input['type'];
            $userEmail = $this->UserAuth->GetUserId($_SESSION['Login_User'])->email;

            $balance = intval($this->WalletController->Get_Single_User_Wallet_Balance($userEmail)->balance);
            $price = 0;
            if ($type == 'Virtual NIN Slip') {
                $price = VIRTUAL_NIN_SEARCH_PRICE;
            }

            $timestamp = time();

            if ($balance < $price) {
                echo json_encode([
                    'success' => false,
                    'message' => 'Insufficient Wallet Balance, please TopUp your wallet and try again.'
                ]);
                return;
            }

            // Seamfix API configuration
            $api_url = SEAMFIX_BASE_URL;
            $api_key = SEAMFIX_API_KEY;
            $api_user_id = SEAMFIX_USER_ID;

            // Initialize cURL
            $ch = curl_init($api_url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Content-Type: application/json',
                'apiKey: ' . $api_key,
                'userid: ' . $api_user_id
            ]);
            $payload = [
                'verificationType' => 'V-NIN',
                'countryCode' => 'NG',
                'transactionReference' => 'TRX-' . uniqid() . '-' . bin2hex(random_bytes(4)),
                'searchParameter' => $nin
            ];
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));

            // Execute the request
            $response = curl_exec($ch);
            $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            $error = curl_error($ch);

            // Close cURL session
            curl_close($ch);

            if ($response === false) {
                echo json_encode([
                    'success' => false,
                    'message' => 'An error occurred during the API request: ' . $error,
                ]);
                exit;
            }

            @file_put_contents('v_nin_data.txt', $response . PHP_EOL, FILE_APPEND);

            $data = json_decode($response, true);

            if ($http_code === 200 && isset($data['response'])) {
                $entity = $data['response'][0];

                // Extract relevant details
                $first_name = $entity['firstname'];
                $last_name = $entity['surname'];
                $middle_name = $entity['middlename'];
                $gender = $entity['gender'];
                $photo = $entity['photo']??null;
                $date_of_birth = $entity['birthdate'];
                $email = $entity['email']??null;
                $txid = $entity['txid'];
                $ts = $entity['ts'];
                $agent_id = $entity['agentID'];

                $this->WalletController->Make_Tansaction_From_My_Wallet("nin_slip_search_payment_{$timestamp}", $price, $userEmail);

                $data = [
                    'nin' => $nin,
                    'first_name' => $first_name,
                    'last_name' => $last_name,
                    'middle_name' => $middle_name,
                    'gender' => $gender,
                    // 'photo' => $photo,
                    'date_of_birth' => $date_of_birth,
                    'email' => $email,
                    'txid' => $txid,
                    'ts' => $ts,
                    'agent_id' => $agent_id
                ];

                $qrcode = $this->generateBarcode($data);

                // Store in `verifications` table
                $this->data = parent::$db->run_insert(
                    'INSERT INTO nin_details(nin, first_name, middle_name, last_name, gender, photo, date_of_birth, email, txid, ts, agent_id , qrcode, user_email, type, price, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())',
                    [
                        $nin,
                        $first_name,
                        $middle_name,
                        $last_name,
                        $gender,
                        $photo,
                        $date_of_birth,
                        $email,
                        $txid,
                        $ts,
                        $agent_id,
                        $qrcode,
                        $userEmail,
                        $type,
                        $price
                    ]
                );

                $insertedId = Conn::instance()->lastInsertId(); // Get the last inserted ID

                if ($this->data) {
                    echo json_encode([
                        'success' => true,
                        'message' => 'NIN Slip has been generated successfully.',
                        'data' => $data + ['photo' => $photo, 'qrcode' => $qrcode, 'id' => $insertedId]
                    ]);
                    return;
                } else {
                    echo json_encode([
                        'success' => false,
                        'message' => 'Failed to save search records.',
                    ]);
                    return;
                }
            } else {
                echo json_encode([
                    'success' => false,
                    'message' => 'NIN Search failed. Please try again.',
                ]);
                return;
            }
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'NIN and type are required.',
            ]);
            return;
        }
    }

    protected function generateBarcode($data) 
    {
        try {

            $writer = new PngWriter();

            // Create QR code
            $qrCode = new QrCode(
                data: json_encode($data),
                encoding: new Encoding('UTF-8'),
                errorCorrectionLevel: ErrorCorrectionLevel::Low,
                size: 300,
                margin: 10,
                roundBlockSizeMode: RoundBlockSizeMode::Margin,
                foregroundColor: new Color(0, 0, 0),
                backgroundColor: new Color(255, 255, 255)
            );

            $result = $writer->write($qrCode);

            // Directly output the QR code
            // header('Content-Type: '.$result->getMimeType());
            // echo $result->getString();

            // Save it to a file
            // $result->saveToFile('../../dashboard/qrcodes/'. uniqid() .'.png');

            // Generate a data URI to include image data inline (i.e. inside an <img> tag)
            return $result->getDataUri();
        } catch (\Exception $e) {
            throw $e;
        }
    }

    public function Get_All_Verifications_By_Type(?string $type = null, ?string $userEmail = null, ?string $id = null)
    {
        $query = "SELECT * FROM verifications";
        $params = [];

        if ($type) {
            $query .= " WHERE type = :type";
            $params['type'] = $type;
        }

        if ($userEmail) {
            $query .= !$type ? " WHERE email = :email" : " AND email = :email";
            $params['email'] = $userEmail;
            if ($id) {
                $query.= " AND id = :id";
                $params['id'] = $id;
            }
        }

        $query .= " ORDER BY id DESC";

        $this->data = parent::$db->run_select($query, $params);

        return $this->data ?: [];
    }


    public function submitNIN($data)
    {
        // Company Details
        $nin = htmlspecialchars(trim($data['nin']));
        $email = htmlspecialchars(trim($data['email']));
        $whatsapp_no = htmlspecialchars(trim($data['whatsapp_no']));
        $userEmail = $this->UserAuth->GetUserId($_SESSION['Login_User'])->email;

        if (empty($nin) || empty($email) || empty($whatsapp_no)) {
            echo json_encode([
                'success' => false,
                'message' => 'All fields are required.'
            ]);
            return;
        }

        $balance = intval($this->WalletController->Get_Single_User_Wallet_Balance($userEmail)->balance);
        $price = NIN_VALIDATION_PRICE;
        $timestamp = time();

        if ($balance < $price) {
            echo json_encode([
                'success' => false,
                'message' => 'Insufficient Wallet Balance, please TopUp your wallet and try again.'
            ]);
            return;
        }

        if ($this->WalletController->Make_Tansaction_From_My_Wallet("nin_validation_payment_{$timestamp}", $price, $userEmail)) {
            // Store in `nin_verifications` table
            $this->data = parent::$db->run_insert(
                'INSERT INTO nin_validation(nin, email, whatsapp_no, price, user_email, created_at) VALUES (?,?,?,?,?, NOW())',
                [
                    $nin,
                    $email,
                    $whatsapp_no,
                    $price,
                    $userEmail
                ]
            );

            echo json_encode([
                'success' => true,
                'message' => 'NIN validation request submitted successfully.',
            ]);
            return;
        }

        echo json_encode([
            'success' => false,
            'message' => 'Failed to submit NIN validation request.',
        ]);
        return;
    }

    public function submitNINPersonalization($data)
    {
        // Company Details
        $tracking_id = htmlspecialchars(trim($data['tracking_id']));
        $email = htmlspecialchars(trim($data['email']));
        $whatsapp_no = htmlspecialchars(trim($data['whatsapp_no']));
        $userEmail = $this->UserAuth->GetUserId($_SESSION['Login_User'])->email;

        if (empty($tracking_id) || empty($email) || empty($whatsapp_no)) {
            echo json_encode([
                'success' => false,
                'message' => 'All fields are required.'
            ]);
            return;
        }

        $balance = intval($this->WalletController->Get_Single_User_Wallet_Balance($userEmail)->balance);
        $price = NIN_PERSONALIZATION_PRICE;
        $timestamp = time();

        if ($balance < $price) {
            echo json_encode([
                'success' => false,
                'message' => 'Insufficient Wallet Balance, please TopUp your wallet and try again.'
            ]);
            return;
        }

        if ($this->WalletController->Make_Tansaction_From_My_Wallet("nin_personalization_payment_{$timestamp}", $price, $userEmail)) {
            // Store in `nin_verifications` table
            $this->data = parent::$db->run_insert(
                'INSERT INTO nin_personalizations(tracking_id, email, whatsapp_no, price, user_email, created_at) VALUES (?,?,?,?,?, NOW())',
                [
                    $tracking_id,
                    $email,
                    $whatsapp_no,
                    $price,
                    $userEmail
                ]
            );

            echo json_encode([
                'success' => true,
                'message' => 'NIN personalization request submitted successfully.',
            ]);
            return;
        }

        echo json_encode([
            'success' => false,
            'message' => 'Failed to submit NIN personalization request.',
        ]);
        return;
    }

    public function submitIPEClearing($data)
    {
        // Company Details
        $tracking_id = htmlspecialchars(trim($data['tracking_id']));
        $email = htmlspecialchars(trim($data['email']));
        $whatsapp_no = htmlspecialchars(trim($data['whatsapp_no']));
        $userEmail = $this->UserAuth->GetUserId($_SESSION['Login_User'])->email;

        if (empty($tracking_id) || empty($email) || empty($whatsapp_no)) {
            echo json_encode([
                'success' => false,
                'message' => 'All fields are required.'
            ]);
            return;
        }

        $balance = intval($this->WalletController->Get_Single_User_Wallet_Balance($userEmail)->balance);
        $price = IPE_CLEARING_PRICE;
        $timestamp = time();

        if ($balance < $price) {
            echo json_encode([
                'success' => false,
                'message' => 'Insufficient Wallet Balance, please TopUp your wallet and try again.'
            ]);
            return;
        }

        if ($this->WalletController->Make_Tansaction_From_My_Wallet("nin_validation_payment_{$timestamp}", $price, $userEmail)) {
            // Store in `nin_verifications` table
            $this->data = parent::$db->run_insert(
                'INSERT INTO nin_validation(nin, email, whatsapp_no, type, created_at) VALUES (?,?,?,?, NOW())',
                [
                    $tracking_id,
                    $email,
                    $whatsapp_no,
                    'ipe_clearing'
                ]
            );

            echo json_encode([
                'success' => true,
                'message' => 'IPE Clearing request submitted successfully.',
            ]);
            return;
        }

        echo json_encode([
            'success' => false,
            'message' => 'Failed to submit IPE Clearing request.',
        ]);
        return;
    }


    public function submitNINModification($data)
    {
        $type = htmlspecialchars(trim($data['type']));
        $nin = htmlspecialchars(trim($data['nin']));
        $first_name = htmlspecialchars(trim($data['first_name']));
        $middle_name = htmlspecialchars(trim($data['middle_name']));
        $last_name = htmlspecialchars(trim($data['last_name']));
        $dob = htmlspecialchars(trim($data['dob']));
        $city = htmlspecialchars(trim($data['city']));
        $state = htmlspecialchars(trim($data['state']));
        $lga = htmlspecialchars(trim($data['lga']));
        $address = htmlspecialchars(trim($data['address']));
        $userEmail = $this->UserAuth->GetUserId($_SESSION['Login_User'])->email;

        if (empty($type) || empty($nin) || empty($city) || empty($state) || empty($lga) || empty($address)) {
            echo json_encode([
                'success' => false,
                'message' => 'All fields are required.'
            ]);
            return;
        }

        $price = 0;
        if ($type == 'name' && (empty($first_name) || empty($last_name))) {
            $price = NIN_NAME_MODIFICATION_PRICE;
            echo json_encode([
                'success' => false,
                'message' => 'First and Last name fields are required.'
            ]);
            return;
        }

        if ($type == 'dob') {
            $price = NIN_DOB_MODIFICATION_PRICE;
            $dobValidated = $this->validateDOB($dob);
            if (!$dobValidated['success']) {
                echo json_encode($dobValidated);
                return;
            }
        }

        $balance = intval($this->WalletController->Get_Single_User_Wallet_Balance($userEmail)->balance);
        $timestamp = time();

        if ($balance < $price) {
            echo json_encode([
                'success' => false,
                'message' => 'Insufficient Wallet Balance, please TopUp your wallet and try again.'
            ]);
            return;
        }

        if ($this->WalletController->Make_Tansaction_From_My_Wallet("nin_modification_payment_{$timestamp}", $price, $userEmail)) {
            // Store in `nin_verifications` table
            $this->data = parent::$db->run_insert(
                'INSERT INTO nin_modification(type, nin, first_name, last_name, middle_name, dob, city, state, lga, address, price, created_at) VALUES (?,?,?,?,?,?,?,?,?,?,?, NOW())',
                [
                    $type,
                    $nin,
                    $first_name,
                    $last_name,
                    $middle_name,
                    $dob,
                    $city,
                    $state,
                    $lga,
                    $address,
                    $price
                ]
            );

            echo json_encode([
                'success' => true,
                'message' => 'NIN modification request submitted successfully.',
            ]);
            return;
        }

        echo json_encode([
            'success' => false,
            'message' => 'Failed to submit NIN modification request.',
        ]);
        return;
    }

    private function validateDOB(string $dob)
    {
        if (!empty($dob)) {
            $dobDateTime = new DateTime($dob);
            $currentDate = new DateTime();
            $age = $currentDate->diff($dobDateTime)->y;

            if ($age >= 18) {
                return [
                    'success' => true,
                    'message' => "The person is older than or exactly 18 years."
                ];
            } else {
                return [
                    'success' => false,
                    'message' => "The person is younger than 18 years."
                ];
            }
        } else {
            return [
                'success' => false,
                'message' => "Date of birth is required."
            ];
        }
    }
}
