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
class GoodsAttr extends Coom{
    public function AttrList(){
        $typeid=input('id');
        if($typeid){
            $map['type_id']=['=',$typeid];
        }else{
            $map=1;
        }
        $Attr=db('goodsattr')->alias('a')->field('a.*,t.type_name')->join('goodstype t','a.type_id=t.id')->where($map)->select();
        $this->assign('Attr',$Attr);
        return view('GoodsAttr/AttrList');
    }

    public function AttrAdd(){
        if(request()->isPost()){
            $data=input('post.');
            //把所有的中文逗号 变成英文
            $data['attr_values'] = preg_replace("/(\n)|(\s)|(\t)|(\')|(')|(，)|(\.)/",',',$data['attr_values']);
            $res=db('goodsattr')->insert($data);
            if($res){
                $this->success('添加属性成功','AttrList');
            }else{
                $this->error('添加属性失败');
            }
        }
        $type=db('goodstype')->field('id,type_name')->select();
        $Attr=db('goodsattr')->select();
        $this->assign([
            'Attr'=>$Attr,
            'type'=>$type,
        ]);
        return view('GoodsAttr/AttrAdd');
    }

    public  function AttrEdit(){
        if(request()->isPost()){
            $date=input('post.');
            //把所有的中文逗号 变成英文
            $date['attr_values'] = preg_replace("/(\n)|(\s)|(\t)|(\')|(')|(，)|(\.)/",',',$date['attr_values']);
            $res=db('goodsattr')->update($date);
            if($res!==false){
                $this->success('修改属性成功','AttrList');
            }else{
                $this->error('属性修改失败');
            }
        }
        $id=input('id');
        $type=db('goodstype')->field('id,type_name')->select();
        $Attr=db('goodsattr')->find($id);
        $this->assign([
            'Attr'=>$Attr,
            'type'=>$type,
        ]);
        return view('GoodsAttr/AttrEdit');
    }

    public  function AttrDel(){
        $id=input('id');
        $res=db('goodsattr')->delete($id);
        if($res){
            $this->success('删除成功','AttrList');
        }else{
            $this->error('删除是失败');
        }
    }

    public function Catesort(){
        $ids=input('ids');
        $sort=input('sort');
        //$cateres=db('cate')->field('id,sort')->select();
        $obj=db('cate');
        $result = $obj->where(array('id' => $ids))->setField('sort',$sort);
        return $ids;

       // $res=$this->Sort($ids,$sort,$cateres);

    }


}