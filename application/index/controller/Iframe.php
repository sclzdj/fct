<?php
namespace app\index\controller;

use app\common\controller\Common;
use think\Db;
use think\Request;
use think\Validate;

class Iframe extends Common
{
    protected function _initialize()
    {
        // 判断是否登录，并定义用户ID常量
        defined('UID') or define('UID', session('user_auth.uid'));
    }
    public function customerCarsourceList()
    {
        //获取筛选参数
        $filter=[
            'sn'=>input('param.sn',''),
            'brand_id'=>input('param.brand_id',''),
            'serie_id'=>input('param.serie_id',''),
            'model_id'=>input('param.model_id',''),
            'shop_name'=>input('param.shop_name',''),
        ];
        //整理筛选参数
        $map=[];
        if($filter['sn']!==''){
            $map['a.sn']=['like','%'.$filter['sn'].'%'];
        }
        if($filter['brand_id']!==''){
            $map['a.brand_id']=$filter['brand_id'];
        }
        if($filter['serie_id']!==''){
            $map['a.serie_id']=$filter['serie_id'];
        }
        if($filter['model_id']!==''){
            $map['a.model_id']=$filter['model_id'];
        }
        if($filter['shop_name']!==''){
            $map['c.shop_name']=['like','%'.$filter['shop_name'].'%'];
        }
        //车商
        if(ismerchant()){
            $map['c.id']=ismerchant();
        }
        $order=input('param.order','a.audit_at desc');
        $order=str_replace('+', ' ', $order);
        //查出数据
        $object=db('car_sources a')->field('a.id,a.sn,a.driving_img,a.brand_id,a.serie_id,a.model_id,a.plate_province_id,a.plate_city_id,a.first_plate_at,a.mileage,a.price,a.imgs,a.stock_state,a.audit,a.audit_at,a.created_at,b.username admin_name,c.shop_name')->join('admin_user b','a.runner_id=b.id','LEFT')->join('merchants c','a.merchant_id=c.id','LEFT')->where($map)->order($order)->paginate(10);
        // 获取分页显示
        $page = $object->render();
        $data_all = json_decode(json_encode($object),TRUE);
        $data=$data_all['data'];
        //处理数据
        foreach ($data as $key => $value) {
            $data[$key]['audit_at_str']=date('Y-m-d H:i',$value['audit_at']);
            $data[$key]['price']=number_format($value['price'],2,'.','');
        }
        //模板赋值
        $this->assign([
            'filter'=>$filter,
            'order'=>$order,
            'data'=>$data,
            'page'=>$page,
            '_pop'=>1,
        ]);
        //渲染模板
        return $this->fetch();
    }
}
 