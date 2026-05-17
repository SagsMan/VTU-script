<?php

namespace EduTech\Controller;

use \PDO;
use EduTech\C_Base;
use EduTech\SessionHelper\Session;
use SimpleValidator\Validator;

class AdminController extends C_base
{


  public function AddUrl($arrayForm)
  {

    if ($this->data = parent::$db->run_select("SELECT * FROM url_link_tbul WHERE link =?", [$_POST['link']])) {
      return false;
    } else {


      if (isset($_POST['has_sub'])) {
        $has_sub = 1;
      } else {
        $has_sub = 0;
        fopen($_POST['link'] . ".php", "w");
      }

      if ($this->data = parent::$db->run_insert("INSERT INTO url_link_tbl(link,link_name,has_sub,url_role,link_icon) VALUES(?,?,?,?,?)", [$_POST['link'], $_POST['link_name'], $has_sub, $_POST['url_role'], $_POST['link_icon']])) {
        return true;
      }
    }
  }



  public function SubAddUrl($arrayForm)
  {

    if ($this->data = parent::$db->run_select("SELECT * FROM sub_url_link_tbl WHERE sub_link = ?", [$_POST['sub_link']])) {
      return false;
    } else {

      fopen($_POST['sub_link'] . ".php", "w");

      if ($this->data = parent::$db->run_insert("INSERT INTO sub_url_link_tbl(sub_link,sub_link_name,url_id,sub_url_role,sub_link_icon) VALUES(?,?,?,?,?)", [$_POST['sub_link'], $_POST['sub_link_name'], $_POST['url_id'], $_POST['sub_url_role'], $_POST['sub_link_icon']])) {
        return true;
      }
    }
  }





  public function Add_Client($arrayForm, $imgfile)
  {

    if ($this->data = parent::$db->run_insert("INSERT INTO our_partner_tbl(partner_name,partner_img,partner_town,partner_state) VALUES(?,?,?,?)", [$_POST['c_name'], $imgfile, $_POST['c_town'], $_POST['c_state']])) {
      return true;
    }
  }




  public function Add_Team($arrayForm, $imgfile)
  {

    if ($this->data = parent::$db->run_insert("INSERT INTO our_team_tbl(name,post,img,note) VALUES(?,?,?,?)", [$_POST['t_name'], $_POST['t_post'], $imgfile, $_POST['t_note']])) {
      return true;
    }
  }





  public function Add_Faq($arrayForm)
  {

    if ($this->data = parent::$db->run_insert("INSERT INTO faq_tbl(faq,faq_title) VALUES(?,?)", [$_POST['faq_ques'], $_POST['faq_ans']])) {
      return true;
    }
  }







  public function Get_All_Url_Link()
  {
    $this->data = self::$db->run_select("SELECT * FROM url_link_tbl");
    return $this->data;
  }




