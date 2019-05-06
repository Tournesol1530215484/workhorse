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
class Goodstype extends Coom{
    public function TypeList(){
        $Type=db('goodstype')->select();
        $this->assign('Type',$Type);
        return view('GoodsType/TypeList');
    }
    public function TypeAdd(){
        if(request()->isPost()){
            $data=input('post.');
            $res=db('goodstype')->insert($data);
            if($res){
                $this->success('添加分类成功','TypeList');
            }else{
                $this->error('添加分类失败');
            }
        }
        $Type=db('goodstype')->select();
        $this->assign('Type',$Type);
        return view('GoodsType/TypeAdd');
    }

    public  function TypeEdit(){
        if(request()->isPost()){
            $date=input('post.');
            $res=db('goodstype')->update($date);
            if($res!==false){
                $this->success('修改分类成功','TypeList');
            }else{
                $this->error('分类修改失败');
            }
        }
        $id=input('id');
        $Type=db('goodstype')->find($id);
        $this->assign('Type',$Type);
        return view('GoodsType/typeEdit');
    }

    public  function typeDel(){
        $id=input('id');
        //删除id之前删除该栏目下的所有属性
        $ids=db('goodsattr')->field('id,type_id')->where('type_id',$id)->select();
       foreach($ids as $key=>$value){
          db('goodsattr')->delete($value['id']);
       }
        $res=db('goodstype')->delete($id);
        if($res){
            $this->success('删除成功','typeList');
        }else{
            $this->error('删除是失败');
        }
    }



}