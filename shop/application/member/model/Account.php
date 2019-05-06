<?php
namespace app\member\model;
use think\Model;
use PHPMailer\PHPMailer;
use Submail\MESSAGEXsend;
class Account extends Model
{

	// protected $return_msg = array('code'=>'0','result'=>'');
        //预定义函数
        public function __initialize(){
            parent::_initialize(); // TODO: Change the autogenerated stub
            $this->request=Request::instance();
        }

        //验证邮箱和手机号是不是合法
        /**
         * [check_is_legitimate description  判断手机号和邮箱是否是有效的]
         * @param  [String] $registered [传过来的类型]
         * @return [int]             [状态码]
         */
        public function check_is_legitimate($registered,$value){
             $code='';
            if($registered=='phone'){
                $code=preg_match("/^1[34578]\d{9}$/",$value)?0:1;
            }if($registered=='email'){
                $code=preg_match("/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/", $value)?2:4;
            }
            switch ($code) {
                case '1':
                    return("手机号码不正确，请重新输入！");
                    break;
                
                case '4':
                    return('邮件地址格式不正确，请重新输入！');
                    break;
            }
        }

        //判断这个值有没有注册
        /**
         * [is_exists  判断手机或者邮箱已经被注册]
         * @param  [String]  $registered [手机号或者邮箱号]
         * @return boolean             [200不存在，400已经存在]
         */
        public function is_exists($registered){
            //$type_num=$registered=='email'?2:4;
            $phone_exists=db('user')->where('phone_num',$registered)->find();
            $email_exists=db('user')->where('email',$registered)->find();
            $name_exists=db('user')->where('username',$registered)->find();
            //$temp=$type_num+$phone_exists+$email_exists;
           if($phone_exists){
                return('该手机已经被注册，直接登录！');
                
           }else if($email_exists){
                return('该邮箱已经被注册，请直接登录！');
              
           }else if($name_exists){
                return('该昵称已经被注册，请直接登录!');
            }

        }

        //获取验证码函数
        /**
         * [getcode 获取验证码]
         * @param  [int] $num [验证码位数]
         * @return [int]      [返回值]
         */
        public function getcode($num){
            $code='';
            $min=pow(10,($num-1));
            $max=pow(10,($num))-1;
            $code=rand($min,$max);
            return $code;
        }


       //发送邮箱接口
       /**
       */
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
            return ($mail->ErrorInfo);
        }else{
           return("验证码已发送至邮箱，请注意查收！");
        }
    }

    //发送短信
     public function SendSms($phone,$code){
        $submail = new MESSAGEXsend();
        $submail->SetTo($phone);
        $submail->SetProject('dozzl3');
        $submail->AddVar('code', $code);
        $submail->AddVar('time', 60);
        $xsend = $submail->xsend();
        if ($xsend['status'] !== 'success') {
            return ( $xsend['msg']);
        }else{
            return ("短信已发送，请注意查收！");
        }
    }
}
        
  
  