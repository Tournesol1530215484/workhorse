<?php
/**
 * Created by PhpStorm.
 * User: 王彬
 * Date: 2018/8/12
 * Time: 14:40
 */
namespace app\admin\controller;
use Catetree\Catetree;
use app\admin\controller\Article;
class Category extends Coom{
    public function CateList(){
        $cate=new Catetree();
        $date=db('category')->select();
        $Category=$cate->ChildTree($date);
        $this->assign('Category',$Category);
        return view('Category/CateList');
    }

    public function CateAdd(){
        if(request()->isPost()){
            $date=input('post.');
            if($_FILES['cate_img']['tmp_name']){
                $date['cate_img']=$this->upload();//图片上传
            }
            $res=db('category')->insert($date);
            if($res){
                $this->success('添加栏目成功','CateList');
            }else{
                $this->error('添加栏目失败');
            }
        }
        $cate=new Catetree();
        $date=db('category')->select();
        $Category=$cate->ChildTree($date);
        $this->assign('Category',$Category);
        return view('Category/CateAdd');
    }

    public  function CateEdit(){
        if(request()->isPost()){
            $date=input('post.');
            if($date['pid']==$date['id']){
                $this->error('不允许成为自己的子栏目');
            }
            if($_FILES['cate_img']['tmp_name']){
                $filename=db('category')->field('cate_img')->find($date['id']);
                if(isset($filename)){
                    $img=$filename['cate_img'];
                    $file=PICTURE.$img;
                    @unlink($file);
                }
                $date['cate_img']=$this->upload();//图片重新上传
            }
            $res=db('category')->update($date);
            if($res!==false){
                $this->success('修改栏目成功','CateList');
            }else{
                $this->error('栏目修改失败');
            }
        }
        $id=input('id');
        $Catecontent=db('category')->find($id);
        $cate=new Catetree();
        $date=db('category')->field('id,cate_name,pid')->select();
        $Category=$cate->ChildTree($date);
        $this->assign([
            'Category'=>$Category,
            'Catecontent'=>$Catecontent,
        ]);
        return view('Category/CateEdit');
    }


    public  function CateDel(){
        $id=input('id');
        //在删除所有的商品之前把该栏目下所有的商品进行删除
        $catetree=new Catetree();//实例化无限极分类方法
        $cateres=db('category')->field('id,pid')->select();//根据id删除自己

        die;
        $cateres=$catetree->Parenttree($id,$cateres);//无限极分类（见上一篇）
        $cateres[]=$id;
        foreach($cateres as $value){
            $res=db('category')->where('id',$value)->delete();
        }
        if($res){
            $this->success('删除成功','CateList');
        }else{
            $this->error('删除是失败');
        }
    }

    public function Catesort(){
        $ids=input('ids');
        $sort=input('sort');
        die;
    }

    //文件上传
    public function upload(){
        $file = request()->file('cate_img');
        $info = $file->move(ROOT_PATH . 'public' .DS.'static'.DS.'uploads');
        if($info){
            return $info->getSaveName();
        }else{
            $file->getError();
            die;
        }
    }



}