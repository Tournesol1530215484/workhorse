<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/29
 * Time: 8:50
 */
namespace app\admin\model;
use think\Model;
use think\Db;
class Category extends Model{
	  //处理热卖推荐
    public function Rec($id,$rec){
        //添加数据
        $resuolt='1';
        foreach ($rec as $key => $value) {
            if(trim($value)!=''){
                
                $result=db('goods_rec')->insert(['category_id'=>$id,'attr_id'=>$value]);
            }
        }
        return $resuolt;
    }

}