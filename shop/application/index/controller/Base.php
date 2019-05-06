<?php
namespace app\index\controller;

use think\Controller;
use app\index\model\Conf as ConfModel;
use app\index\model\Article as ArticleModel;
use app\Common\controller\Common as CommonController;
class Base extends CommonController{

    public function  _initialize()
    {
      
         parent::_initialize();
        $this->getShopConfArticle();  //获取店铺配置文章信息
        $this->getHotCate();          //左侧JS部分分类显示
        $this->getFirstCate();        //获取所有热门分类（显示隐藏那一块）的一,二级分类
        $this->getNav();              //导航显示
        $this->getTimeGoods();          //获取限时商品  
    }

    //导航显示
    private function getNav(){
        $TopNav=model('Common')->getTopNav();
        $this->assign('TopNav',$TopNav);

    }

  
    //获取店铺配置文章信息
    private function getShopConfArticle(){
      $Article=new ArticleModel;
      $shopInfo=$Article->shopinfo();
      $this->assign('shopInfo',$shopInfo);

    }

  
    //左侧JS部分分类显示
    private function getHotCate(){
      //获取所有的显示的二级栏目
      $HotCate=model('Common')->getHotCate();
      $this->assign([
          'HotCate'=>$HotCate,   
        ]);
      
    }
    //获取所有热门分类（显示隐藏那一块）的一,二级分类
    private function getFirstCate(){
      $FirstCate=model('Common')->getFirstCate();
      $this->assign([
          'FirstCate'=>$FirstCate,
      ]);
    }
    
    //获取热销商品
    private function getTimeGoods(){
        $getTimeGoods=model('Common')->getTimeGoods();
        $this->assign([
          'getTimeGoods'=>$getTimeGoods,
        ]);
       
    }  




      

  



    





}