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
use app\admin\model\CategoryWord as CategoryWordModel;
use think\Db;
class CategoryWord extends Coom{
    public function CateWordList(){
        $Category=db('category_word')
                    ->alias('cw')
                    ->field('cw.*,c.cate_name')
                    ->join('category c','cw.category_id=c.id','left')
                    ->order('cw.id asc')
                    ->paginate(15);
        $this->assign('Category',$Category);
        return view('CategoryWord/CateWordList');
    }

    public function CateWordAdd(){      
          if(request()->isPost()){
            $date=input('post.');
            if(stripos($date['link_url'],'http://')===false){
                $date['link_url']='http://'.$date['link_url'];//超链接后缀名
            }
            $res=db('category_word')->insert($date);
            if($res){
                $this->success('添加关联成功','CateWordList');
            }else{
                $this->error('添加关联失败');
            }
         }
        //获取栏目名称商品
        $Category=db('category')->field('id,cate_name,pid')->where('pid','=','0')->select();
        $this->assign('Category',$Category);
        return view('CategoryWord/CateWordAdd');

    }

    public  function CateWordEdit(){
        if(request()->isPost()){
            $date=input('post.');
             if(stripos($date['link_url'],'http://')===false){
                $date['link_url']='http://'.$date['link_url'];//超链接后缀名
            }
            $res=db('category_word')->update($date);
            if($res!==false){
                $this->success('修改关联成功','CateWordList');
            }else{
                $this->error('修改关联失败');
            }
        }
        $id=input('id');
        $Catecontent=db('category_word')->find($id);
         $Category=db('category')->field('id,cate_name,pid')->where('pid','=','0')->select();
        $this->assign([
            'Category'=>$Category,
            'Catecontent'=>$Catecontent,
        ]);
        return view('CategoryWord/CateWordEdit');
    }


    public  function CateWordDel(){
        $id=input('id');
        $res=db('category_word')->delete($id);
        if($res){
            $this->success('删除成功','CateWordList');
        }else{
            $this->error('删除是失败');
        }   
    }
}