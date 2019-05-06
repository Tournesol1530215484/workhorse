<?php
 namespace app\Common\model;
use Catetree\Catetree;
use think\Db;
 class Common {
//    获取所有系统栏目下的帮助分类及其子栏目---------底部显示
    public function getAllArticle(){
        $art=db('article');
        $Cate=db('cate')->where(['cate_type'=>2,'pid'=>2])->select();
        foreach($Cate as $key => $value){
            $Cate[$key]['art']=$art->where(['pid'=>$value['id']])->select();
        }
        return $Cate;
    }
 }