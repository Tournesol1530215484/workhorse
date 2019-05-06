<?php
namespace app\index\controller;
class Article extends Base{
    //  文章界面
    public function index($id){
        $CateRes=model('cate')->getAllCommon();//系统分类
        $ComCat=model('cate')->getAllCommArt();//普通分类
        $Article=db('article')->find($id);     //文章所有的信息
        $Catemom=db('cate')->field('id,pid,cate_name')->find($Article['pid']);
        $Allcate=model('cate')->getallCate($Article['pid']);//获取所有上级栏目
        $Allcate= array_reverse($Allcate);
        $this->assign([
            'ComCat'=>$ComCat,
            'CateRes'=>$CateRes,
            'Article'=>$Article,
            'Allcate'=>$Allcate,
            'Catemom'=>$Catemom
        ]);
        //显示id
        return view('Cate/article');
    }
}