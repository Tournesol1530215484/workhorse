<?php
namespace app\Common\controller;

use think\Controller;
use app\Common\model\Conf as ConfModel;
use app\Common\model\Article as ArticleModel;
class Common extends Controller{

    public function  _initialize()
    {
        $this->getArticle();          //获取所有帮助分类模块下的文章---------底部黑色字体
        $this->getConf();             //获取所有的配置项信息
    }

        //获取所有的配置项信息
    private function getConf(){
        $ConfModel=new ConfModel;
        $AllConf=$ConfModel->GetConf();
      $this->assign('AllConf',$AllConf);
    }

       //获取所有帮助分类模块下的文章---------底部黑色字体
    private function getArticle(){
        $CateRes=model('Common')->getAllArticle();
        $this->assign('CateRes',$CateRes);
    }

    
}