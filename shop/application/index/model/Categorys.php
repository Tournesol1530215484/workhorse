<?php
 namespace app\index\model;
 use think\Model;
 use think\Db;
 class Categorys extends Model{

    //根据传过来的一级id，找出改id下所有的二级和三级栏目
    public function getTwoAndThreeCate($id){
       $CateTwo=Db::table('sh_category')->field('id,pid,cate_name,cate_img,sort,keywords,show_nav')->where(['pid'=>$id])->select();
        foreach ($CateTwo as $key => $value) {
             $Cate[$key]['childs']=Db::table('sh_category')->field('id,pid,cate_name,cate_img,sort,keywords,show_nav')->where(['pid'=>$value['id']])->select();
             $Cate[$key]['self']=$value;
        }
        return $Cate;
    }

    //根据传过来的一级id找出所有相关联的一二级关联字
    public function getCateWord($id){
    	$CateWord=Db::table('sh_category_word')->where(['category_id'=>$id])->select();
    	 return $CateWord;
        
    }

    //根据传过来的一级id获取所有相关联的品牌
    public function getCateBrands($id){
        $data=array();
        $brand=db('brand');
        $categoryBrands=db('categoryBrands')->where(array('category_id'=>$id))->find();
        $brandsIdArr=explode(',', $categoryBrands['brands_id']);
        foreach ($brandsIdArr as $k => $v) {
            $data['brands'][]=$brand->find($v);
        }
        //推广信息
        $data['promotion']['pro_img']=$categoryBrands['pro_img'];
        $data['promotion']['pro_url']=$categoryBrands['pro_url'];
        return $data;
    }

       


 }