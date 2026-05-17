<?php
namespace EduTech\Controller;
use \PDO;
use EduTech\C_Base;
use EduTech\SessionHelper\Session;
use SimpleValidator\Validator;

class ActivityProductController extends C_base {

    private static $data_row;

public static function Get_All_Products(){
    if(self::$data_row = parent::$db->run_select("SELECT * FROM products_tbl WHERE status=1")){
        return self::$data_row;
   }
}



public static function Get_Single_Product_Info($p_id){
    if(self::$data_row = parent::$db->run_select("SELECT * FROM products_tbl  WHERE id = ? LIMIT 1",[$p_id])){
        return self::$data_row;
   }
}


public static function Get_Single_Product_Subscription($p_id){
    if(self::$data_row = parent::$db->run_select("SELECT * FROM subscription_tbl WHERE product_id =?",[$p_id])){
        return self::$data_row;
   }
}


public static function Get_Subscription_Single_data($sub_id){
    if(self::$data_row = parent::$db->run_select("SELECT * FROM subscription_tbl WHERE id =? LIMIT 1",[$sub_id])){
        return self::$data_row[0];
   }
}


public static function Verify_Exsting_Url($trans_id,$url){
    if(self::$data_row = parent::$db->run_select("SELECT * FROM registered_school_tbl WHERE school_id =? AND url = ? LIMIT 1",[$trans_id,$url])){
        return self::$data_row[0];
   }
}


public static function Store_Payment_Record($Trans_id,$amount,$pro_id,$user_email,$url){
if(self::$data_row = parent::$db->run_insert("INSERT INTO payment_history_tbl(trans_id,amount,product_id,email,url) VALUES(?,?,?,?,?)",[$Trans_id,$amount,$pro_id,$user_email,$url])){
  
        return true;
      
   }
}



public static function Check_If_User_Has_School_Management_DB($url_name){
$Check_url_file = "../school/inc/schools_db/".$url_name.".ini";
 if (file_exists($Check_url_file)) {
    return true;
  } 

}

public static function Check_If_School_Name_Exist($url_name){
if(self::$data_row = parent::$db->run_select("SELECT * FROM registered_school_tbl WHERE url = ?",[$url_name])){
    return self::$data_row[0];
  } 

}


public static function Check_If_User_Has_School_Name($url_name,$school_id){
if(self::$data_row = parent::$db->run_select("SELECT * FROM registered_school_tbl WHERE url = ? AND school_id=?",[$url_name,$school_id])){
    return self::$data_row[0];
  } 

}

public static function Select_Successful_Payment_TransID($trans_id){
 if(self::$data_row = parent::$db->run_select("SELECT * FROM payment_history_tbl WHERE status = 1 AND trans_id = ? LIMIT 1",[$trans_id])){
  if(self::$data_row[0]->status == 1){
        return self::$data_row[0];
      }else{
        return false;
      }
   }
}

public static function Update_Successful_Payment($status,$trans_id){
 if(parent::$db->run_insert("UPDATE payment_history_tbl SET status = 1, used='not-used', reason = ? WHERE status = 0 AND trans_id= ?",[$status,$trans_id])){
        return true;
   }
}
public static function Update_Payment_Used($trans_id){
 if($query = parent::$db->run_insert("UPDATE payment_history_tbl SET used='used' WHERE used = 'not-used' AND trans_id= ?",[$trans_id])){
  if ($query > 0) {
        return true;
      }
   }
}
public static function validate_failed_payment($trans_id,$reason){
 if(parent::$db->run_insert("UPDATE payment_history_tbl SET status = 2, reason = ? WHERE trans_id= ?",[$reason,$trans_id])){
        return true;
   }
}



public static function Insert_User_Ordered_Product($pro_id,$trans_id,$sub_id,$expired_date,$Payment_Email,$payment_url,$sub_figure){
  if(!self::Get_Existing_Product_Subscription($pro_id,$payment_url) ){
    if(parent::$db->run_insert("INSERT INTO user_product_order_tbl(product_id,trans_id,subscription_id,expired_date,email,url) VALUES(?,?,?,?,?,?)",[$pro_id,$trans_id,$sub_id,$expired_date,$Payment_Email,$payment_url])){
        return true;
   }
}else{
$row = self::Get_Existing_Product_Subscription($pro_id,$payment_url);

$new_date = date('d-m-Y', strtotime($row->expired_date. "+ $sub_figure months"));

if(self::Update_Existing_Product_Subscription($pro_id,$payment_url,$new_date)){
  return true;
}
}
}

public static function Get_Existing_Product_Subscription($pro_id,$payment_url){
    if(self::$data_row = parent::$db->run_select("SELECT * FROM user_product_order_tbl WHERE product_id = ? AND url = ? LIMIT 1",[$pro_id,$payment_url])){
      if(count(self::$data_row) > 0){
        return self::$data_row[0];
      }else{
        return false;
      }
   }
}


public static function Update_Existing_Product_Subscription($pro_id,$payment_url,$new_date){
    if(self::$data_row = parent::$db->run_insert("UPDATE user_product_order_tbl SET expired_date = ?  WHERE product_id = ? AND url = ? LIMIT 1",[$new_date,$pro_id,$payment_url])){
        return true;
      
   }
}
public static function Get_Single_Product_Paid_Info($payment_url,$pro_id){
    if(self::$data_row = parent::$db->run_select("SELECT * FROM user_product_order_tbl WHERE url = ? AND product_id =? LIMIT 1",[$payment_url,$pro_id])){
        if(count(self::$data_row) > 0){
          return self::$data_row[0];
          return true;
        }
   }
}


public static function New_User_School_Management_Products($url_name,$email){

  $Check_url_file = "../school/inc/schools_db/".$url_name.".ini";
  if (file_exists($Check_url_file)) {
    return false;
    }else{
    $ran_pin = rand(1111,9999);
    $create_new_school_db = fopen("../school/inc/schools_db/".$url_name.".ini", "w");

    $new_db_host = "localhost";
    $new_db_db = "truekyqm_sch_db_".$ran_pin;
    $new_db_user = "truekyqm_truedtech_sch_user";
    $new_db_pass = "Truedtech.IT654123";


    $new_db_school_host = "host=".$new_db_host."\n";
    $new_db_school_db = "database=".$new_db_db."\n";
    $new_db_school_user = "user=".$new_db_user."\n";
    $new_db_school_pass = "password=".$new_db_pass."\n";
    fwrite($create_new_school_db,$new_db_school_host);
    fwrite($create_new_school_db,$new_db_school_db);
    fwrite($create_new_school_db,$new_db_school_user);
    fwrite($create_new_school_db,$new_db_school_pass);
    fclose($create_new_school_db);

if(parent::$db->run_insert("INSERT INTO registered_school_tbl(url,email,school_id) VALUES(?,?,?)",[$url_name,$email,$ran_pin])){

return $new_db_db;
}
}
}


public static function Get_User_Products($email){
    if(self::$data_row = parent::$db->run_select("SELECT * FROM user_product_order_tbl WHERE email = ? LIMIT 1",[$email])){
        return self::$data_row;
   }
}





public static function Get_Single_School_Management_Feature_Info($id){
    if(self::$data_row = parent::$db->run_select("SELECT * FROM school_management_products_tbl WHERE id = ?",[$id])){
        return self::$data_row[0];
   }
}

public static function Get_Single_School_Management_Subs_Price($id){
    if(self::$data_row = parent::$db->run_select("SELECT * FROM school_management_subscription_tbl WHERE id = ? ",[$id])){
        return self::$data_row[0];
   }
}





}