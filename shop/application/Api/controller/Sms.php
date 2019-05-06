<?php
namespace app\Api\controller;
use think\Controller;
use PHPMailer\PHPMailer;
use Submail\MESSAGEXsend;
class Sms extends Base
{
    public function SendSms($phone,$code){
        $submail = new MESSAGEXsend();
        $submail->SetTo($phone);
        $submail->SetProject('dozzl3');
        $submail->AddVar('code', $code);
        $submail->AddVar('time', 60);
        $xsend = $submail->xsend();
        if ($xsend['status'] !== 'success') {
            $this->return_msg(400, $xsend['msg']);
        }else{
            $this->return_msg(200, "短信已发送，请注意查收！");
        }
    }
}
