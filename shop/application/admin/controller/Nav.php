<?php
/**
 * @Author: Marte
 * @Date:   2018-10-24 20:53:12
 * @Last Modified by:   Marte
 * @Last Modified time: 2018-10-30 21:00:45
 */
namespace app\admin\controller;
class Nav extends Coom{

    public function NavList(){
        $Nav=db('nav')->field('nav_name,nav_url,nav_open,nav_scort,id')->order('nav_scort  asc')->select();
        $this->assign('Nav',$Nav);
        return view('NavList');
    }

    public function NavAdd(){
        if(request()->isPost()){
            $data=input("post.");
            //计算总条数，总条数加1
            $count=db('nav')->count('id');
            $data['nav_scort']=$count+1;
            $res=db('nav')->insert($data);
            if($res){
                $this->success('添加导航成功','NavList');
            }else{
                $this->error('添加导航失败');
            }
        }

        return view ('NavAdd');
    }

    public function NavEdit(){
        if(request()->isPost()){
            $data=input('post.');
            $res=db('nav')->update($data);
            if($res!==false){
                $this->success('修改导航成功','NavList');
            }else{
                $this->error('修改导航失败');
            }
        }
        $id=input('id');
        $Nav=db('nav')->find($id);
        $this->assign('Nav',$Nav);
        return view('NavEdit');
    }

    public function NavDel(){
        $id=input('id');
        //把所有小于sort的数据找出来
        $thesort=db('nav')->field('nav_scort')->where('id',$id)->find();
        $sortres=db('nav')->field('id,nav_scort')->where('nav_scort','>',$thesort['nav_scort'])->select();
        foreach($sortres as $key=>$value){
            db('nav')->where('id',$value['id'])->setField('nav_scort',$value['nav_scort']-1);
        }
        $res=db('nav')->delete($id);
        if($res){
            $this->success('删除导航成功','NavList');
        }else{
            $this->error('删除导航失败');
        }
    }


    //上移
    public function upsort(){
        $scort=input('pai');
        $mydate=db('nav')->where('nav_scort','=',$scort)->find();
        $id=$mydate['id'];
        //上一条数据
        $topone=$scort-1;
        $toponeres=db('nav')->where('nav_scort','=',$topone)->find();
        if($toponeres){
            //取出上一条数据的id和sort
            $toponeid=$toponeres['id'];
            $toponesort=$toponeres['nav_scort'];
            //进行更新
            db('nav')->where('id',$id)->setField('nav_scort',$toponesort);
            //把要更改的sort放到前面
            db('nav')->where('id',$toponeid)->setField('nav_scort',$scort);

        }else{
            echo "<script>alert('已经在底部了');</script>";

        }
        $this->redirect('NavList');     
    }

    //下移
    public function dmsort(){
        $scort=input('pai');
        $mydate=db('nav')->where('nav_scort','=',$scort)->find();
        $id=$mydate['id'];
        //下一条数据
        $topone=$scort+1;
        $toponeres=db('nav')->where('nav_scort','=',$topone)->find();
        if($toponeres){
            //取出上一条数据的id和sort
            $toponeid=$toponeres['id'];
            $toponesort=$toponeres['nav_scort'];
            //进行更新
            db('nav')->where('id',$id)->setField('nav_scort',$toponesort);
            //把要更改的sort放到前面
            db('nav')->where('id',$toponeid)->setField('nav_scort',$scort);

        }else{
            echo "<script>alert('已经在顶部了');</script>";

        }
        $this->redirect('NavList'); 
    }

    //置顶
     public function uploadsort(){
       $data=input('post.');
        $scort=$data['pai'];//要修改的sort
        $mydate=db('nav')->where('nav_scort','=',$scort)->find();
        $id=$mydate['id'];  //备用
        if($id==1){
            echo "<script>alert('已经在在最顶部了');</script>";
        }else{
            $mydate=db('nav')->where('nav_scort','=',1)->find();
            $firstid=$mydate['id'];
            $firstsort=$mydate['nav_scort'];
            //进行交换
            db('nav')->where('id',$id)->setField('nav_scort',$firstsort);
            //把要更改的sort放到前面
            db('nav')->where('id',$firstid)->setField('nav_scort',$scort);
        }
        $this->redirect('NavList');

    }
    //置位
     public function domnupsort(){
        $data=input('post.');
        $scort=$data['pai'];//要修改的sort
        $mydate=db('nav')->where('nav_scort','=',$scort)->find();
        $id=$mydate['id'];  //备用
        //计算出数据库所有的数据
        $count=db('nav')->count();
        if($scort==$count){
            echo "<script>alert('已经在在最底部了');</script>";
        }else{
            $mydate=db('nav')->where('nav_scort','=',$count)->find();
            $lastid=$mydate['id'];
            $lastsort=$mydate['nav_scort'];
            //进行交换
            db('nav')->where('id',$id)->setField('nav_scort',$lastsort);
            //把要更改的sort放到前面
            db('nav')->where('id',$lastid)->setField('nav_scort',$scort);
        }

        $this->redirect('NavList');
      
    }



}
