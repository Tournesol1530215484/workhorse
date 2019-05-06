<?php
namespace app\Api\controller;
use think\Controller;
use PHPMailer\PHPMailer;
class Email extends Base
{
    //发送邮箱接口
    public function sende_email($email,$code){
        $toemail=$email;//定义收件人的邮箱
         $sendmail = '1530215484@qq.com'; //发件人邮箱
         $sendmailpswd = "zbdaikawctzeghfj"; //客户端授权密码,而不是邮箱的登录密码，就是手机发送短信之后弹出来的一长串的密码
         $send_name = '王彬';// 设置发件人信息，如邮件格式说明中的发件人，
         $to_name = '您';//设置收件人信息，如邮件格式说明中的收件人
         $mail = new PHPMailer();
         $mail->isSMTP();// 使用SMTP服务
         $mail->CharSet = "utf8";// 编码格式为utf8，不设置编码的话，中文会出现乱码
         $mail->Host = "SMTP.qq.com";// 发送方的SMTP服务器地址
         $mail->SMTPAuth = true;// 是否使用身份验证
         $mail->Username = $sendmail;//// 发送方的
         $mail->Password = $sendmailpswd;//客户端授权密码,而不是邮箱的登录密码！
         $mail->SMTPSecure = "ssl";// 使用ssl协议方式
         $mail->Port = 465;//  sina端口110或25） //qq  465 587
         $mail->setFrom($sendmail, $send_name);// 设置发件人信息，如邮件格式说明中的发件人，
         $mail->addAddress($toemail, $to_name);// 设置收件人信息，如邮件格式说明中的收件人，
         $mail->addReplyTo($sendmail, $send_name);// 设置回复人信息，指的是收件人收到邮件后，如果要回复，回复邮件将发送到的邮箱地址
         $mail->Subject = "这是一封来自王大佬的关怀！";// 邮件标题
         //$code=$code;
        // session("code",$code);
         //return $code."----".session("code");
         $mail->Body = "这是一个测试邮件，您的验证码是： $code 记得回复我哟！么么哒...";// 邮件正文
         //$mail->AltBody = "This is the plain text纯文本";// 这个是设置纯文本方式显示的正文内容，如果不支持Html方式，就会用到这个，基本无用
        if(!$mail->send()){
            $this->return_msg(400,$mail->ErrorInfo);
        }else{
            $this->return_msg(200, "验证码已发送至邮箱，请注意查收！");
        }
    }
}
