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
class Cate extends Coom{
    public function CateList(){
        $cate=new Catetree();
        $date=db('cate')->select();
        $Cate=$cate->ChildTree($date);
        $this->assign('Cate',$Cate);
        return view('Cate/CateList');
    }

    public function CateAdd(){
        if(request()->isPost()){
            $data=input('post.');
            if($data['pid']==1){
                $this->error('系统栏目不允许添加子栏目');
            }
            $res=db('cate')->insert($data);
            if($res){
                $this->success('添加栏目成功','CateList');
            }else{
                $this->error('添加栏目失败');
            }
        }
        $cate=new Catetree();
        $date=db('cate')->select();
        $Cate=$cate->ChildTree($date);
        $this->assign('Cate',$Cate);
        return view('Cate/CateAdd');
    }

    public  function CateEdit(){
        if(request()->isPost()){
            $date=input('post.');
            if($date['pid']==$date['id']){
                $this->error('不允许成为自己的子栏目');
            }
            $res=db('cate')->update($date);
            if($res!==false){
                $this->success('修改栏目成功','CateList');
            }else{
                $this->error('栏目修改失败');
            }
        }
        $id=input('id');
        $Catecontent=db('cate')->find($id);
        $cate=new Catetree();
        $date=db('cate')->field('id,cate_name,pid')->select();
        $Cate=$cate->ChildTree($date);
        $this->assign([
            'Cate'=>$Cate,
            'Catecontent'=>$Catecontent,
        ]);
        return view('Cate/CateEdit');
    }


    public  function CateDel(){
        $id=input('id');
        $catetree=new Catetree();//实例化无限极分类方法
        $cateres=db('cate')->field('id,pid')->select();//根据id删除自己
        $cateres=$catetree->Parenttree($id,$cateres);//无限极分类（见上一篇）
        $cateres[]=$id;
        foreach($cateres as $value){
            //value是栏目
            $artres=db('article')->field('id,pid')->select();
               foreach($artres as $k=>$v){
                   //$v文章
                   if($value==$v['pid']){
                       //对文章里面的文件进行删除
                       $filename=db('article')->field('article_logo')->find($v['id']);
                       if(isset($filename)){
                           $img=$filename['article_logo'];
                           $file=PICTURE.$img;
                           @unlink($file);
                       }
                       //根据id删除文章
                       $delarticle=db('article')->delete($v['id']);
                       if(!$delarticle){
                           $this->error('删除文章异常');
                           die;
                       }
                   }
               }
            //删除栏目
            $res=db('cate')->where('id',$value)->delete();
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
        //$cateres=db('cate')->field('id,sort')->select();
        $obj=db('cate');
        $result = $obj->where(array('id' => $ids))->setField('sort',$sort);
        return $ids;

       // $res=$this->Sort($ids,$sort,$cateres);

    }


}