<?php
namespace EduTech;
use EduTech\DB\Conn as Connection;
use \PDO;

/*
 *---------------------------------------------------------------
 * C_Base
 *---------------------------------------------------------------
 * This class holds all Usable methods like helper(), model() e.t.c
 *
 */
class C_Base extends Connection
{
    /* @var MyPDO */
    protected static $db;

    protected $data;

    public function __construct()
    {
        self::$db = Connection::instance();
    }

    public function SiteProperty()
    {
        $this->data = self::$db->run_select('SELECT * FROM edutech_settings');
        return $this->data;
    }

    public function insertUpdateProperty($property, $value){
        $check_exists = self::$db->run_select("SELECT `id` FROM edutech_settings WHERE setting_key = '{$property}'");

        if ($check_exists){
            $this->data = self::$db->run_update("UPDATE `edutech_settings` SET `setting_value` = ? WHERE `setting_key` = ?", [$value, $property]);
            return $this->data;
        }else{
            $this->data = self::$db->run_insert("INSERT INTO `edutech_settings`(`setting_key`, `setting_value`) VALUES (?,?)", [$property, $value]);
            return $this->data;
    }
   }

    public function GetSiteRepsonseStatus($errors = [], $success = [])
    {
        if (count($errors) > 0) {
            return '<div class="alert alert-danger" style="text-align:center; "><strong><ul><li>' .
                implode('</li><li>', $errors) .
                '</li></ul></strong> </div>';
        } elseif (count($success) > 0) {
            return '<p><div class="alert alert-success" style="text-align:center;"><strong><ul><li>' .
                implode('</li><li>', $success) .
                '</li></ul></strong> </div></p>';
        }
    }

    public function url_link($Login_Admin_role)
    {
        $this->data = self::$db->run_select(
            "SELECT * FROM url_link_tbl WHERE url_role IN($Login_Admin_role) AND status = 1 ORDER BY link_name"
        );
        return $this->data;
    }

    public function sub_url_link($url_id, $Login_Admin_role)
    {
        $this->data = self::$db->run_select(
            "SELECT * FROM sub_url_link_tbl WHERE (url_id =:url_id AND sub_url_role IN($Login_Admin_role)) AND status = 1  ORDER BY sub_link_name",
            [':url_id' => $url_id]
        );
        return $this->data;
    }

    public function check_admin_sub_url_accessbility(
        $Login_Admin_role,
        $URL_NAME
    ) {
        // Define query to insert values into the users table
        if (
            $this->data = self::$db->run_select(
                "SELECT * FROM sub_url_link_tbl WHERE sub_link =? AND sub_url_role IN($Login_Admin_role) AND status = 1",
                [$URL_NAME]
            )
        ) {
            return true;
        }
        // Prepare the statement
    }

    public function check_admin_url_accessbility($Login_Admin_role, $URL_NAME)
    {
        // Define query to insert values into the users table
        if (
            $this->data = self::$db->run_select(
                "SELECT * FROM url_link_tbl WHERE link =? AND url_role IN($Login_Admin_role) AND status = 1",
                [$URL_NAME]
            )
        ) {
            return true;
        }
    }

    public function humanTiming($time)
    {
        date_default_timezone_set('Africa/Lagos');

        $time = time() - $time; // to get the time since that moment
        $time = $time < 1 ? 1 : $time;
        $tokens = [
            31536000 => 'yr',
            2592000 => 'Mon',
            604800 => 'Wk',
            86400 => 'Day',
            3600 => 'Hr',
            60 => 'Min',
            1 => 'Sec',
        ];

        foreach ($tokens as $unit => $text) {
            if ($time < $unit) {
                continue;
            }
            $numberOfUnits = round($time / $unit);
            return $numberOfUnits .
                ' ' .
                $text .
                ($numberOfUnits > 1 ? 's' : '');
        }
    }

    public function Create_PayStack_Acc($API)
    {
        $url = 'https://api.paystack.co/subaccount';
        $fields = [
            'business_name' => 'Developer',
            'bank_code' => '033',
            'account_number' => '2112393049',
            'percentage_charge' => 0.2,
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
        echo $result;
    }

    public function Create_Payment_Acc($API)
    {
        $url = 'https://api.paystack.co/transaction/initialize';
        $fields = [
            'email' => 'customer@email.com',
            'amount' => '20000',
            'subaccount' => 'ACCT_cz4hikk6sa3djd4',
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
        echo $result;
    }

    public function Create_Payment_Acc_To_Collect_Charge($API)
    {
        $url = 'https://api.paystack.co/transaction/initialize';
        $fields = [
            'email' => 'customer@email.com',
            'amount' => '20000',
            'subaccount' => 'ACCT_cz4hikk6sa3djd4',
            'transaction_charge' => '10000',
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
        echo $result;
    }

    function Variable_Encrypt($plaintext)
    {
        $password = 'password_encrypt_my_data';
        $encrypted_string = openssl_encrypt(
            $plaintext,
            'AES-128-ECB',
            $password
        );
        //$decrypted_string=openssl_decrypt($encrypted_string,"AES-128-ECB",$password);

        return $encrypted_string;
    }

    public function Variable_Dencrypt($encrypted_text)
    {
        $password = 'password_encrypt_my_data';
        $decrypted_string = openssl_decrypt(
            $encrypted_text,
            'AES-128-ECB',
            $password
        );
        return $decrypted_string;
    }

    // Redirect user
    public function redirect($url)
    {
        header("Location: $url");
    }
}