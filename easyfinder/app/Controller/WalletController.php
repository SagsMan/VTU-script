<?php
namespace EduTech\Controller;
use \PDO;
use EduTech\C_Base;
use EduTech\SessionHelper\Session;
use SimpleValidator\Validator;

class WalletController extends C_base
{
    public function Generate_Trans_id()
    {
        $Trans_id = rand(111111111, 999999999) . rand(111111111, 999999999);
        if (
            $this->data = parent::$db->run_select(
                'SELECT trans_id FROM payment_history_tbl WHERE trans_id = ? LIMIT 1',
                [$Trans_id]
            )
        ) {
            return $Trans_id + 1;
        } else {
            return $Trans_id;
        }
    }

    public function Check_If_My_Payment_Transaction_Id_Exist($trans)
    {
        if (
            $this->data = parent::$db->run_select(
                'SELECT trans_id FROM payment_history_tbl WHERE trans_id = ? LIMIT 1',
                [$trans]
            )
        ) {
            return true;
        } else {
            return false;
        }
    }

    public function Check_If_My_Transaction_Id_Exist($trans, $table)
    {
        if (
            $this->data = parent::$db->run_select(
                "SELECT request_id  FROM $table WHERE request_id = ? LIMIT 1",
                [$trans]
            )
        ) {
            return true;
        } else {
            return false;
        }
    }

    public function Check_If_Tran_Id_Exist($trans, $table)
    {
        if (
            $this->data = parent::$db->run_select(
                "SELECT trans_id FROM $table WHERE trans_id = ? LIMIT 1",
                [$trans]
            )
        ) {
            return true;
        } else {
            return false;
        }
    }

    public function Store_My_Wallet_Transaction($trans, $amount, $email)
    {
        if (
            $this->data = parent::$db->run_insert(
                'INSERT INTO payment_history_tbl(trans_id,amount,email) VALUES(?,?,?)',
                [$trans, $amount, $email]
            )
        ) {
            return true;
        }
    }

    public function Get_Pending_Transfer_Trans_Info($trans_id)
    {
        if (
            $this->data = parent::$db->run_select(
                'SELECT * FROM cash_out_tbl WHERE request_id = ? AND status = 0 LIMIT 1',
                [$trans_id]
            )
        ) {
            return $this->data[0];
        }
    }

    public function Save_Add_Wallet_Money_Trans_Status(
        $trans,
        $amount,
        $email,
        $status
    ) {
        if (
            $this->data = parent::$db->run_insert(
                'INSERT INTO wallet_history_tbl(trans_id,email,trans_amount,available_balance,wallet_status) SELECT ?,user_id,?,balance,? FROM wallet_tbl WHERE user_id = ? ',
                [$trans, $amount, $status, $email]
            )
        ) {
            return true;
        }
    }

    public function Save_Remove_Wallet_Money_Trans_Status(
        $trans,
        $amount,
        $email,
        $status
    ) {
        if (
            $this->data = parent::$db->run_insert(
                'INSERT INTO wallet_history_tbl(trans_id,email,trans_amount,available_balance,wallet_status) SELECT ?,user_id,?,balance-?,? FROM wallet_tbl WHERE user_id = ? ',
                [$trans, $amount, $amount, $status, $email]
            )
        ) {
            return true;
        }
    }
    
    public function Refund_Wallet_Money($trans_id, $email, $amount)
    {
        try {
            // Refund the amount to wallet
            $refund_query = parent::$db->run_insert(
                'UPDATE wallet_tbl SET balance = balance + ? WHERE user_id = ?',
                [$amount, $email]
            );
            
            // Update wallet history status to refunded (status = 3)
            $update_history = parent::$db->run_insert(
                'UPDATE wallet_history_tbl SET status = 3 WHERE trans_id = ? AND email = ?',
                [$trans_id, $email]
            );
            
            return $refund_query && $update_history;
        } catch (Exception $e) {
            error_log("Refund error: " . $e->getMessage());
            return false;
        }
    }

