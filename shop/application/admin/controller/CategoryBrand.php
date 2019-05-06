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
class CategoryBrand extends Coom{
    public function CateBrandList(){
        $Cate= $Category=db('category_brands')
                    ->alias('cw')
                    ->field('cw.*,c.cate_name,GROUP_CONCAT(b.brand_name) brand_name')
                    ->join('category c','cw.category_id=c.id','left')
                    ->join('brand b','find_in_set(b.id,cw.brands_id)','left')
                    ->order('cw.id asc')
                    ->group('cw.id')
                    ->paginate(15);
        $this->assign('Cate',$Cate);
        return view('CategoryBrand/CategoryBList');
    }

    public function CateBrandBAdd(){
        if(request()->isPost()){
            $date=input('post.');
           if(stripos($date['pro_url'],'http://')===false){
                $date['pro_url']='http://'.$date['pro_url'];//超链接后缀名
            }
             if($_FILES['pro_img']['tmp_name']){
                $date['pro_img']=$this->upload();//图片上传
            }
             if(isset($date['brands_id'])){
                $date['brands_id']=implode(',', $date['brands_id']);
            }

            $res=db('category_brands')->insert($date);
            if($res){
                $this->success('添加栏目成功','CateBrandList');
            }else{
                $this->error('添加栏目失败');
            }
        }
        $Category=db('category')->field('id,cate_name,pid')->where('pid','=','0')->select();
        $Brandgory=db('brand')->field('id,brand_name,brand_url')->select();
        $this->assign([
          'Category'=>$Category,
          'Brandgory'=>$Brandgory
        ]);
        return view('CategoryBrand/CategoryBAdd');
    }

    public  function CateBrandEdit(){
        if(request()->isPost()){
            $date=input('post.');   
           if(stripos($date['pro_url'],'http://')===false){
                $date['pro_url']='http://'.$date['pro_url'];//超链接后缀名
            }
             if($_FILES['pro_img']['tmp_name']){
                $filename=db('category_brands')->field('pro_img')->find($date['id']);
                if(isset($filename)){
                    $img=$filename['pro_img'];
                    $file=PICTURE.$img;
                    @unlink($file);
                }
                $date['pro_img']=$this->upload();//图片重新上传
            }
            if(isset($date['brands_id'])){
                $date['brands_id']=implode(',', $date['brands_id']);
            }else{
                $date['brands_id']='';
            }
            $res=db('category_brands')->update($date);
            if($res!==false){
                $this->success('修改栏目成功','CateBrandList');
            }else{
                $this->error('栏目修改失败');
            }
        }
        $id=input('id');
        $Catecontent=db('category_brands')->find($id);
        $Category=db('category')->field('id,cate_name,pid')->where('pid','=','0')->select();
        $Brandgory=db('brand')->field('id,brand_name,brand_url')->select();
        $this->assign([
          'Category'=>$Category,
          'Brandgory'=>$Brandgory,
          'Catecontent'=>$Catecontent
        ]);
        return view('CategoryBrand/CategoryBEdit');
    }


    public  function CateBrandDel(){
        
         $id=input('id');
        $filename=db('category_brands')->field('pro_img')->find($id);
        if(isset($filename)){
            $img=$filename['pro_img'];
            $file=PICTURE.$img;
            @unlink($file);
        }
        $res=db('category_brands')->where('id',$id)->delete();
        if($res){
            $this->success('删除成功','CateBrandList');
        }else{
            $this->error('删除是失败');
        }
    }
        //文件上传
    public function upload(){
        $file = request()->file('pro_img');
        $info = $file->move(ROOT_PATH . 'public' .DS.'static'.DS.'uploads');
           if($info){
               return $info->getSaveName();
           }else{
               $file->getError();
               die;
           }
    }


}