<?php
/**
 * Created by PhpStorm.
 * User: 王彬
 * Date: 2018/8/8
 * Time: 21:32
 */
namespace app\admin\controller;
use think\Controller;

class Brand extends Coom{

    public function BrandList(){
        $Brand=db('brand')->paginate(5);
        $this->assign('Brand',$Brand);
        return view('BrandList');
    }

    public function BrandAdd(){
        if(request()->isPost()){
            $data=input('post.');
            if(stripos($data['brand_url'],'http://')===false){
                $data['brand_url']='http://'.$data['brand_url'];//超链接后缀名
            }
            if($_FILES['brand_img']['tmp_name']){
                $data['brand_img']=$this->upload();//图片上传
            }
            $res=db('brand')->insert($data);
            if($res){
                $this->success('添加品牌成功','BrandList');
            }else{
                $this->error('添加品牌失败');
            }

        }
        return view();
    }

    public function BrandEdit(){

        if(request()->isPost()){
            $data=input('post.');
            if($_FILES['brand_img']['tmp_name']){
                $filename=db('brand')->field('brand_img')->find($data['id']);
                if(isset($filename)){
                    $img=$filename['brand_img'];
                    $file=PICTURE.$img;
                    @unlink($file);
                }
                $data['brand_img']=$this->upload();//图片重新上传
            }
            $res=db('brand')->update($data);
            if($res!==false){
                $this->success('修改品牌列表成功','BrandList');
            }else{
                $this->error('修改品牌列表失败');
            }
        }
        $id=input('id');
        $Brand=db('brand')->find($id);
        $this->assign('Brand',$Brand);
        return view();
    }

    public function BrandDel(){
        $id=input('id');
        $filename=db('brand')->field('brand_img')->find($id);
        if(isset($filename)){
            $img=$filename['brand_img'];
            $file=PICTURE.$img;
            @unlink($file);
        }
        $res=db('brand')->delete($id);
        if($res){
            $this->success('删除商品分类成功','BrandList');
        }else{
            $this->error('删除商品分类失败');
        }

    }


    //文件上传
    public function upload(){
        $file = request()->file('brand_img');
        $info = $file->move(ROOT_PATH . 'public' .DS.'static'.DS.'uploads');
           if($info){
               return $info->getSaveName();
           }else{
               $file->getError();
               die;
           }
    }

}