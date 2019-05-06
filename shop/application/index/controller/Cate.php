<?php
namespace app\index\controller;
use Catetree\Catetree;
class Cate extends Base{
//    栏目界面
    public function index($id){
        //获取该栏目下的所有子栏目
        $Catree=new Catetree();
        $cateres=db('cate')->field('id,pid,cate_name')->select();
        $ids=$Catree->Parenttree($id,$cateres);
        $ids[]=$id;
        $request['pid']=array('IN',$ids);
        $Article=db('article')->where($request)->select();
        //获取当前栏目的信息
        $Cucate=db('cate')->find($id);
        $CateRes=model('cate')->getAllCommon();//系统分类
        $ComCat=model('cate')->getAllCommArt();//普通分类
        $this->assign([
            'CateRes'=>$CateRes,
            'ComCat'=>$ComCat,
            'Article'=>$Article,
            'Cucate'=>$Cucate
        ]);
        return view('category');
    }







}