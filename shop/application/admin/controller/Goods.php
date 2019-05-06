<?php
/**
 * Created by PhpStorm.
 * User: 王彬
 * Date: 2018/8/25
 * Time: 17:42
 */
namespace app\admin\controller;
use Catetree\Catetree;
use app\admin\model\Goods as GoodsModel;
use think\Controller;
use think\Db;
class Goods extends  Coom{
    //==========================商品列表==========================
    public function GoodsList(){
        $GoodsModel=new GoodsModel();
        $Goods=$GoodsModel->SelectAll();
        $this->assign('Goods',$Goods);
        return view('GoodsList');
    }
    //==========================商品添加==========================
    public function GoodsAdd()
    {
        if (request()->isPost()) {

            $data = input('post.');
            $GoodsModel = new GoodsModel();
            $res = $GoodsModel->allowField(true)->save($data);//添加商品的基本信息
            $id= $GoodsModel->id;//获取自增id
            //添加会员价格
            $res2=$GoodsModel->MPrice($id,$data['mp']);
            //添加属性价格
            $GoodsModel->GAttr($id,$data['goods_attr'],$data['attr_price']);
            //添加热推
            if(isset($data['goods_rec_id'])){
               // $data['goods_rec_id']=implode(',', $data['goods_rec_id']);
                  $GoodsModel->Rec($id,$data['goods_rec_id']);
            }
            if (($res&&$res2)!==false) {
                $this->success('添加商品成功', 'GoodsAdd');
            } else {
                $this->error('添加商品失败');
            }
            }


            // 查找会员
            $Member = db('member')->select();
            //商品类型
            $GoodType = db('goodstype')->select();
            //查找商品属性
            $GoodsAttr = db('goodsattr')->select();
            //获取所属栏目
            $cate = new Catetree();
            $date = db('category')->select();
            $Category = $cate->ChildTree($date);
            //获取热卖商品
            $Rec=db('recommend')->field('id,rec_name,rec_type')->where('rec_type',1)->select();

            //获取所属品牌
            $Brand=db('brand')->field('id,brand_name')->select();
            $this->assign([
                'Member' => $Member,
                'GoodsAttr' => $GoodsAttr,
                'GoodType' => $GoodType,
                'Category' => $Category,
                'Brand'=>$Brand,
                'Rec'=>$Rec
            ]);
            return view('Goods/GoodsAdd');

        }
    //获取商品的属性值
        public function GetAttr(){
            $typeid=input('value');
            $goodsattr=db('goodsattr')->where('type_id',$typeid)->select();
            return $goodsattr;

            }


    //================商品删除==========================
    public function GoodsDel(){
        //删除图片
        $id=input('id');
        //删除了图片
        $filename=db('goods')->field('og_thumb,sm_thumb,big_thumb')->find($id);
        foreach($filename as $key=>$value){
            if(isset($key)){
                $img=$filename[$key];
                $file=PICTURE.$img;
                @unlink($file);
            }
        }
        //删除会员价格，通过商品id找到所有good_id并将其删除
        db('member_price')->where('goods_id',$id)->delete();
        //删除库存
        db('goods_stock')->where('goods_id',$id)->delete();
        //删除商品属性价格
        db('goodsattr_price')->where('attr_goodsid',$id)->delete();
        //删除商品热卖
        db('goods_rec')->where('goods_id',$id)->delete();

        $res =db('goods')->delete($id);
        if($res){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }

    }

