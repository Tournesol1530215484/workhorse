<?php
 namespace app\index\model;
 use think\Model;
  class Article extends Model{
 		 //获取所有的店铺信息
    public function shopinfo(){
        //获取所有pid为4的文章的信息
        $ShopInfo=db('article')->where('pid',4)->field('id,pid,article_title,article_keywords')->select();
        return $ShopInfo;
    }

 }