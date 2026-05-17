<?php

namespace EduTech;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require_once "/home/eduowrav/rahausub.com.ng/easyfinder/vendor/autoload.php";

class EmailNotification
{
    public static function Send($email, $name, $subject, $body)
    {
        $mail = new PHPMailer(true); // Passing `true` enables exceptions
        try {
            $mail->SMTPDebug = 0; // Enable verbose debug output
            $mail->isSMTP(); // Set mailer to use SMTP
            $mail->Host = 'premium102.web-hosting.com'; // Specify main and backup SMTP servers
            $mail->SMTPAuth = true; // Enable SMTP authentication
            $mail->Username = 'contact@payboxed.com.ng'; // SMTP username
            $mail->Password = 'Payboxed.VTU1234'; // SMTP password
            $mail->SMTPSecure = 'ssl'; // Enable TLS encryption, `ssl` also accepted
            $mail->Port = 465; // TCP port to connect to

            //Recipients
            $mail->setFrom('contact@payboxed.com.ng', 'Payboxed');
            $mail->addAddress($email, $name); // Add a recipient            // Name is optional
            $mail->addReplyTo('contact@payboxed.com.ng', 'For More Enquires');

            $mail->isHTML(true); // Set email format to HTML
            $mail->Subject = $subject;
            $mail->Body = $body;

            if ($mail->Send()) {
                // echo 'Message has been sent';
            }
        } catch (Exception $e) {
            echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
        }
    }

    public static function Send_With_Attachment()
    {
        $mail = new PHPMailer(true); // Passing `true` enables exceptions
        try {
            $mail->SMTPDebug = 0; // Enable verbose debug output
            $mail->isSMTP(); // Set mailer to use SMTP
            $mail->Host = 'premium13.web-hosting.com'; // Specify main and backup SMTP servers
            $mail->SMTPAuth = true; // Enable SMTP authentication
            $mail->Username = 'orders@truedtech.com'; // SMTP username
            $mail->Password = 'Azzeetech.IT654123'; // SMTP password
            $mail->SMTPSecure = 'ssl'; // Enable TLS encryption, `ssl` also accepted
            $mail->Port = 465; // TCP port to connect to

            //Recipients
            $mail->setFrom('orders@truedtech.com', 'Mailer');
            $mail->addAddress('azzeetech.it@gmail.com', 'Joe User'); // Add a recipient
            //$mail->addAddress('azzeetech.it@gmail.com');               // Name is optional
            $mail->addReplyTo('orders@truedtech.com', 'Information');
            $mail->addCC('orders@truedtech.com');
            $mail->addBCC('orders@truedtech.com');

            //Attachments
            //$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
            //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

            //Content
            $mail->isHTML(true); // Set email format to HTML
            $mail->Subject = 'Here is the subject Class Testing';
            $mail->Body = '<b>This is the HTML message body in bold Test!</b>';
            $mail->AltBody =
                'This is the body in plain text for non-HTML mail clients';

            if ($mail->Send()) {
                echo 'Message has been sent';
            }
        } catch (Exception $e) {
            echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
        }
    }
}