  public function Disabled_Data($table, $id)
  {
    if ($this->data = self::$db->run_insert("UPDATE $table AS tbl_1, (SELECT id, (CASE WHEN(status = 1) 
    THEN 
    0 
    ELSE
    1
    END) AS status
   FROM $table WHERE id= ?) AS tbl_2 SET tbl_1.status = tbl_2.status WHERE tbl_1.id = tbl_2.id", [$id])) {
      return 1;
    }
  }



  public function Get_About_Us()
  {
    if ($this->data = self::$db->run_select("SELECT * FROM about_us_tbl")) {
      return $this->data[0];
    }
  }



  public function update_general_settings($key, $value)
  {
    if ($this->data = parent::$db->run_insert("UPDATE edutech_settings SET setting_value =:setting_value WHERE setting_key = :setting_key", [$value, $key])) {
      return true;
    }
  }

  public function update_general_settings_arr($data)
  {
    $caseClauses = [];
    $wherePlaceholders = [];
    $placeholders = [];

    foreach ($data as $key => $value) {
      // Add placeholders for CASE clauses
      $caseClauses[] = "WHEN setting_key = :case_key_$key THEN :case_value_$key";
      $placeholders["case_key_$key"] = $key;
      $placeholders["case_value_$key"] = $value;

      // Add placeholders for WHERE IN clause
      $wherePlaceholders[] = ":where_key_$key";
      $placeholders["where_key_$key"] = $key;
    }

    // Construct the query
    $query = "UPDATE edutech_settings SET setting_value = CASE "
      . implode(" ", $caseClauses)
      . " END WHERE setting_key IN (" . implode(", ", $wherePlaceholders) . ")";

    // Execute the query
    return parent::$db->run_insert($query, $placeholders);
  }



  public function Get_All_Payments($email, $role)
  {
    if ($this->data = self::$db->run_select("SELECT * FROM payment_history_tbl WHERE email = ? OR super_admin IN ($role)", [$email])) {
      return $this->data;
    }
  }


  public function Get_All_Successful_Payment($email, $role)
  {
    if ($this->data = self::$db->run_select("SELECT * FROM payment_history_tbl WHERE (email = ? OR super_admin IN ($role)) AND status = 1", [$email])) {
      return $this->data;
    }
  }

  public function Get_All_failed_Payment($email, $role)
  {
    if ($this->data = self::$db->run_select("SELECT * FROM payment_history_tbl WHERE (email = ? OR super_admin IN ($role)) AND status = 2", [$email])) {
      return $this->data;
    }
  }

  public function Get_All_pending_Payment($email, $role)
  {
    if ($this->data = self::$db->run_select("SELECT * FROM payment_history_tbl WHERE (email = ? OR super_admin IN ($role)) AND status = 0", [$email])) {
      return $this->data;
    }
  }





  public function Get_All_Users()
  {
    if ($this->data = self::$db->run_select("SELECT users_tbl.*, admin_role_tbl.role_name  FROM users_tbl LEFT JOIN admin_role_tbl ON users_tbl.admin_role = admin_role_tbl.role ORDER BY users_tbl.id DESC")) {
      return $this->data;
    }
  }

  public function Get_All_CAC_Requests()
  {
    $sql = "SELECT * FROM cac_registration_tbl ORDER BY date_submitted DESC";

    $results = self::$db->run_select($sql);

    if ($results === false) {
      error_log("SQL Error: " . self::$db->get_last_error()); // Adjust according to your DB class
      return []; // Return an empty array on error
    }

    return $results ?? []; // Ensure an empty array is returned if results are null
  }

  public function Get_All_CAC_Requests2()
  {
    $sql = "SELECT * FROM company_cac_registration_tbl ORDER BY date_submitted DESC";

    $results = self::$db->run_select($sql);

    if ($results === false) {
      error_log("SQL Error: " . self::$db->get_last_error()); // Adjust according to your DB class
      return []; // Return an empty array on error
    }

    return $results ?? []; // Ensure an empty array is returned if results are null
  }

  public function Get_All_NIN_V_Requests()
  {
    $sql = "SELECT * FROM nin_validation ORDER BY created_at DESC";

    $results = self::$db->run_select($sql);

    if ($results === false) {
      error_log("SQL Error: " . self::$db->get_last_error()); // Adjust according to your DB class
      return []; // Return an empty array on error
    }

    return $results ?? []; // Ensure an empty array is returned if results are null
  }

  public function Get_All_NIN_M_Requests()
  {
    $sql = "SELECT * FROM nin_modification ORDER BY created_at DESC";

    $results = self::$db->run_select($sql);

    if ($results === false) {
      error_log("SQL Error: " . self::$db->get_last_error()); // Adjust according to your DB class
      return []; // Return an empty array on error
    }

    return $results ?? []; // Ensure an empty array is returned if results are null
  }

  public function Get_All_NIN_Details(?string $email = null, ?string $id =null)
  {
    $sql = "SELECT * FROM nin_details";
    $params = [];

    if ($email) {
      $sql .= " WHERE user_email = :email";
      $params['email'] = $email;
    }
    if ($id) {
      $sql .= " AND id = :id";
      $params['id'] = $id;
    }
    $sql .= " ORDER BY created_at DESC";

    $results = self::$db->run_select($sql, $params);

    if ($results === false) {
      error_log("SQL Error: " . self::$db->get_last_error()); // Adjust according to your DB class
      return []; // Return an empty array on error
    }

    return $results ?? []; // Ensure an empty array is returned if results are null
  }

  public function Get_All_NIN_Personalizations(?string $email = null, ?string $id =null)
  {
    $sql = "SELECT * FROM nin_personalizations";
    $params = [];

    if ($email) {
      $sql .= " WHERE user_email = :email";
      $params['email'] = $email;
    }
    if ($id) {
      $sql .= " AND id = :id";
      $params['id'] = $id;
    }
    $sql .= " ORDER BY created_at DESC";

    $results = self::$db->run_select($sql, $params);

    if ($results === false) {
      error_log("SQL Error: " . self::$db->get_last_error()); // Adjust according to your DB class
      return []; // Return an empty array on error
    }

    return $results ?? []; // Ensure an empty array is returned if results are null
  }

  public function Get_All_NIN_Validations(?string $email = null, string $type ='nin')
  {
    $sql = "SELECT * FROM nin_validation";
    $params = [];

    if ($email) {
      $sql .= " WHERE user_email = :email";
      $params['email'] = $email;
    }
    if ($type) {
      $sql .= " AND type = :type";
      $params['type'] = $type;
    }
    $sql .= " ORDER BY created_at DESC";

    $results = self::$db->run_select($sql, $params);

    if ($results === false) {
      error_log("SQL Error: " . self::$db->get_last_error()); // Adjust according to your DB class
      return []; // Return an empty array on error
    }

    return $results ?? []; // Ensure an empty array is returned if results are null
  }


  public function Get_User_CAC_Request($userIdentifier)
  {
    // Assuming the $userIdentifier can be either an email or a username

    // SQL query to fetch all CAC requests for the given user
    $sql = "SELECT * FROM cac_registration_tbl WHERE email = ? ORDER BY date_submitted DESC";

    // Execute the query and return the results
    $results = self::$db->run_select($sql, [$userIdentifier]);

    return $results;
  }

  public function Get_User_CAC_Request2($userIdentifier)
  {
    // Assuming the $userIdentifier can be either an email or a username

    // SQL query to fetch all CAC requests for the given user
    $sql = "SELECT * FROM company_cac_registration_tbl WHERE email = ? ORDER BY date_submitted DESC";

    // Execute the query and return the results
    $results = self::$db->run_select($sql, [$userIdentifier]);

    return $results;
  }

  public function updateCACRequestStatus($requestId, $status, $cacDocPath = null)
  {
    // SQL query to update the status and document path if provided
    $sql = "UPDATE cac_registration_tbl SET status = ?, cac_doc = IFNULL(?, cac_doc) WHERE id = ?";
    return self::$db->run_insert($sql, [$status, $cacDocPath, $requestId]);
  }


  public function updateCACRequestStatus2($requestId, $status, $cacDocPath = null)
  {
    // SQL query to update the status and document path if provided
    $sql = "UPDATE company_cac_registration_tbl SET status = ?, cac_doc = IFNULL(?, cac_doc) WHERE id = ?";
    return self::$db->run_insert($sql, [$status, $cacDocPath, $requestId]);
  }

  public function updateNINValidationRequest($requestId, $status, $document = null)
  {
    // SQL query to update the status and document path if provided
    $sql = "UPDATE nin_validation SET status = ?, document = IFNULL(?, document) WHERE id = ?";
    return self::$db->run_insert($sql, [$status, $document, $requestId]);
  }

  public function updateNINPersonalizationRequest($requestId, $status, $document = null)
  {
    // SQL query to update the status and document path if provided
    $sql = "UPDATE nin_personalizations SET status = ?, document = IFNULL(?, document) WHERE id = ?";
    return self::$db->run_insert($sql, [$status, $document, $requestId]);
  }

  public function updateNINModificationRequest($requestId, $status, $document = null)
  {
    // SQL query to update the status and document path if provided
    $sql = "UPDATE nin_modification SET status = ?, document = IFNULL(?, document) WHERE id = ?";
    return self::$db->run_insert($sql, [$status, $document, $requestId]);
  }



  public function Get_User_Role()
  {
    if ($this->data = self::$db->run_select("SELECT * FROM admin_role_tbl ORDER BY id DESC")) {
      return $this->data;
    }
  }





  public function Get_User_Payment_History($email, $role)
  {
    if ($this->data = self::$db->run_select("SELECT * FROM transactions_tbl WHERE super_admin IN($role) OR email = ? ORDER BY id DESC ", [$email])) {
      return $this->data;
    } else {
      return false;
    }
  }

  public function Get_All_Trans_Status_Records($status, $email, $role)
  {
    if ($this->data = parent::$db->run_select("SELECT * FROM transactions_tbl WHERE status = ? AND (email = ? OR super_admin IN($role))", [$status, $email])) {
      return $this->data;
    }
  }

  public function Get_Our_Clients()
  {
    if ($this->data = self::$db->run_select("SELECT * FROM our_partner_tbl WHERE status=1")) {
      return $this->data;
    }
  }


  public function Get_Single_Our_Clients($id)
  {
    if ($this->data = self::$db->run_select("SELECT * FROM our_partner_tbl WHERE id=?", [$id])) {
      return $this->data;
    }
  }


  public function Get_Single_Subscription($id)
  {
    if ($this->data = self::$db->run_select("SELECT * FROM subscription_tbl WHERE id=?", [$id])) {
      return $this->data;
    }
  }


  public function Get_Our_Testimony()
  {
    if ($this->data = self::$db->run_select("SELECT * FROM testimony_tbl WHERE status =1")) {
      return $this->data;
    }
  }



  public function Get_Our_Faq()
  {
    if ($this->data = self::$db->run_select("SELECT * FROM faq_tbl WHERE status =1")) {
      return $this->data;
    }
  }


  public function Get_Our_Team()
  {
    if ($this->data = self::$db->run_select("SELECT * FROM our_team_tbl ")) {
      return $this->data;
    }
  }



  public function check_old_password($old_password, $email)
  {
    if ($this->data = self::$db->run_select("SELECT * FROM users_tbl WHERE email = ? LIMIT 1", [$email])) {
      if (password_verify($old_password, $this->data[0]->password)) {
        return true;
      } else {
        return false;
      }
    }
  }

  public function update_profile($arrayForm, $email)
  {
      $params = [
          'sname' => htmlspecialchars(trim($_POST['sname'] ?? '')),
          'oname' => htmlspecialchars(trim($_POST['oname'] ?? '')),
          'phone' => htmlspecialchars(trim($_POST['phone'] ?? '')),
          'school' => htmlspecialchars(trim($_POST['school'] ?? '')),
          'address' => htmlspecialchars(trim($_POST['address'] ?? '')),
          'state' => htmlspecialchars(trim($_POST['state'] ?? '')),
          'town' => htmlspecialchars(trim($_POST['town'] ?? '')),
      ];

      // Handle dynamic identity type update
      if (!empty($_POST['means_of_id_type']) && isset($_POST['means_of_id'])) {
          $means_of_id_type = htmlspecialchars(trim($_POST['means_of_id_type']));
          $identity = htmlspecialchars(trim($_POST['means_of_id']));

          $sql = "UPDATE users_tbl SET $means_of_id_type = :identity, 
                      sname = :sname, 
                      oname = :oname, 
                      phone = :phone, 
                      school = :school, 
                      address = :address, 
                      state = :state, 
                      town = :town, 
                      means_of_id_type = :means_of_id_type 
                  WHERE email = :email";

          $params['identity'] = $identity;
          $params['means_of_id_type'] = $means_of_id_type;
      } else {
          $sql = "UPDATE users_tbl SET 
                      sname = :sname, 
                      oname = :oname, 
                      phone = :phone, 
                      school = :school, 
                      address = :address, 
                      state = :state, 
                      town = :town, 
                  WHERE email = :email";
      }

      $params['email'] = $email;

      if (parent::$db->run_insert($sql, $params)) {
          return true;
      }
      return false;
  }


  public function submit_cac($data, $email)
  {
    $sname = htmlspecialchars(trim($data['proprietor_name']));
    $proprietor_phone = htmlspecialchars(trim($data['proprietor_phone']));
    $proprietor_email = htmlspecialchars(trim($data['proprietor_email']));
    $business_address = htmlspecialchars(trim($data['business_address']));
    $nature_of_business = htmlspecialchars(trim($data['nature_of_business']));
    $proposed_name_1 = htmlspecialchars(trim($data['proposed_name_1']));
    $proposed_name_2 = htmlspecialchars(trim($data['proposed_name_2']));
    $proprietor_address = htmlspecialchars(trim($data['proprietor_address']));
    $proprietor_passport = htmlspecialchars(trim($data['proprietor_passport']));
    $proprietor_signature = htmlspecialchars(trim($data['proprietor_signature']));
    $nin = htmlspecialchars(trim($data['nin']));

    $sql = "INSERT INTO cac_registration_tbl 
    (email, sname, proprietor_phone, proprietor_email, business_address, nature_of_business, proposed_name_1, proposed_name_2, proprietor_address, proprietor_passport, proprietor_signature, nin, date_submitted, status) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    if ($this->data = parent::$db->run_insert($sql, [
      $email,
      $sname,
      $proprietor_phone,
      $proprietor_email,
      $business_address,
      $nature_of_business,
      $proposed_name_1,
      $proposed_name_2,
      $proprietor_address,
      $proprietor_passport,
      $proprietor_signature,
      $nin,
      date('Y-m-d H:i:s'),
      1
    ])) {
      return true;
    }

    return false;
  }


  public function submit_cac2($data, $email, $paths)
  {
    // Company Details
    $classification = htmlspecialchars(trim($data['classification']));
    $nature_of_company = htmlspecialchars(trim($data['nature_of_company']));
    $company_address = htmlspecialchars(trim($data['company_address']));

    // Proposed Names
    $proposed_name_1 = htmlspecialchars(trim($data['proposed_name_1']));
    $proposed_name_2 = htmlspecialchars(trim($data['proposed_name_2']));

    // Proprietor One (I) Details
    $proprietor_1_name = htmlspecialchars(trim($data['proprietor_1_name']));
    $proprietor_1_address = htmlspecialchars(trim($data['proprietor_1_address']));
    $proprietor_1_phone = htmlspecialchars(trim($data['proprietor_1_phone']));
    $proprietor_1_email = htmlspecialchars(trim($data['proprietor_1_email']));
    $proprietor_1_passport = htmlspecialchars(trim($paths['proprietor_1_passport']));
    $proprietor_1_signature = htmlspecialchars(trim($paths['proprietor_1_signature']));
    $proprietor_1_nin = htmlspecialchars(trim($data['proprietor_1_nin']));

    // Proprietor Two (II) Details
    $proprietor_2_name = htmlspecialchars(trim($data['proprietor_2_name']));
    $proprietor_2_address = htmlspecialchars(trim($data['proprietor_2_address']));
    $proprietor_2_phone = htmlspecialchars(trim($data['proprietor_2_phone']));
    $proprietor_2_email = htmlspecialchars(trim($data['proprietor_2_email']));
    $proprietor_2_passport = htmlspecialchars(trim($paths['proprietor_2_passport']));
    $proprietor_2_signature = htmlspecialchars(trim($paths['proprietor_2_signature']));
    $proprietor_2_nin = htmlspecialchars(trim($data['proprietor_2_nin']));

    $sql = "INSERT INTO company_cac_registration_tbl 
    (email, classification, nature_of_company, company_address, proposed_name_1, proposed_name_2, 
    proprietor_1_name, proprietor_1_address, proprietor_1_phone, proprietor_1_email, proprietor_1_passport, proprietor_1_signature, proprietor_1_nin, 
    proprietor_2_name, proprietor_2_address, proprietor_2_phone, proprietor_2_email, proprietor_2_passport, proprietor_2_signature, proprietor_2_nin, 
    date_submitted, status) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    if ($this->data = parent::$db->run_insert($sql, [
      $email,
      $classification,
      $nature_of_company,
      $company_address,
      $proposed_name_1,
      $proposed_name_2,
      $proprietor_1_name,
      $proprietor_1_address,
      $proprietor_1_phone,
      $proprietor_1_email,
      $proprietor_1_passport,
      $proprietor_1_signature,
      $proprietor_1_nin,
      $proprietor_2_name,
      $proprietor_2_address,
      $proprietor_2_phone,
      $proprietor_2_email,
      $proprietor_2_passport,
      $proprietor_2_signature,
      $proprietor_2_nin,
      date('Y-m-d H:i:s'),
      1
    ])) {
      return true;
    }

    return false;
  }

  public function Get_Request_By_Id($id)
  {
    $sql = "SELECT * FROM cac_registration_tbl WHERE id = ?";
    return parent::$db->run_select($sql, [$id])[0] ?? null;
  }

  public function Get_Request_By_Id2($id)
  {
    $sql = "SELECT * FROM company_cac_registration_tbl WHERE id = ?";
    return parent::$db->run_select($sql, [$id])[0] ?? null;
  }


  public function Update_Request($requestId, $updateData)
  {
    // Prepare SQL query to update the record
    $sql = "UPDATE cac_registration_tbl SET 
                proposed_name_1 = :proposed_name_1,
                proposed_name_2 = :proposed_name_2,
                business_address = :business_address,
                nature_of_business = :nature_of_business,
                sname = :sname,
                proprietor_address = :proprietor_address,
                proprietor_phone = :proprietor_phone,
                proprietor_email = :proprietor_email,
                proprietor_passport = :proprietor_passport,
                proprietor_signature = :proprietor_signature,
                nin = :nin,
                date_submitted = :date_submitted
            WHERE id = :request_id";

    // Bind parameters and execute the query
    $params = [
      ':proposed_name_1' => $updateData['proposed_name_1'],
      ':proposed_name_2' => $updateData['proposed_name_2'],
      ':business_address' => $updateData['business_address'],
      ':nature_of_business' => $updateData['nature_of_business'],
      ':sname' => $updateData['proprietor_name'],
      ':proprietor_address' => $updateData['proprietor_address'],
      ':proprietor_phone' => $updateData['proprietor_phone'],
      ':proprietor_email' => $updateData['proprietor_email'],
      ':proprietor_passport' => $updateData['proprietor_passport'],
      ':proprietor_signature' => $updateData['proprietor_signature'],
      ':nin' => $updateData['nin'],
      ':date_submitted' => date('Y-m-d H:i:s'),
      ':request_id' => $requestId
    ];

    if ($this->data = parent::$db->run_insert($sql, $params)) {
      return true;
    }

    return false;
  }


  public function Update_Request2($requestId, $updateData)
  {
    // Prepare SQL query to update the record
    $sql = "UPDATE cac_registration_tbl SET 
                proposed_name_1 = :proposed_name_1,
                proposed_name_2 = :proposed_name_2,
                classification = :classification,
                nature_of_company = :nature_of_company,
                company_address = :company_address,
                proprietor_1_name = :proprietor_1_name,
                proprietor_1_address = :proprietor_1_address,
                proprietor_1_phone = :proprietor_1_phone,
                proprietor_1_email = :proprietor_1_email,
                proprietor_1_passport = :proprietor_1_passport,
                proprietor_1_signature = :proprietor_1_signature,
                proprietor_1_nin = :proprietor_1_nin,
                proprietor_2_name = :proprietor_2_name,
                proprietor_2_address = :proprietor_2_address,
                proprietor_2_phone = :proprietor_2_phone,
                proprietor_2_email = :proprietor_2_email,
                proprietor_2_passport = :proprietor_2_passport,
                proprietor_2_signature = :proprietor_2_signature,
                proprietor_2_nin = :proprietor_2_nin,
                date_submitted = :date_submitted
            WHERE id = :request_id";

    // Bind parameters and execute the query
    $params = [
      ':proposed_name_1' => $updateData['proposed_name_1'],
      ':proposed_name_2' => $updateData['proposed_name_2'],
      ':classification' => $updateData['classification'],
      ':nature_of_company' => $updateData['nature_of_company'],
      ':company_address' => $updateData['company_address'],
      ':proprietor_1_name' => $updateData['proprietor_1_name'],
      ':proprietor_1_address' => $updateData['proprietor_1_address'],
      ':proprietor_1_phone' => $updateData['proprietor_1_phone'],
      ':proprietor_1_email' => $updateData['proprietor_1_email'],
      ':proprietor_1_passport' => $paths['proprietor_1_passport'],
      ':proprietor_1_signature' => $paths['proprietor_1_signature'],
      ':proprietor_1_nin' => $updateData['proprietor_1_nin'],
      ':proprietor_2_name' => $updateData['proprietor_2_name'],
      ':proprietor_2_address' => $updateData['proprietor_2_address'],
      ':proprietor_2_phone' => $updateData['proprietor_2_phone'],
      ':proprietor_2_email' => $updateData['proprietor_2_email'],
      ':proprietor_2_passport' => $paths['proprietor_2_passport'],
      ':proprietor_2_signature' => $paths['proprietor_2_signature'],
      ':proprietor_2_nin' => $updateData['proprietor_2_nin'],
      ':date_submitted' => date('Y-m-d H:i:s'),
      ':request_id' => $requestId
    ];

    // Execute the query
    if ($this->data = parent::$db->run_insert($sql, $params)) {
      return true;
    }

    return false;
  }




  public function change_password($password, $email)
  {
    $password = password_hash(trim($password), PASSWORD_DEFAULT);
    if ($this->data = parent::$db->run_insert("UPDATE users_tbl SET password = ? WHERE email =?", [$password, $email])) {
      return true;
    }
  }


  public function change_pass_pin($pin, $email)
  {
    if ($this->data = parent::$db->run_insert("UPDATE users_tbl SET pin = ? WHERE email =?", [md5($pin), $email])) {
      return true;
    }
  }




  public function update_edit_school($url, $id)
  {
    if ($this->data = parent::$db->run_select("SELECT url FROM registered_school_tbl WHERE id =?", [$id])) {
      $old_url = $this->data[0]->url;

      if ($this->data = parent::$db->run_insert("UPDATE registered_school_tbl SET url = ? WHERE id =?", [$url, $id])) {
        // Old Name Of The file
        $old_name = "../school/inc/schools_db/$old_url.ini";
        // New Name For The File
        $new_name = "../school/inc/schools_db/$url.ini";
        // Checking If File Already Exists
        if (file_exists($new_name)) {
          return "Error While Renaming Url";
        } else {
          if (rename($old_name, $new_name)) {
            return 1;
          } else {
            return "The url name is not available";
          }
        }
      }
    } else {
      return "Error While Renaming Url";
    }
  }



  public function update_edit_partiner($arrayForm)
  {
    if ($this->data = parent::$db->run_insert("UPDATE users_tbl SET school = ?, address  = ?, state  = ?,town = ?, means_of_id =?,admin_role =? WHERE id =?", [htmlspecialchars($_POST['company_name']), htmlspecialchars($_POST['address']), htmlspecialchars($_POST['state']), htmlspecialchars($_POST['town']), htmlspecialchars($_POST['means_of_id']), htmlspecialchars($_POST['role']), $_POST['id']])) {
      return 1;
    } else {
      echo "Something went wrong whlie updating";
    }
  }

  public function update_edit_subcription($arrayForm)
  {
    if ($this->data = parent::$db->run_insert("UPDATE subscription_tbl SET subscription_name = ?, subscription_price = ?,  month_figure  = ?, product_id = ? WHERE id =?", [$_POST['sub_name'], $_POST['sub_price'], $_POST['sub_fiqure'], $_POST['sub_product'], $_POST['id']])) {
      return 1;
    } else {
      echo "Something went wrong whlie updating";
    }
  }

  public function update_edit_team($arrayForm)
  {
    if ($this->data = parent::$db->run_insert("UPDATE our_team_tbl SET name = ?, post = ? WHERE id =?", [$_POST['t_name'], $_POST['t_post'], $_POST['id']])) {
      return 1;
    } else {
      echo "Something went wrong whlie updating";
    }
  }

  public function update_edit_testimony($arrayForm)
  {
    if ($this->data = parent::$db->run_insert("UPDATE testimony_tbl SET name = ?, comment = ?, rank= ? WHERE id =?", [$_POST['name'], $_POST['comment'], $_POST['rank'], $_POST['id']])) {
      return 1;
    } else {
      echo "Something went wrong whlie updating";
    }
  }



  public function update_edit_dsms_product($arrayForm)
  {
    if ($this->data = parent::$db->run_insert("UPDATE products_tbl SET product_name =?,product_detail=?, demo_link = ? WHERE id = ?", [$_POST['pname'], $_POST['pdetail'], $_POST['plink'], $_POST['id']])) {
      return 1;
    } else {
      echo "Something went wrong whlie updating";
    }
  }



  public function SubscriptionExpiredNotification($email)
  {

    if ($this->data = parent::$db->run_select("SELECT user_product_order_tbl.*,subscription_tbl.subscription_name,products_tbl.product_name, products_tbl.id as pro_id FROM user_product_order_tbl
            LEFT JOIN subscription_tbl ON subscription_tbl.id = user_product_order_tbl.subscription_id
             LEFT JOIN products_tbl ON products_tbl.id = user_product_order_tbl.product_id WHERE user_product_order_tbl.email = ? AND user_product_order_tbl.expired_date <= DATE_ADD(DATE(now()), INTERVAL 8 DAY)", [$email])) {
      return $this->data;
    } else {
      echo "no data found";
    }
  }

  public function GetDataPlans()
  {
    if (
      $this->data = parent::$db->run_select(
        'SELECT t1.*, t2.data_type, t2.title, t3.api_name as provider FROM plans as t1 
                JOIN plan_types as t2 ON t1.plan_type_id = t2.id
                JOIN api_settings as t3 ON t1.api_id = t3.id'
      )
    ) {
      return $this->data;
    }

    return [];
  }

  public function DeleteDataPlan($id)
  {
    $sql = "DELETE FROM plans WHERE id = ?";
    return self::$db->run_insert($sql, [$id]);
  }

  public function DeleteDataPlanType($id)
  {
    $sql = "DELETE FROM plan_types WHERE id = ?";
    return self::$db->run_insert($sql, [$id]);
  }

  public function Get_Plan_Types()
  {
    $sql = "SELECT * FROM plan_types";
    return parent::$db->run_select($sql);
  }

  public function Get_API_Settings()
  {
    $sql = "SELECT * FROM api_settings";
    return parent::$db->run_select($sql);
  }

  public function Add_Plan($arrayForm)
  {
    if ($this->data = parent::$db->run_insert(
      "INSERT INTO plans(plan_id,api_id,plan,validity,price,network_id,plan_type_id) VALUES(?,?,?,?,?,?,?)",
      [$_POST['plan_id'], $_POST['api_id'], $_POST['plan'], $_POST['validity'], $_POST['price'], $_POST['network_id'], $_POST['plan_type_id']]
    )) {
      return true;
    }
  }

  public function Add_Plan_Type($arrayForm)
  {
    if ($this->data = parent::$db->run_insert(
      "INSERT INTO plan_types(data_type,network_id,title) VALUES(?,?,?)",
      [$_POST['data_type'], $_POST['network_id'], $_POST['title']]
    )) {
      return true;
    }
  }

  public function update_plan($arrayForm)
  {
    if ($this->data = parent::$db->run_insert(
      "UPDATE plans SET plan_id =?,api_id=?, plan = ?, validity =?,price=?,api=?,reseller=?,topuser=?, network_id = ?, plan_type_id = ? WHERE id = ?",
      [$_POST['plan_id'], $_POST['api_id'], $_POST['plan'], $_POST['validity'], $_POST['price'], $_POST['api'], $_POST['reseller'], $_POST['topuser'], $_POST['network_id'], $_POST['plan_type_id'], $_POST['id']]
    )) {
      return 1;
    } else {
      return 0;
    }
  }

  public function update_plan_type($arrayForm)
  {
    if ($this->data = parent::$db->run_insert(
      "UPDATE plan_types SET data_type =?, title = ? WHERE id = ?",
      [$_POST['data_type'], $_POST['title'], $_POST['id']]
    )) {
      return 1;
    } else {
      return 0;
    }
  }
  public function update_provider($arrayForm)
  {
    $provider_id = $arrayForm['provider_id'] ?? null;

    if (!$provider_id) return 0;

    // Reset all providers to inactive
    parent::$db->run_insert("UPDATE api_settings SET is_active = ?", [0]);

    if ($this->data = parent::$db->run_insert(
      "UPDATE api_settings SET is_active =? WHERE id = ?",
      [1, $provider_id]
    )) {
      return 1;
    }

    return 0;
  }
}
