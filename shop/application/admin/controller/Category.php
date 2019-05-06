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
use app\admin\model\Category as CategoryModel;
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
            $rec_id=$date['rec_id'];
            if($_FILES['cate_img']['tmp_name']){
                $date['cate_img']=$this->upload();//图片上传
            }
            $Category=new CategoryModel;
            $res=$Category->allowField(true)->save($date);
            $id= $Category->id;//获取自增id
            $Category->Rec($id,$rec_id);
            if($res){
                $this->success('添加栏目成功','CateList');
            }else{
                $this->error('添加栏目失败');
            }
        }
        //获取热卖商品
        $Rec=db('recommend')->field('id,rec_name,rec_type')->where('rec_type',2)->select();
        $cate=new Catetree();
        $date=db('category')->select();
        $Category=$cate->ChildTree($date);
        $this->assign('Category',$Category);
        $this->assign('Rec',$Rec);
        return view('Category/CateAdd');

    }

    public  function CateEdit(){
        if(request()->isPost()){
            $date=input('post.');
            if($date['pid']==$date['id']){
                $this->error('不允许成为自己的子栏目');
            }
            //处理热搜栏目
            $attr_id=$date['attr_id'];
            //去good_rec把所有category_id=$id的值进行删除，把新值进行添加
            $res=db('goods_rec')->where('category_id',$date['id'])->delete();
            foreach ($attr_id as $key => $value) {
                db('goods_rec')->insert(['attr_id'=>$value,'category_id'=>$date['id']]);
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

            $CategoryModel=new CategoryModel;
            unset($date['attr_id']);
            $res=$CategoryModel->update($date);
            if($res!==false){
                $this->success('修改栏目成功','CateList');
            }else{
                $this->error('栏目修改失败');
            }
        }
        $id=input('id');
        $Catecontent=db('category')->find($id);
         //获取对应的热热搜
        $rec=db('goods_rec')->field('category_id,attr_id')->where('category_id',$id)->select();
        //重组数组
        $temp=array();
        foreach ($rec as $key => $value) {
            $temp[$value['category_id']][]=$value['attr_id'];
        }
        //把热搜属性组合到商品基本信息表去
        $Catecontent['rec']=$temp;
         //获取热卖商品
        $Rec=db('recommend')->field('id,rec_name,rec_type')->where('rec_type',2)->select();
        $cate=new Catetree();
        $date=db('category')->field('id,cate_name,pid')->select();
        $Category=$cate->ChildTree($date);
        $this->assign([
            'Category'=>$Category,
            'Catecontent'=>$Catecontent,
            'Rec'=>$Rec,
        ]);
        return view('Category/CateEdit');
    }


    public  function CateDel(){
        $id=input('id');
        //在删除所有的商品之前把该栏目下所有的商品进行删除
        $catetree=new Catetree();//实例化无限极分类方法
        $cateres=db('category')->field('id,pid')->select();//根据id删除自己
        $cateres=$catetree->Parenttree($id,$cateres);//无限极分类（见上一篇）
        $cateres[]=$id;
        foreach($cateres as $value){
            //删除所有的热卖商品
            db('goods_rec')->where('category_id',$value)->delete();
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