    public function Update_Successful_Remove_Wallet_Money_Trans_Status(
        $product_id,
        $amount,
        $trans,
        $email
    ) {
        $earn_amount = 0;
        if (
            $this->data = parent::$db->run_insert(
                'UPDATE wallet_history_tbl SET status = 1 WHERE email = ? AND trans_id = ? ',
                [$email, $trans]
            )
        ) {
            if ($product_id != '') {
                $earn_amount = $this->Credit_Referal_Walllet(
                    $product_id,
                    $trans,
                    $amount,
                    $email
                );
            }
            if (!empty($earn_amount)) {
                return $earn_amount;
            } else {
                return '0.0';
            }
        }
    }

    public function Update_Successful_Remove_Wallet_Money_Transfer(
        $trans,
        $email
    ) {
        if (
            $this->data = parent::$db->run_insert(
                'UPDATE wallet_history_tbl SET status = 1 WHERE email = ? AND trans_id = ? ',
                [$email, $trans]
            )
        ) {
            return true;
        }
    }

    public function Update_Refund_failed_Wallet_Money_Trans_Status(
        $trans,
        $email,
        $amount
    ) {
        if (
            $this->data = parent::$db->run_insert(
                "UPDATE wallet_history_tbl SET status = 1, wallet_status ='Refund', available_balance = trans_amount + available_balance WHERE email = ? AND trans_id = ? ",
                [$email, $trans]
            )
        ) {
            if ($this->Credit_My_Wallet($amount, $email)) {
                return true;
            }
        }
    }

    public function Admin_Credit_User_Manually($trans, $email, $amount, $status)
    {
        if (
            $this->data = parent::$db->run_insert(
                'INSERT INTO wallet_history_tbl(trans_id,email,trans_amount,available_balance,wallet_status,status) SELECT ?,user_id,?,balance+?,?,? FROM wallet_tbl WHERE user_id = ? ',
                [$trans, $amount, $amount, $status, '1', $email]
            )
        ) {
            if ($this->Credit_My_Wallet($amount, $email)) {
                return true;
            }
        }
    }

    public function Update_Successful_Wallet_Money_Trans_Status($trans, $email)
    {
        if (
            $this->data = parent::$db->run_insert(
                'UPDATE wallet_history_tbl SET status = 1, available_balance = trans_amount + available_balance WHERE email = ? AND trans_id = ? ',
                [$email, $trans]
            )
        ) {
            return true;
        }
    }

    public function Get_Wallet_Money_Trans($email, $role)
    {
        if (
            $this->data = parent::$db->run_select(
                "SELECT * FROM wallet_history_tbl WHERE email = ? OR super_admin IN($role) ORDER BY id DESC",
                [$email]
            )
        ) {
            return $this->data;
        }
    }

    public function Update_Successful_Transaction($reason, $trans_id)
    {
        if (
            $this->data = parent::$db->run_insert(
                'UPDATE payment_history_tbl SET status =1, reason = ? WHERE trans_id = ?',
                [$reason, $trans_id]
            )
        ) {
            return true;
        }
    }

    public function Get_Pending_Trans_Id($trans)
    {
        if (
            $this->data = parent::$db->run_select(
                'SELECT * FROM payment_history_tbl WHERE trans_id = ? AND status = 0 LIMIT 1',
                [$trans]
            )
        ) {
            return $this->data[0];
        }
    }

    public function Get_Successful_Trans_Id($trans)
    {
        if (
            $this->data = parent::$db->run_select(
                'SELECT * FROM payment_history_tbl WHERE trans_id = ? AND status = 1 LIMIT 1',
                [$trans]
            )
        ) {
            return $this->data[0];
        }
    }

    public function Credit_My_Wallet($amount, $email)
    {
        if (
            $this->data = parent::$db->run_insert(
                'UPDATE wallet_tbl SET balance = balance + ? WHERE user_id = ?',
                [$amount, $email]
            )
        ) {
            return true;
        }
    }

