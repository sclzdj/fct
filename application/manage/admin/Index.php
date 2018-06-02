<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class Index extends Admin
{
	public function index(){  
        $user_count=db('users')->count('id');
        $merchant_count=db('merchants')->count('id');
        $car_source_count=db('car_sources')->count('id');
        $order_count=db('orders')->count('id');
        //模板赋值
        $this->assign([
        	'user_count'=>number_format($user_count,0,'.',','),
        	'merchant_count'=>number_format($merchant_count,0,'.',','),
        	'car_source_count'=>number_format($car_source_count,0,'.',','),
        	'order_count'=>number_format($order_count,0,'.',','),
        ]);
        //渲染模板
        return $this->fetch();
	}
}