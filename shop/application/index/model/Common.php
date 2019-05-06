<?php
 namespace app\index\model;
use Catetree\Catetree;
use think\Db;
 class Common {
//    获取所有系统栏目下的帮助分类及其子栏目---------底部显示
    public function getAllArticle(){
        $art=db('article');
        $Cate=db('cate')->where(['cate_type'=>2,'pid'=>2])->select();
        foreach($Cate as $key => $value){
            $Cate[$key]['art']=$art->where(['pid'=>$value['id']])->select();
        }
        return $Cate;
    }


    //或去头部导航栏
    public function getTopNav(){
        $TopNav=db('nav')->field('nav_name,nav_url')->where('nav_open',1)->order('nav_scort asc')->select();
        return $TopNav;
    }

//	 获取所有首页前台页面的所有值
	public function getHotCate(){
		$Catetree=new Catetree();
		//获取所有的一级栏目
		$CateOne=Db::table('sh_category')->field('id,pid,cate_name')->where(['pid'=>0])->select();
		foreach ($CateOne as $key => $value) {
				$ids[]=$value['id'];
		}
		$where['pid'] = array('in',$ids);
		$where['show_nav']=array('eq',1);
		//链表查询，取出所有栏目是热门推荐的热卖栏目
		$FatherCate=Db::table('sh_category')
					->alias('c')
	    			->field('id,pid,cate_img,pid,show_nav,cate_name,keywords,sort')
	    			->join(['sh_goods_rec rec','rec.category=g.id','attr_id'=>5,'left'])
	    			->where($where)
	    			->order('pid asc')
	    			->select();
	   // $AllCate=Db::table('sh_category')->select();
		//$cateRes=$Catetree->ChildTree($FatherCate);
		foreach($FatherCate as $key => $value){
             $Cate[$key]['childs']=Db::table('sh_category')->where(['pid'=>$value['id']])->select();
             $Cate[$key]['self']=$value;
         }	
		return $Cate;
	} 


	//获取所有一二级分类
	public function getFirstCate(){
		//获取所有的一级栏目
		$CateOne=Db::table('sh_category')->field('id,pid,cate_name')->where(['pid'=>0])->select();
		foreach ($CateOne as $key => $value) {
			 $Cate[$key]['childs']=Db::table('sh_category')->where(['pid'=>$value['id']])->select();
             $Cate[$key]['self']=$value;
		}
		return $Cate;
	}

	//获取热销商品
	public function getTimeGoods(){
		//$HotGoods=db('goods')->where(['goods_rec'=>'1'])->select();
		$HotGoods=Db::table('sh_goods')
		 			 ->alias('g')
		 			 ->field('g.goods_name,g.id,g.goods_keywords,g.goods_code,g.og_thumb,g.marke_price,g.shop_price,g.on_sale,g.goods_desc,g.goods_rec,rec.goods_id,rec.rec_id')
		 			 ->join('sh_goods_rec rec','g.id=rec.goods_id','left')
		 			 ->group('g.id')
		 			 ->where(['rec.rec_id'=>3,'g.on_sale'=>1])
		 			 ->select();
		return $HotGoods;
	}

	

 }