    public function Check_Available_Balance_From_Wallet_To_Make_Transaction(
        $amount,
        $email
    ) {
        if (
            $this->data = parent::$db->run_select(
                'SELECT balance FROM wallet_tbl  WHERE balance >= ? AND user_id = ?',
                [$amount, $email]
            )
        ) {
            return true;
        }
    }
    public function Make_Tansaction_From_My_Wallet(
        $trans,
        $amount,
        $email,
        $trans_status = 'debit'
    ) {
        if (
            $this->Check_Available_Balance_From_Wallet_To_Make_Transaction(
                $amount,
                $email
            )
        ) {
            if (
                $this->Save_Remove_Wallet_Money_Trans_Status(
                    $trans,
                    $amount,
                    $email,
                    $trans_status
                )
            ) {
                $payable_amount = $amount;
                if (
                    $this->data = parent::$db->run_insert(
                        'UPDATE wallet_tbl SET balance = balance - ? WHERE user_id = ?',
                        [$payable_amount, $email]
                    )
                ) {
                    return true;
                }
            }
        } else {
            return false;
        }
    }

    public function Request_For_Cash_Out(
        $trans,
        $amount,
        $email,
        $account_no,
        $account_name,
        $bank_code,
        $recipient_code,
        $integration,
        $id,
        $API
    ) {
        $charges = (1 / 100) * $amount;
        if (
            $this->Check_Available_Balance_From_Wallet_To_Make_Transaction(
                $amount + $charges,
                $email
            )
        ) {
            if (
                $this->Make_Tansaction_From_My_Wallet(
                    $trans,
                    $amount + $charges,
                    $email,
                    'cashOut'
                )
            ) {
                if (
                    $this->data = parent::$db->run_insert(
                        'INSERT INTO cash_out_tbl(amount,charges,account_number,account_name,bank_code,recipient_code,integration,transfer_id,email,request_id) VALUES(?,?,?,?,?,?,?,?,?,?)',
                        [
                            $amount,
                            $charges,
                            $account_no,
                            $account_name,
                            $bank_code,
                            $recipient_code,
                            $integration,
                            $id,
                            $email,
                            $trans,
                        ]
                    )
                ) {
                    if (
                        $TransferMoney = $this->Cash_Out_Wallet_Money_With_Transfer(
                            $amount,
                            $recipient_code,
                            $API
                        )
                    ) {
                        if (!empty($TransferMoney->data->message)) {
                            if (
                                $TransferMoney->data->status == 'success' ||
                                $TransferMoney->data->status == 'pending'
                            ) {
                                if (
                                    $this->Confirm_Successful_Wallet_Money_CashOut(
                                        $TransferMoney->data->reference,
                                        $TransferMoney->data->transfer_code,
                                        $TransferMoney->data->createdAt,
                                        $email,
                                        $trans
                                    )
                                ) {
                                    $this->Update_Successful_Remove_Wallet_Money_Trans_Status(
                                        '',
                                        $amount,
                                        $trans,
                                        $email
                                    );
                                    return $TransferMoney;
                                }
                            }
                        } else {
                            $this->Update_Successful_Remove_Wallet_Money_Trans_Status(
                                '',
                                $amount,
                                $trans,
                                $email
                            );
                            return $TransferMoney;
                        }
                    }
                }
            }
        }
    }

    public function Confirm_Successful_Wallet_Money_CashOut(
        $reference,
        $transfer_code,
        $createdAt,
        $email,
        $trans,
        $status = '1'
    ) {
        if (
            $this->data = parent::$db->run_insert(
                'UPDATE cash_out_tbl SET reference = ?,transfer_code=?,cash_date=?,status=? WHERE email = ? AND request_id =?',
                [
                    $reference,
                    $transfer_code,
                    $createdAt,
                    $status,
                    $email,
                    $trans,
                ]
            )
        ) {
            return true;
        }
    }