    //===================商品修改==========================
    public function GoodsEdit(){
        $id=input('id');
        if(request()->isPost()){
            $data=input('post.');
               //如果有相片穿过来就进行删除更新，否则不动原图
            if($_FILES['og_thumb']['tmp_name']){
                $file1=PICTURE.$data['oldog_thumb'];
                @unlink($file1);
                $file2=PICTURE.$data['oldsm_thumb'];
                @unlink($file2);
                $file3=PICTURE.$data['oldbig_thumb'];
                @unlink($file3);
            }
                $GoodsModel = new GoodsModel();
                //删（改）会员价格（model）
                //会员价格进行接收
                $mp=$data['mp'];
                $resl=$GoodsModel->MPrice($data['id'],$mp);

                if ($resl) {
                    unset($data['mp']);
                    //更新操作
                    $res=$GoodsModel->allowField(true)->isUpdate(true)->save($data);
                    if ($res!=false){
                        $this->success('商品更新成功', 'Goodslist');
                    } else {
                        $this->error('商品更新失败');
                    }
                } else {
                    $this->error('商品更失败');
                }


        }


        //查找出商品的基本信息
        $GoodsEsinfor=db('goods')->find($id);
        //获取对应的热热搜
        $rec=db('goods_rec')->field('goods_id,rec_id')->where('goods_id',$id)->select();
        //重组数组
        $temp=array();
        foreach ($rec as $key => $value) {
            $temp[$value['goods_id']][]=$value['rec_id'];
        }
        //把热搜属性组合到商品基本信息表去
        $GoodsEsinfor['rec']=$temp;
        //会员价格
        $PMprice=db('member_price')->where('goods_id',$id)->select();
        //变数组形式，吧索引变成会员等级id
                $Mp=array();
        foreach($PMprice as $key => $value){
                $Mp[$value['mlevel_id']]=$value;
        }

        //属性价格
        $GoodsAPrice=Db::table('sh_goodsattr_price')->alias('gp')->join('goodsattr ga','ga.id=gp.attr_id','left')->where('attr_goodsid',$id)->select();
        //重组数组以attr_value为索引
        $GoodsAP=array();
        foreach($GoodsAPrice as $key => $value){
            $GoodsAP[$value['attr_name']][]=$value;
        }
        // 所有会员
        $Member = db('member')->select();
        //商品类型
        $GoodType = db('goodstype')->select();
        //商品属性
        $GoodsAttr = db('goodsattr')->select();
        //所属栏目
        $cate = new Catetree();
        $date = db('category')->select();
        $Category = $cate->ChildTree($date);
        //获取所属品牌
        $Brand=db('brand')->field('id,brand_name')->select();
         //获取热卖商品
        $Rec=db('recommend')->field('id,rec_name,rec_type')->where('rec_type',1)->select();

        $this->assign([
            'Member' => $Member,
            'GoodsAttr' => $GoodsAttr,
            'GoodType' => $GoodType,
            'Category' => $Category,
            'GoodsEsinfor'=>$GoodsEsinfor,  //商品的基本信息
            'Mp'=>$Mp,                      //会员基本信息
            'GoodsAP'=>$GoodsAP,   //商品属相价格
            'Rec'=>$Rec,            //热卖商品
            'Brand'=>$Brand,        //所属品牌
        ]);
        return view('GoodsEdit');

    }

    //==========================库存商品列表==========================
    public function StockList($id)
    {   //通过id去数据库查找库存量，如果没有库存那就进行添加，如果有库存那就进行修改
        //进行库存的查询
        if(request()->isPost()){
            $data=input('post.');
            //插入数据库 sh_goods_stock
            $goods_attr=$data['goods_attr'];
            $goods_num=$data['goods_num'];
            $goods_id=$id;
            //先根据Goods_id吧数据库里面对应的数据全给删除了
            db('goods_stock')->where('goods_id',$goods_id)->delete();
            foreach($goods_num as $key =>$value){
                $tempAttr=array();
                foreach($goods_attr as $k => $v){
                    $tempAttr[]=$v[$key];
                }
                sort($tempAttr);
                $tempAttr=implode(',',$tempAttr);
                //添加到库存里面去
                $res=db('goods_stock')->insert([
                    'goods_id'=>$goods_id,
                    'goods_attr'=>$tempAttr,
                    'goods_num'=>$value,
                ]);
            }
            if($res){
                $this->success("库存插入成功","GoodsList");
            }else{
                $this->error("库存写入失败");
            }
        }
        //链表查询 goods_attr和 表 goods_attr_price
        $Stock=Db::table('sh_goodsattr')->alias('g')
            ->field('g.id,ga.attr_goodsid,g.attr_name,ga.attr_value,g.attr_name,ga.attr_id')
            ->join('sh_goodsattr_price ga','g.id=ga.attr_id')
            ->where('g.attr_type=2')
           
            ->select();
        //把二维数组变成三维
        $StockRes=array();

        $GoodsStack=db('goods_stock')->where('goods_id',$id)->select();
        foreach($Stock as $key=>$value){
            $StockRes[$value['attr_name']][]=$value;
        }
        $this->assign([
            'StockRes'=>$StockRes,
            'GoodsStack'=>$GoodsStack
        ]);
        return view('GoodsStock');
    }

}