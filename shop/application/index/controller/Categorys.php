<?php

 /**
 * Created by PhpStorm.
 * User: 王彬
 * Date: 2018/8/12
 * Time: 21:17
 */
namespace app\index\controller;
use app\index\model\Categorys as CategorysModel;
class Categorys extends Base{
//获取左侧栏目界面
    public function Get_Cate_Ifon($id){

        $data['cat_id']=$id;
        //根据id获取一级栏目
	       //获取二级分类和三级分类
        $Categorys=new CategorysModel();
        $TwoAndThreeCate=$Categorys->getTwoAndThreeCate($id);
        //获取相对应的关联属性
        $CateWord=$Categorys->getCateWord($id);
        //获取对应的品牌
        $brands=$Categorys->getCateBrands($id);

        $cat=''; 
        foreach ($TwoAndThreeCate as $k => $v) {
            $cat.='<dl class="dl_fore1"><dt><a href="'.url('index/Category/index',['id'=>$v['self']['id']]).'" target="_blank">'.$v['self']['cate_name'].'</a></dt><dd>';
                    foreach ($v['childs'] as $k1 => $v1) {
                        $cat.='<a href="'.url('index/Category/index',['id'=>$v1['id']]).'" target="_blank">'.$v1['cate_name'].'</a>';
                    }
            $cat.='</dd></dl>
                <div class="item-brands"><ul></ul></div>
                <div class="item-promotions"></div>';
        }

        $topcon=''; 
        foreach ($CateWord as $k => $v) {
			$topcon.='<a href="'.$v['link_url'].'" target="_blank">'.$v['words'].'</a>';
		}

       $bransAdContent='';
        $bransAdContent.='
        <div class="cate-brand">';
                foreach ($brands['brands'] as $k => $v) {
                    $bransAdContent.=
                    '<div class="img">
                        <a href="'.$v['brand_url'].'" target="_blank" title="'.$v['brand_name'].'"><img src="'.config('view_replace_str.UPLOADS').'/'.$v['brand_img'].'"></a>
                    </div>';
                }
        $bransAdContent.='</div>';
        // $bransAdContent.='
        // <div class="cate-promotion">
        //     <a href="'.$brands['promotion']['pro_url'].'" target="_blank"><img width="199" height="97" src="'.config('view_replace_str.UPLOADS').'/'.$brands['promotion']['pro_img'].'"></a>
        // </div>';
        //获取栏目关联词
        $data['topic_content']=$topcon;
        $data['cat_content']=$cat;
        $data['brands_ad_content']=$bransAdContent;
        return json($data);
 }
}