    public function Credit_Referal_Walllet($product_id, $trans, $amount, $email)
    {
        $earn_amount = $this->Get_Refaral_Share($product_id, $amount);
        if ($user_referal = $this->Get_User_Refaral_If_Avialable(md5($email))) {
            $user_referal_email = $this->Get_Refaral_Email($user_referal);
            if (
                $this->data = parent::$db->run_insert(
                    'INSERT INTO referal_earn_transaction_tbl(buyer_email,referal_email,earn_amount,trans_id) VALUES(?,?,?,?)',
                    [$email, $user_referal_email, $earn_amount, $trans]
                )
            ) {
                if (
                    $this->data = parent::$db->run_insert(
                        'UPDATE wallet_tbl SET balance = balance + ? WHERE user_id = ?',
                        [$earn_amount, $user_referal_email]
                    )
                ) {
                    return $earn_amount;
                }
            }
        }
    }

    public function Get_Refaral_Email($user_referal)
    {
        if (
            $this->data = parent::$db->run_select(
                'SELECT email FROM users_tbl WHERE referal_token = ? LIMIT 1',
                [$user_referal]
            )
        ) {
            return $this->data[0]->email;
        }
    }

    public function Get_User_Earn_History($email, $role)
    {
        if (
            $this->data = parent::$db->run_select(
                'SELECT * FROM referal_earn_transaction_tbl WHERE referal_email = ? ORDER BY id DESC',
                [$email]
            )
        ) {
            return $this->data;
        }
    }

    public function Get_Refaral_Share($product_id, $amount)
    {
        if (
            $this->data = parent::$db->run_select(
                'SELECT referal_share FROM discount_tbl WHERE product_id = ? LIMIT 1',
                [$product_id]
            )
        ) {
            $referal_share = ($this->data[0]->referal_share / 100) * $amount;
            return ceil($referal_share);
        }
    }

    public function Get_User_Refaral_If_Avialable($referee)
    {
        if (
            $this->data = parent::$db->run_select(
                'SELECT referal FROM referal_tbl WHERE referee = ? LIMIT 1',
                [$referee]
            )
        ) {
            return $this->data[0]->referal;
        }
    }

    public function Transfer_From_My_Wallet(
        $trans,
        $amount,
        $email,
        $transferee
    ) {
        if (
            $this->Check_Available_Balance_From_Wallet_To_Make_Transaction(
                $amount,
                $email
            )
        ) {
            if (
                $this->Save_Remove_Wallet_Money_Trans_Status(
                    $trans,
                    $amount,
                    $email,
                    'transfered'
                )
            ) {
                if (
                    $this->data = parent::$db->run_insert(
                        'UPDATE wallet_tbl SET balance = balance - ? WHERE user_id = ?',
                        [$amount, $email]
                    )
                ) {
                    $this->Update_Successful_Remove_Wallet_Money_Transfer(
                        $trans,
                        $email
                    );
                    if (
                        $this->data = parent::$db->run_insert(
                            'UPDATE wallet_tbl SET balance = balance + ? WHERE user_id = ?',
                            [$amount, $transferee]
                        )
                    ) {
                        $this->Update_Successful_Remove_Wallet_Money_Transfer(
                            $trans,
                            $transferee
                        );
                        if (
                            $this->Save_Remove_Wallet_Money_Trans_Status(
                                $trans,
                                $amount,
                                $transferee,
                                'recieved'
                            )
                        ) {
                            if (
                                $this->data = parent::$db->run_insert(
                                    'INSERT INTO wallet_money_transfer_tbl(trans_id,transferer_id,transferee_id,amount) VALUES(?,?,?,?)',
                                    [$trans, $email, $transferee, $amount]
                                )
                            ) {
                                return 'Successful';
                            }
                        }
                    }
                }
            }
        } else {
            return false;
        }
    }

    public function Get_Discount_For_Product($product_id, $amount)
    {
        if (
            $this->data = parent::$db->run_select(
                'SELECT percentage_off FROM discount_tbl WHERE product_id = ? LIMIT 1',
                [$product_id]
            )
        ) {
            $payable_amount = ($this->data[0]->percentage_off / 100) * $amount;

            return ceil($payable_amount);
        }
    }

