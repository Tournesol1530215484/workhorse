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
class Goods extends Model
{
   // protected $field=true;
    //==========================商品添加的前置操作==========================
    protected static function init(){
        Goods::event('before_insert',function($goods){
            if($_FILES['og_thumb']['tmp_name']){
            $thumbPath=$goods->upload('og_thumb');
                //生成三张缩略图
                $ogThumb=date("Ymd").DS.$thumbPath;
                $bigThumb=date("Ymd").DS.'big_'.$thumbPath;
                $smThumb=date("Ymd").DS.'sm_'.$thumbPath;
                //提取源图片
                $image = \think\Image::open(PICTURE.$ogThumb);
                $image->thumb(100,100)->save(PICTURE.$bigThumb);
                $image->thumb(50,50)->save(PICTURE.$smThumb);
                $goods->og_thumb=$ogThumb;
                $goods->big_thumb=$bigThumb;
                $goods->sm_thumb=$smThumb;
            }
            //生成商品编号
            $goods->goods_code=time().rand(111111,999999);
        });

        //==========================商品修改的前置操作==========================
        Goods::event('before_update',function($goods){
            //上传新的图片
            if($_FILES['og_thumb']['tmp_name']){
                $thumbPath=$goods->upload('og_thumb');
                //生成三张缩略图
                $ogThumb=date("Ymd").DS.$thumbPath;
                $bigThumb=date("Ymd").DS.'big_'.$thumbPath;
                $smThumb=date("Ymd").DS.'sm_'.$thumbPath;
                //提取源图片
                $image = \think\Image::open(PICTURE.$ogThumb);
                $image->thumb(100,100)->save(PICTURE.$bigThumb);
                $image->thumb(50,50)->save(PICTURE.$smThumb);
                $goods->og_thumb=$ogThumb;
                $goods->big_thumb=$bigThumb;
                $goods->sm_thumb=$smThumb;
            }
        });

    }

    //==========================商品添加时==========================

    //处理会员价格
    public function MPrice($id,$Mprice){
        //对原数据进行删除
        $resuolt=Db::table('member_price')->where('goods_id','=',$id)->delete();
        $res='1';
        //添加数据
        if($resuolt==0) {
            foreach ($Mprice as $key => $value) {
                if (trim($value) != '') {
                    $res = db('member_price')->insert(['mprice' => $value, 'mlevel_id' => $key, 'goods_id' => $id]);
                }
            }
            return $res;
        }else{
            return 0;
        }

    }

    public function MPriceDel($id,$Mprice){
        $res='1';
        foreach($Mprice as $key=>$value){
            if(trim($value) != ''){
                $res= db('member_price')->insert(['mprice'=>$value,'mlevel_id'=>$key,'goods_id'=>$id]);
            }
        }
        return $res;
    }
    //处理属性值
    public function GAttr($id,$goods_attr,$attr_price){
        $i=0;
        foreach($goods_attr as $key=>$value){
            if(is_array($value)){
                if(!empty($value)){
                    foreach($value as $k=>$v){
                        db('goodsattr_price')->insert(['attr_id'=>$key,'attr_value'=>$v,'attr_price'=>$attr_price[$i],'attr_goodsid'=>$id]);
                        $i++;
                    }
                } else{
                    db('goodsattr_price')->insert(['attr_id'=>$key,'attr_value'=>$value,'attr_goodsid'=>$id]);
                }
            }
        }
    }

    //图片上传
    public  function upload($images){
            $file=request()->file($images);
            $info = $file->move(ROOT_PATH . 'public' . DS .'static'. DS . 'uploads');
            if($info){
               return $info->getFilename();
            }else{
                echo $file->getError();
            }
        }

//==========================商品查询==========================

    //商品查询
    public function SelectAll(){
        //连表查询
        $join=[
            ['sh_category s','s.id=g.category_id','left'],
            ['sh_goodstype gs','gs.id=g.type_id','left'],
            ['sh_brand br','br.id=g.brand_id','left']
        ];
        $res=Db::table('sh_goods')
            ->alias('g')
            ->field("g.*,s.cate_name,gs.type_name,br.brand_name")
            ->join($join)
            ->paginate(20);
        return $res;
    }


}