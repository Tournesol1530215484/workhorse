<?php
 namespace app\index\model;
use Catetree\Catetree;
 class Cate {
//    获取所有系统栏目下的帮助分类及其子栏目
     public function getAllCommon(){
         $art=db('article');
         $Cate=db('cate')->where(['cate_type'=>2,'pid'=>2])->select();
         foreach($Cate as $key => $value){
             $Cate[$key]['art']=$art->where(['pid'=>$value['id']])->select();
         }
         return $Cate;
     }

//    获取所有普通栏目下的子栏目
     public function getAllCommArt(){
        $art=db('cate');
         $Cate=db('cate')->where(['cate_type'=>5,'pid'=>5])->select();
         foreach($Cate as $key => $value){
             $Cate[$key]['childs']=$art->where(['pid'=>$value['id']])->select();
         }
        return $Cate;
     }


    //获取改文章的所有父级栏目
    public function  getallCate($cateid){
        $cateres=db('cate')->select();
        return  $this->_getAllCate($cateid,$cateres);
    }

    private  function _getAllCate($id,$data){
        $cateid=db('cate')->field('id,pid,cate_name')->find($id);
        static $temp=array();
        if(empty($temp)){
            $temp[]=$cateid;
        }
        foreach($data as $key =>$value){
            if($value['id']==$cateid['pid']){
                $temp[]=$value;
                $this->_getAllCate($value['id'],$data);
            }
        }
        return $temp;

    }


 }