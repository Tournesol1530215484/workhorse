<?php
namespace app\member\controller;
use think\Controller;
use think\Db;
use app\member\controller\Account as AccountController;
use app\Api\controller\Email as SendEmail;
use app\Api\controller\Sms as SendSms;
use app\Common\controller\Common as CommonController;
class Account extends CommonController
{
  
   public function  _initialize()
    {

        parent::_initialize();
    }

    //判断用户名是否已经存在
    public function is_registered(){
        $data=input('post.');
        $res=model('Account')->is_exists($data['username']);
        if($res){
                return $res;
        }else{
            return true;
        }   
    }

    //验证手机号
    public function check_phone(){
        $data=input('post.');
        if($res=model('Account')->is_exists($data['mobile_phone'])){
            return $res;
            exit;
        }elseif ($res2=model('Account')->check_is_legitimate($data['mobile_phone'],'phone')) {
            return $res2;
            exit;
        }else{
            session('phone_num',$data['mobile_phone']);
            return true;
        }
       
    }

    // //验证邮箱
    public function check_email(){
        $data=input('post.');
        if($res=model('Account')->is_exists($data['email'])){
            return $res;
            exit;
        }elseif ($res2=model('Account')->check_is_legitimate($data['email'],'email')) {
            return $res2;
            exit;
        }else{
             session('email',$data['email']);
             return true;
        }
       
    }

    // // //发送短信
    public function SendSms(){
        $data=input('get.');
         //获取验证码
        $code=model('Account')->getcode(6);
        //对验证码进行保存
        session("code",$code);
         //验证码写入数据库
        $result=Db::table('sh_code_msg')->field('phone_num')->where('phone_num',$data['phone'])->find();
        $time=date('Y-m-d H-i-s');
        if($result!=null){
                //更新
               $res=Db::table('sh_code_msg')->where(['phone_num'=>$data['phone']])->update(['code'=>$code,'time'=>$time]);
        }else{
                //新增
                $res=Db::table('sh_code_msg')->insert(['phone_num'=>$data['phone'],'code'=>$code,'time'=>$time]);
        } 
        //发送验证码
        model('Account')->SendSms($data['phone'],$code);
    }

    // //发送邮件
    public function SendEmail(){
        $data=input('get.');
        //获取验证码
        $code=model('Account')->getcode(6);
        //对验证码进行保存
        session("code",$code);
        //验证码写入数据库
        $result=Db::table('sh_code_msg')->field('email')->where('email',$data['email'])->find();
        $time=date('Y-m-d H-i-s');
        if($result!=null){
                //更新
               $res=Db::table('sh_code_msg')->where(['email'=>$data['email']])->update(['code'=>$code,'time'=>$time]);
        }else{
                //新增
                $res=Db::table('sh_code_msg')->insert(['email'=>$data['email'],'code'=>$code,'time'=>$time]);
        } 
        //发送验证码
         model('Account')->sende_email($data['email'],$code);    
    }


    //验证短信验证码
    public function code_notice(){
         $data=input('post.');
         $code=Db::table('sh_code_msg')->field('code')->where(['phone_num'=>session('phone_num')])->find();
         if($data['mobile_code']!=$code){
            return('验证码不正确，清重新输入！');
         }else{
             return true;
        }
    }
     //验证邮箱验证码
    public function checkd_email_send_code(){
         $data=input('post.');
         $arr=Db::table('sh_code_msg')->field('code')->where(['email'=>session('email')])->find();
         if($data['send_code']!=$arr['code']){
            return('验证码不正确，清重新输入！');
         }else{
             return true;
        }
    }

    //修改密码
    public function get_password(){
        return view('get_password');
    }
    //注册
    public function reg()
    {
        if(request()->isPost()){
            $data=input('post.');
            $userData=array();
            $userData['username']=trim($data['username']);
            $userData['password']=md5($data['password']);
            $userData['email']=$data['email'];
            $userData['phone_num']=$data['mobile_phone'];
            $userData['register_type']=$data['register_type'];
            $userData['time']=time();
            $add=db('user')->insert($userData);
            if($add){
                // if($loginRes['error'] == 0){
                //     $this->success('注册成功！正在为您跳转...','member/User/index');
                // }
                //else{
                    $this->success('注册成功！正在为您跳转...','member/Account/login');
                //}
            }else{
                $this->error('注册失败！');
            }
        }
        return view('reg');
    }


    //登陆
    public function login($type=0)
    {
       if(request()->isPost()){
        $data=input('post.');
        if(isset($data['backAct'])){
            $backAct=$data['backAct'];
        }else{
            $backAct='';
        }
        return model('user')->login($data,$type,$backAct);
        }
        return view();
    }    

}