    public function Get_Single_User_Wallet_Balance($email)
    {
        if (
            $this->data = parent::$db->run_select(
                'SELECT * FROM wallet_tbl WHERE user_id = ? LIMIT 1',
                [$email]
            )
        ) {
            return $this->data[0];
        }
    }

    public function Get_All_Bank_Names()
    {
        if (
            $this->data = parent::$db->run_select(
                'SELECT * FROM bank_code_and_name WHERE status = 1'
            )
        ) {
            return $this->data;
        }
    }
    public function Get_Single_Bank_Info($bank_code)
    {
        if (
            $this->data = parent::$db->run_select(
                'SELECT * FROM bank_code_and_name WHERE bank_code = ? LIMIT 1',
                [$bank_code]
            )
        ) {
            return $this->data[0];
        }
    }

    public function Get_Request_Wallet_Money_Cash_Out($email, $role)
    {
        if (
            $this->data = parent::$db->run_select(
                "SELECT * FROM cash_out_tbl WHERE super_admin IN($role) OR email = ?",
                [$email]
            )
        ) {
            return $this->data;
        }
    }

    public function Verify_User_Cash_Out_Acc_No($ArrayForm, $API)
    {
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_URL =>
                'https://api.paystack.co/bank/resolve?account_number=' .
                $_POST['account_no'] .
                '&bank_code=' .
                $_POST['bank_code'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => [
                'Authorization: Bearer ' . $API,
                'Cache-Control: no-cache',
            ],
        ]);
        $response = curl_exec($curl);
        $err = curl_error($curl);
        curl_close($curl);
        if ($err) {
            echo 'cURL Error #:' . $err;
        } else {
            return json_decode($response);
        }
    }

    public function Generate_Cash_Out_Wallet_Transfer_Reciept($ArrayForm, $API)
    {
        $url = 'https://api.paystack.co/transferrecipient';
        $fields = [
            'type' => 'nuban',
            'name' => $_POST['account_name'],
            'account_number' => $_POST['account_no'],
            'bank_code' => trim($_POST['bank_code']),
            'currency' => 'NGN',
        ];
        $fields_string = http_build_query($fields);
        //open connection
        $ch = curl_init();

        //set the url, number of POST vars, POST data
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Authorization: Bearer ' . $API,
            'Cache-Control: no-cache',
        ]);

        //So that curl_exec returns the contents of the cURL; rather than echoing it
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        //execute post
        $result = curl_exec($ch);
        return json_decode($result);
    }

    public function Cash_Out_Wallet_Money_With_Transfer(
        $amount,
        $recipient_code,
        $API
    ) {
        $url = 'https://api.paystack.co/transfer';
        $fields = [
            'source' => 'balance',
            'amount' => intval($amount) * 100,
            'recipient' => $recipient_code,
            'reason' => 'UtiPlus Cash Out Wallet',
        ];
        $fields_string = http_build_query($fields);
        //open connection
        $ch = curl_init();

        //set the url, number of POST vars, POST data
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Authorization: Bearer ' . $API,
            'Cache-Control: no-cache',
        ]);

        //So that curl_exec returns the contents of the cURL; rather than echoing it
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        //execute post
        $result = curl_exec($ch);
        return json_decode($result);
    }

    public function Cash_Out_Wallet_Money_With_Finalize_Transfer(
        $ArrayForm,
        $recipient_code,
        $API
    ) {
        $url = 'https://api.paystack.co/transfer/finalize_transfer';
        $fields = [
            'transfer_code' => 'TRF_vsyqdmlzble3uii',
            'otp' => '928783',
        ];
        $fields_string = http_build_query($fields);
        //open connection
        $ch = curl_init();

        //set the url, number of POST vars, POST data
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Authorization: Bearer ' . $API,
            'Cache-Control: no-cache',
        ]);

        //So that curl_exec returns the contents of the cURL; rather than echoing it
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        //execute post
        $result = curl_exec($ch);
        return json_decode($result);
    }
}