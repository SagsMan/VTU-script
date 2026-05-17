<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
require '../../vendor/phpmailer/phpmailer/src/Exception.php';
require '../../vendor/phpmailer/phpmailer/src/PHPMailer.php';
require '../../vendor/phpmailer/phpmailer/src/SMTP.php';


$mail = new PHPMailer();
$mail->IsSMTP();
$mail->Mailer = "smtp";



$mail->SMTPDebug  = 1;  
$mail->SMTPAuth   = TRUE;
$mail->SMTPSecure = "ssl";
$mail->Port       = 465;
$mail->Host       = "mail.utiplus.com";
$mail->Username   = "no-reply@utiplus.com";
$mail->Password   = "$500@UtiplusNoreply";




$mail->IsHTML(true);
$mail->AddAddress("azzeetech.it@gmail.com", "recipient-name");
$mail->SetFrom("no-reply@utiplus.com", "from-name");
$mail->AddReplyTo("reply-to-email@gmail.com", "reply-to-name");
$mail->AddCC("cc-recipient-email@gmail.com", "cc-recipient-name");
$mail->Subject = "Test is Test Email sent via Gmail SMTP Server using PHP Mailer";
$content = "<b>This is a Test Email sent via Gmail SMTP Server using PHP mailer class.</b>";



$mail->MsgHTML($content); 
if(!$mail->Send()) {
  echo "Error while sending Email.";
  var_dump($mail);
} else {
  echo "Email sent successfully";
}