<?php
/**
 * Created by PhpStorm.
 * User: 王彬
 * Date: 2018/8/8
 * Time: 21:32
 */
namespace app\admin\controller;
use think\Controller;
use think\Db;
use Catetree\Catetree;

class Article extends Coom{


    public function ArticleList(){

        $sql="select * from sh_article LEFT  JOIN
                 (SELECT MAX(id)AS cid ,cate_name FROM sh_cate GROUP  BY id)
              sh_cate  ON  sh_article.pid=sh_cate.cid ";
        $Article=Db::query($sql);
       // $groupby = Db::table('sh_cate')->field('Max(id) cid,cate_name')->group('id')->buildSql();

//        $groupby=Db::table('sh_cate')->field('id as ids,cate_name')->group('id')->buildSql();
//        dump($groupby);
//        die;
        //$Article=Db::table('sh_article')->alias('a')->join([$groupby=>'c'],'a.pid=c.id','left')->select();

        $this->assign('Article',$Article);
        return view('ArticleList');
    }




    public function ArticleAdd(){
        if(request()->isPost()){
            $data=input('post.');
            $data['article_time']=strtotime(date('Y-m-d H:i:d',time()));
            if(stripos($data['article_url'],'http://')===false){
                $data['article_url']='http://'.$data['article_url'];//超链接后缀名
            }
            if($_FILES['article_logo']['tmp_name']){
                $data['article_logo']=$this->upload();//图片上传
            }
            $res=db('article')->insert($data);
            if($res){
                $this->success('添加文章成功','ArticleList');
            }else{
                $this->error('添加文章失败');
            }

        }
        $cate=new Catetree();
        $date=db('cate')->field('id,cate_name,pid')->select();
        $Cate=$cate->ChildTree($date);
        $this->assign('Cate',$Cate);
        return view();
    }

    public function ArticleEdit(){

        if(request()->isPost()){
            $data=input('post.');
            if($_FILES['article_logo']['tmp_name']){
                $filename=db('article')->field('article_logo')->find($data['id']);
                if(isset($filename)){
                    $img=$filename['article_logo'];
                    $file=PICTURE.$img;
                    @unlink($file);
                }
                $data['article_logo']=$this->upload();//图片重新上传
            }
            $res=db('article')->update($data);
            if($res!==false){
                $this->success('修改文章成功','ArticleList');
            }else{
                $this->error('修改文章失败');
            }
        }
        $id=input('id');
        $Article=db('article')->find($id);


        $date=db('cate')->field('id,cate_name,pid')->select();
        $cate=new Catetree();
        $Cate=$cate->ChildTree($date);

        $this->assign('Cate',$Cate);
        $this->assign('Article',$Article);
        return view();
    }

    public function ArticleDel(){
        $id=input('id');
        $filename=db('article')->field('article_logo')->find($id);
        if(isset($filename)){
            $img=$filename['article_logo'];
            $file=PICTURE.$img;
            @unlink($file);
        }
        $res=db('article')->delete($id);
        if($res){
            $this->success('删除文章成功','ArticleList');
        }else{
            $this->error('删除文章失败');
        }

    }

    //文件上传
    public function upload(){
        $file = request()->file('article_logo');
        $info = $file->move(ROOT_PATH . 'public' .DS.'static'.DS.'uploads');
           if($info){
               return $info->getSaveName();
           }else{
               $file->getError();
               die;
           }
    }

}