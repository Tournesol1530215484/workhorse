<?php
/**
 * Created by PhpStorm.
 * User: 王彬
 * Date: 2018/8/8
 * Time: 21:32
 */
namespace app\admin\controller;
use think\Controller;

class Link extends Coom{

    public function LinkList(){
        $Link=db('link')->paginate(5);
        $this->assign('Link',$Link);
        return view('LinkList');
    }

    public function LinkAdd(){
        if(request()->isPost()){
            $data=input('post.');
            if(stripos($data['link_url'],'http://')===false){
                $data['link_url']='http://'.$data['link_url'];//超链接后缀名
            }
            if($_FILES['link_logo']['tmp_name']){
                $data['link_logo']=$this->upload();//图片上传
            }
            $res=db('link')->insert($data);
            if($res){
                $this->success('添加链接成功','LinkList');
            }else{
                $this->error('添加链接失败');
            }

        }
        return view();
    }

    public function LinkEdit(){

        if(request()->isPost()){
            $data=input('post.');
            if($_FILES['link_logo']['tmp_name']){
                $filename=db('link')->field('link_logo')->find($data['id']);
                if(isset($filename)){
                    $img=$filename['link_logo'];
                    $file=PICTURE.$img;
                    @unlink($file);
                }
                $data['link_logo']=$this->upload();//图片重新上传
            }
            $res=db('link')->update($data);
            if($res!==false){
                $this->success('修改链接成功','LinkList');
            }else{
                $this->error('修改链接失败');
            }
        }
        $id=input('id');
        $Link=db('link')->find($id);
        $this->assign('Link',$Link);
        return view();
    }

    public function LinkDel(){
        $id=input('id');
        $filename=db('link')->field('link_logo')->find($id);
        if(isset($filename)){
            $img=$filename['link_logo'];
            $file=PICTURE.$img;
            @unlink($file);
        }
        $res=db('link')->delete($id);
        if($res){
            $this->success('删除链接成功','LinkList');
        }else{
            $this->error('删除链接失败');
        }

    }


    //文件上传
    public function upload(){
        $file = request()->file('link_logo');
        $info = $file->move(ROOT_PATH . 'public' .DS.'static'.DS.'uploads');
           if($info){
               return $info->getSaveName();
           }else{
               $file->getError();
               die;
           }
    }

}