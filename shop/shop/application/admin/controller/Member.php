<?php
/**
 * Created by PhpStorm.
 * User: 王彬
 * Date: 2018/8/25
 * Time: 19:37
 */
namespace app\admin\controller;
class Member extends Coom{
    public function MemberList(){
        $Member=db('member')->select();
        $this->assign('Member',$Member);
        return view('MemberList');
    }

    public function MemberAdd(){

        if(request()->isPost()){
            $data=input('post.');
            $res=db('member')->insert($data);
            if($res){
                $this->success('添加会员成功','MemberList');
            }else{
                $this->error('添加会员失败');
            }
        }
        return view('MemberAdd');


    }
}