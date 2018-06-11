<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class Order extends Admin
{
	//订单列表
    public function index(){
        //获取筛选参数
        $filter=[
            'sn'=>input('param.sn',''),
            'merchant_id'=>input('param.merchant_id',''),
            'brand_id'=>input('param.brand_id',''),
            'serie_id'=>input('param.serie_id',''),
            'car_id'=>input('param.car_id',''),
            'paid_at_start'=>input('param.paid_at_start',''),
            'paid_at_end'=>input('param.paid_at_end',''),
        ];
        //整理筛选参数
        $map=[];
        if($filter['sn']!==''){
            $map['a.sn']=['like','%'.$filter['sn'].'%'];
        }
        if($filter['merchant_id']!==''){
            $map['a.merchant_id']=$filter['merchant_id'];
        }
        if($filter['brand_id']!==''){
            $map['d.brand_id']=$filter['brand_id'];
            $serie=db('series')->field('id,p_chexi_id,p_chexi')->where(['p_pinpai_id'=>$filter['brand_id'],'p_chexi_id'=>['neq',''],'p_chexi'=>['neq','']])->select();
        }else{
            $serie=[];
        }
        if($filter['serie_id']!==''){
            $map['d.serie_id']=$filter['serie_id'];
            $car=db('cars')->field('id,p_pinpai,p_chexi,p_chexing_id,p_chexingmingcheng')->where(['p_chexi_id'=>$filter['serie_id'],'p_chexing_id'=>['neq',''],'p_chexingmingcheng'=>['neq','']])->select();
            foreach ($car as $k => $v) {
                $car[$k]['p_chexingmingcheng_jx']=str_replace([$v['p_pinpai'],$v['p_chexi']], ['',''], $v['p_chexingmingcheng']);
            }
        }else{
            $car=[];
        }
        if($filter['car_id']!==''){
            $map['d.car_id']=$filter['car_id'];
        }
        if($filter['paid_at_start']!=='' && $filter['paid_at_end']!==''){
            $map['a.paid_at']=['between time',[$filter['paid_at_start'],$filter['paid_at_end']]];
        }elseif($filter['paid_at_start']!=='' && $filter['paid_at_end']===''){
            $map['a.paid_at']=['>= time',$filter['paid_at_start']];
        }elseif($filter['paid_at_start']==='' && $filter['paid_at_end']!==''){
            $map['a.paid_at']=['<= time',$filter['paid_at_end']];
        }
        //车商
        $ismerchant=ismerchant();
        if($ismerchant){
            $map['c.id']=$ismerchant;
        }
        $order=input('param.order','a.paid_at desc');
        $order=str_replace('+', ' ', $order);
        //查出数据
        $object=db('orders')->alias('a')->field('a.id,a.sn,a.amount,a.earnest,a.state,a.paid_at,a.paid_type,a.car_source_id,a.defind_model,a.created_at,b.name customer_name,c.shop_name,d.name car_name,d.brand_id,d.serie_id,d.car_id,d.plate_province_id,d.plate_city_id,d.first_plate_at,d.mileage,d.price,d.imgs')->join('customers b','a.customer_id=b.id','LEFT')->join('merchants c','a.merchant_id=c.id','LEFT')->join('car_sources d','a.car_source_id=d.id','LEFT')->where($map)->order($order)->paginate(10);
        // 获取分页显示
        $page = $object->render();
        $data_all = json_decode(json_encode($object),TRUE);
        $data=$data_all['data'];
        //处理数据
        foreach ($data as $key => $value) {
            $data[$key]['created_at_str']=date('Y-m-d H:i',$value['created_at']);
            if($data[$key]['car_source_id']>0){
            	$map=[];
	            if($ismerchant){
		            $map['b.id']=$ismerchant;
		        }
	            $carsource=db('car_sources')->alias('a')->join('merchants b','a.merchant_id=b.id','LEFT')->where($map)->where('a.id',$value['car_source_id'])->find();
	            if($carsource){
                    $data[$key]['is_defind']='0';
	            }else{
                    $data[$key]['is_defind']='-1';
                }
            }else{
				$data[$key]['is_defind']='1';
            }
            $data[$key]['price']=number_format($value['price']/100,2,'.','');
            $data[$key]['amount']=number_format($value['amount']/100,2,'.','');
            $data[$key]['earnest']=number_format($value['earnest']/100,2,'.','');
            $data[$key]['main_img']=explode(',',$value['imgs'])[0];
            $data[$key]['first_plate_year']=explode('-',$value['first_plate_at'])[0];
            $data[$key]['region_one_text']=region_text([$value['plate_province_id'],$value['plate_city_id']],false);
        }
        //所有车商
        $where=[];
        if($ismerchant){
            $where['id']=$ismerchant;
        }
        $merchant=db('merchants')->field('id,shop_name')->where($where)->select();
        //获取品牌
        $brand=db('brands')->field('id,p_pinpai_id,p_pinpai')->where(['is_show'=>'1'])->select();
        //模板赋值
        $this->assign([
            'filter'=>$filter,
            'order'=>$order,
            'data'=>$data,
            'merchant'=>$merchant,
            'page'=>$page,
            'brand'=>$brand,
            'serie'=>$serie,
            'car'=>$car,
        ]);
        //渲染模板
        return $this->fetch();
    }
	//新建订单
	public function add(){  
        $now=time();
        // 保存数据
        if ($this->request->isPost()) {
            $ismerchant=ismerchant();
            $data = $this->request->post();
            //验证
            if($data['customer_id']==''){
                return json_return('F','1001','成交客户必选');
            }
            $map=[];
            if($ismerchant){
                $map['id']=$ismerchant;
            }
            $customer=db('customers')->where($map)->where('id',$data['customer_id'])->find();
            if(!$customer){
                return json_return('F','1001','选择的客户已不存在');
            }
            if($data['car_source_id']=='' && $data['defind_model']===''){
                return json_return('F','1002','成交车源必选');
            }
            if($data['car_source_id']!=''){
            	$map=[];
	            if($ismerchant){
		            $map['b.id']=$ismerchant;
		        }
	            $carsource=db('car_sources')->alias('a')->join('merchants b','a.merchant_id=b.id','LEFT')->where($map)->where('a.id',$data['car_source_id'])->find();
	            if(!$carsource){
	            	return json_return('F','1002','选择的成交车源已不存在');
	            }
            }
            if($data['amount']===''){
                return json_return('F','1003','订单总额必填');
            }
            if(!preg_match('/^[0-9]+(\.\d{1,2})?$/',$data['amount'])) {
                return json_return('F','1003','订单总额只允许输入数字与符号. 格式：XXX.XX，两位小数');
            }
            if($data['earnest']===''){
                return json_return('F','1004','定金金额必填');
            }
            if(!preg_match('/^[0-9]+(\.\d{1,2})?$/',$data['earnest'])) {
                return json_return('F','1004','定金金额只允许输入数字与符号. 格式：XXX.XX，两位小数');
            }
            if($data['paid_at']===''){
                return json_return('F','1005','付款时间必选');
            }
            if($data['paid_type']===''){
                return json_return('F','1006','付款方式必选');
            }
            if($data['state']===''){
                return json_return('F','1007','订单状态必选');
            }
            if($data['customer_state']===''){
                return json_return('F','1008','客户状态必选');
            }
            if($data['sale_id']==''){
                return json_return('F','1009','销售人员必选');
            }
            if($ismerchant){
            $map=[];
            $map['b.merchant_id']=$ismerchant;
                $admin_user=db('admin_user')->alias('a')->join('admin_role b','a.role=b.id','LEFT')->field('a.id,a.username')->where('a.role','neq','1')->where($map)->select();
            }elseif(!isSupper()){
                $admin_user=db('admin_user')->field('id,username')->where('role','neq','1')->select();
            }else{
                $admin_user=db('admin_user')->field('id,username')->select();
            }
            $admin_user_ids=[];
            foreach ($admin_user as $k => $v) {
                $admin_user_ids[]=$v['id'];
            }
            if(!in_array($data['sale_id'],$admin_user_ids)){
                return json_return('F','1009','选择的销售人员已不存在');
            }
            if(mb_strlen($data['remark'],'utf8')>200) {
                return json_return('F','1010','订单备注最多200个字');
            }
            //处理数据
            $insert['customer_id']=$data['customer_id'];
            if($data['car_source_id']>0){
            	$insert['car_source_id']=$data['car_source_id'];
            }else{
            	$insert['defind_model']=$data['defind_model'];
            }
            $insert['amount']=$data['amount']*100;
            $insert['earnest']=$data['earnest']*100;
            $insert['paid_at']=$data['paid_at'];
            $insert['paid_type']=$data['paid_type'];
            $insert['contract_img']=$data['contract_img'];
            $insert['state']=$data['state'];
            $insert['sale_id']=$data['sale_id'];
            $insert['remark']=$data['remark'];
            $insert['merchant_id']=$customer['merchant_id'];
            $insert['created_at']=$now;
            $insert['runner_id']=UID;
            $insert['sn']=date('YmdHis',$now).str_pad(mt_rand(1,999),3,"0",STR_PAD_LEFT);
            $insert_id=db('orders')->insertGetId($insert);
            //入库
            if ($insert_id>0) {
                db('customers')->where('id',$data['customer_id'])->update(['state'=>$data['customer_state']]);
                record_log(request()->module(),request()->controller(),'新建订单');
                return json_return('T','','新建订单成功');
            } else {
                return json_return('F','500','新建订单失败');
            }
        }
        //获取该商户下的账号
        $ismerchant=ismerchant();
        if($ismerchant){
            $map=[];
            $map['b.merchant_id']=$ismerchant;
            $admin_user=db('admin_user')->alias('a')->join('admin_role b','a.role=b.id','LEFT')->field('a.id,a.username')->where('a.role','neq','1')->where($map)->select();
        }elseif(!isSupper()){
            $admin_user=db('admin_user')->field('id,username')->where('role','neq','1')->select();
        }else{
            $admin_user=db('admin_user')->field('id,username')->select();
        }
        //模板赋值
        $this->assign([
            'admin_user'=>$admin_user,
        ]);
        //渲染模板
        return $this->fetch();
	}
	//修改
	public function edit($id=''){  
        $now=time();
        // 保存数据
        if ($this->request->isPost()) {
            $ismerchant=ismerchant();
            $order=db('orders')->where('state','0')->find($id);
            if(!$order){
                return json_return('F','500','请求错误');
            }
            if($ismerchant){
                if($order['merchant_id']!=$ismerchant){
                    return json_return('F','500','请求错误');
                }
            }
            $data = $this->request->post();
            //验证
            if($data['paid_type']===''){
                return json_return('F','1001','付款方式必选');
            }
            if($data['state']===''){
                return json_return('F','1002','订单状态必选');
            }
            if($data['customer_state']===''){
                return json_return('F','1003','客户状态必选');
            }
            if(mb_strlen($data['remark'],'utf8')>200) {
                return json_return('F','1004','订单备注最多200个字');
            }
            //处理数据
            $update['paid_type']=$data['paid_type'];
            $update['contract_img']=$data['contract_img'];
            $update['state']=$data['state'];
            $update['remark']=$data['remark'];
            $rt=db('orders')->where('id',$data['id'])->update($update);
            //入库
            if ($rt!==false) {
                db('customers')->where('id',$order['customer_id'])->update(['state'=>$data['customer_state']]);
                if($rt>0){
                    record_log(request()->module(),request()->controller(),'修改订单');
                }
                return json_return('T','','修改订单成功');
            } else {
                return json_return('F','500','修改订单失败');
            }
        }
        $order=db('orders')->where('state','0')->find($id);
        if(!$order){
            return $this->error('请求错误');
        }
        $ismerchant=ismerchant();
        if($ismerchant){
            if($order['merchant_id']!=$ismerchant){
                return $this->error('请求错误');
            }
        }
        //处理数据
        $order['remark_len']=mb_strlen($order['remark'],'utf8');
        $order['customer_name']=db('customers')->where('id',$order['customer_id'])->value('name');
        $order['customer_state']=db('customers')->where('id',$order['customer_id'])->value('state');
        if($order['car_source_id']>0){
            $map=[];
            if($ismerchant){
                $map['b.id']=$ismerchant;
            }
            $carsource=db('car_sources')->alias('a')->join('merchants b','a.merchant_id=b.id','LEFT')->where($map)->where('a.id',$order['car_source_id'])->find();
            if($carsource){
                $order['car_source']=$carsource['name'];
            }else{
                $order['car_source']='';
            }
        }else{
            $order['car_source']=$order['defind_model'];
        }
        $order['amount']=number_format($order['amount']/100,2,'.','');
        $order['earnest']=number_format($order['earnest']/100,2,'.','');
        $order['sale_name']=db('admin_user')->where('id',$order['sale_id'])->value('username');
        //模板赋值
        $this->assign([
            'order'=>$order,
        ]);
        //渲染模板
        return $this->fetch();
	}
	//详情
    public function look($id=''){
        $order=db('orders')->where('id',$id)->find();
        if($order){
            $ismerchant=ismerchant();
            if($ismerchant){
                if($order['merchant_id']!=$ismerchant){
                    return $this->error('请求错误');
                }
            }
            $order['created_at_str']=date('Y-m-d H:i',$order['created_at']);
            $order['customer_name']=db('customers')->where('id',$order['customer_id'])->value('name');
            $order['customer_state']=db('customers')->where('id',$order['customer_id'])->value('state');
            $order['sale_name']=db('admin_user')->where('id',$order['sale_id'])->value('username');
            if($order['car_source_id']>0){
                $map=[];
                if($ismerchant){
                    $map['b.id']=$ismerchant;
                }
                $carsource=db('car_sources')->alias('a')->join('merchants b','a.merchant_id=b.id','LEFT')->where($map)->where('a.id',$order['car_source_id'])->find();
                if($carsource){
                    $order['car_source']=$carsource['name'];
                }else{
                    $order['car_source']='';
                }
            }else{
                $order['car_source']=$order['defind_model'];
            }
            $order['amount']=number_format($order['amount']/100,2,'.','');
            $order['earnest']=number_format($order['earnest']/100,2,'.','');
            $order['sale_name']=db('admin_user')->where('id',$order['sale_id'])->value('username');
            //模板赋值
            $this->assign([
                'order'=>$order,
            ]);
            //渲染模板
            return $this->fetch();
        }else{
            return $this->error('请求错误');
        }
    }
}