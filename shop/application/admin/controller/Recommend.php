<?php
namespace app\admin\controller;
class Recommend extends Coom{
  public function RecList(){
     $recommend=db('recommend')->order('id asc')->paginate(5);
        $this->assign('recommend',$recommend);
        return view('RecList');
  }

  public function RecAdd(){
        if(request()->isPost()){
            $data=input('post.');
            $res=db('recommend')->insert($data);
            if($res){
                $this->success('添加推荐位成功','RecList');
            }else{
                $this->error('添加推荐位失败');
            }

        }
        return view();
    }

    public function RecEdit(){

        if(request()->isPost()){
            $data=input('post.');
            $res=db('recommend')->update($data);
            if($res!==false){
                $this->success('修改推荐位成功','RecList');
            }else{
                $this->error('修改推荐位失败');
            }
        }
        $id=input('id');
        $recommend=db('recommend')->find($id);
        $this->assign('recommend',$recommend);
        return view();
    }

    public function RecDel(){
        $id=input('id');
        $res=db('recommend')->delete($id);
        if($res){
            $this->success('删除推荐位成功','RecList');
        }else{
            $this->error('删除推荐位失败');
        }

    }
}