<?php
namespace app\index\controller;

class Goods extends Base
{

    public function index()
    {
        return view('Goods');
    }

    //获取band_id下的所有商品
    public function GoodsCate($id){
    		//$id=input("post.");
    	dump($id);
    	die;
    }

	public function Goods($id)
    {
       // dump($id);
        
        return view('Goods');
    }
    public function GoodsList($id)
    {
       // dump($id);
        
        return view('GoodsList');
    }
}
