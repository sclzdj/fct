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
    //客户管理选择车源
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
    //订单管理选择客户
    public function orderCustomerList()
    {
        //获取筛选参数
        $filter=[
            'name'=>input('param.name',''),
            'mobile'=>input('param.mobile',''),
        ];
        //整理筛选参数
        $map=[];
        if($filter['name']!==''){
            $map['a.name']=['like','%'.$filter['name'].'%'];
        }
        if($filter['mobile']!==''){
            $map['a.mobile']=['like','%'.$filter['mobile'].'%'];
        }
        //车商
        $ismerchant=ismerchant();
        if($ismerchant){
            $map['c.id']=$ismerchant;
        }
        $order=input('param.order','a.follow_at desc');
        $order=str_replace('+', ' ', $order);
        //查出数据
        $object=db('customers a')->field('a.id,a.name,a.state,a.mobile,a.runner_id,a.follow_at,a.car_source_id,a.defind_model,b.username admin_name,c.shop_name')->join('admin_user b','a.runner_id=b.id','LEFT')->join('merchants c','a.merchant_id=c.id','LEFT')->where($map)->order($order)->paginate(10);
        // 获取分页显示
        $page = $object->render();
        $data_all = json_decode(json_encode($object),TRUE);
        $data=$data_all['data'];
        //处理数据
        foreach ($data as $key => $value) {
            $data[$key]['follow_at_str']=date('Y-m-d H:i',$value['follow_at']);
            if($data[$key]['car_source_id']>0){
                $map=[];
                if($ismerchant){
                    $map['b.id']=$ismerchant;
                }
                $carsource=db('car_sources a')->join('merchants b','a.merchant_id=b.id','LEFT')->where($map)->where('a.id',$value['car_source_id'])->find();
                if($carsource){
                    $data[$key]['car_source']=$value['car_source_id'];
                }else{
                    $data[$key]['car_source']='';
                }
            }else{
                $data[$key]['car_source']=$value['defind_model'];
            }
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
    //订单管理选择车源
    public function orderCarsourceList()
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
        $ismerchant=ismerchant();
        if($ismerchant){
            $map['c.id']=$ismerchant;
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
    //今日好车推荐选择车源
    public function todayrecommentCarsourceList()
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
        $ismerchant=ismerchant();
        if($ismerchant){
            $map['c.id']=$ismerchant;
        }
        //过滤添加过的
        $today_recomment=db('today_recomments')->field('car_source_id')->select();
        $car_source_ids=[];
        foreach ($today_recomment as $k => $v) {
            $car_source_ids[]=$v['car_source_id'];
        }
        $map['a.id']=['not in',$car_source_ids];
        //排序
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
    //猜你喜欢选择车源
    public function guesslikeCarsourceList()
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
        $ismerchant=ismerchant();
        if($ismerchant){
            $map['c.id']=$ismerchant;
        }
        //过滤添加过的
        $guess_like=db('guess_likes')->field('car_source_id')->select();
        $car_source_ids=[];
        foreach ($guess_like as $k => $v) {
            $car_source_ids[]=$v['car_source_id'];
        }
        $map['a.id']=['not in',$car_source_ids];
        //排序
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
 