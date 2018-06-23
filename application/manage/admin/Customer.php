<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class Customer extends Admin
{
	//客户列表
    public function index(){
        //获取筛选参数
        $filter=[
            'name'=>input('param.name',''),
            'state'=>input('param.state',''),
            'source'=>input('param.source',''),
            'merchant_id'=>input('param.merchant_id',''),
            'mobile'=>input('param.mobile',''),
            'follow_at_start'=>input('param.follow_at_start',''),
            'follow_at_end'=>input('param.follow_at_end',''),
        ];
        $filter=fortrim($filter);
        //整理筛选参数
        $map=[];
        if($filter['name']!==''){
            $map['a.name']=['like','%'.$filter['name'].'%'];
        }
        if($filter['state']!==''){
            $map['a.state']=$filter['state'];
        }
        if($filter['source']!==''){
            $map['a.source']=$filter['source'];
        }
        if($filter['merchant_id']!==''){
            $map['a.merchant_id']=$filter['merchant_id'];
        }
        if($filter['mobile']!==''){
            $map['a.mobile']=['like','%'.$filter['mobile'].'%'];
        }
        $filter_at['follow_at_start']=$filter['follow_at_start'].' 00:00:00';
        $filter_at['follow_at_end']=$filter['follow_at_end'].' 23:59:59';
        if($filter['follow_at_start']!=='' && $filter['follow_at_end']!==''){
            $map['a.follow_at']=['between time',[$filter_at['follow_at_start'],$filter_at['follow_at_end']]];
        }elseif($filter['follow_at_start']!=='' && $filter['follow_at_end']===''){
            $map['a.follow_at']=['>= time',$filter_at['follow_at_start']];
        }elseif($filter['follow_at_start']==='' && $filter['follow_at_end']!==''){
            $map['a.follow_at']=['<= time',$filter_at['follow_at_end']];
        }
        //车商
        $ismerchant=ismerchant();
        if($ismerchant){
            $map['c.id']=$ismerchant;
        }
        $order=input('param.order','a.follow_at desc');
        $order=str_replace('+', ' ', $order);
        //查出数据
        $object=db('customers')->alias('a')->field('a.id,a.name,a.state,a.source,a.car_source_id,a.defind_model,a.merchant_id,a.mobile,a.follow_at,a.created_at,b.username admin_name,c.shop_name')->join('admin_user b','a.runner_id=b.id','LEFT')->join('merchants c','a.merchant_id=c.id','LEFT')->where($map)->order($order)->paginate(15);
        // 获取分页显示
        $page = $object->render();
        $data_all = json_decode(json_encode($object),TRUE);
        $data=$data_all['data'];
        //缓存导出数据
        session('user_index_export_map',$map);
        session('user_index_export_order',$order);
        //处理数据
        foreach ($data as $key => $value) {
            $data[$key]['created_at_str']=date('Y-m-d H:i',$value['created_at']);
            $data[$key]['follow_at_str']=date('Y-m-d H:i',$value['follow_at']);
            if($data[$key]['car_source_id']>0){
            	$map=[];
	            if($ismerchant){
		            $map['b.id']=$ismerchant;
		        }
	            $carsource=db('car_sources')->alias('a')->join('merchants b','a.merchant_id=b.id','LEFT')->where($map)->where('a.id',$value['car_source_id'])->find();
	            if($carsource){
	            	$data[$key]['car_source']=$carsource['name'];
	            }else{
	            	$data[$key]['car_source']='';
	            }
            }else{
				$data[$key]['car_source']=$value['defind_model'];
            }
        }
        //所有车商
        $where=[];
        if($ismerchant){
            $where['id']=$ismerchant;
        }
        $merchant=db('merchants')->field('id,shop_name')->where($where)->select();
        //模板赋值
        $this->assign([
            'filter'=>$filter,
            'order'=>$order,
            'data'=>$data,
            'merchant'=>$merchant,
            'page'=>$page,
        ]);
        //渲染模板
        return $this->fetch();
    }
    //导出
	public function export(){
		$header = array(
          'ID'=>'string',//text
          '客户名称'=>'string',//text
          '联系电话'=>'string',//text
          '客户状态'=>'string',//text
          '客户来源'=>'string',//text
          '意向产品'=>'string',//text
          '所属车商'=>'string',//text
          '录入人'=>'string',//text
          '跟进时间'=>'string',//text
        );
        $data = db('customers')->alias('a')->field('a.id,a.name,a.state,a.source,a.car_source_id,a.defind_model,a.merchant_id,a.mobile,a.follow_at,a.created_at,b.username admin_name,c.shop_name')->join('admin_user b','a.runner_id=b.id','LEFT')->join('merchants c','a.merchant_id=c.id','LEFT')->where(session('user_index_export_map'))->order(session('user_index_export_order'))->select();
        $new_data=[];
        $ismerchant=ismerchant();
        //处理数据
        foreach ($data as $key => $value) {
        	$value['created_at_str']=date('Y-m-d H:i',$value['created_at']);
            $value['follow_at_str']=date('Y-m-d H:i',$value['follow_at']);
            if($value['car_source_id']>0){
            	$map=[];
	            if($ismerchant){
		            $map['b.id']=$ismerchant;
		        }
	            $carsource=db('car_sources')->alias('a')->join('merchants b','a.merchant_id=b.id','LEFT')->where($map)->where('a.id',$value['car_source_id'])->find();
	            if($carsource){
	            	$value['car_source']=$carsource['name'];
	            }else{
	            	$value['car_source']='';
	            }
            }else{
				$value['car_source']=$value['defind_model'];
            }
            switch ($value['state']) {
            	case '0':
            		$value['state_str']='未到店';
            		break;
            	case '1':
            		$value['state_str']='已到店';
            		break;
            	case '2':
            		$value['state_str']='已预订';
            		break;
            	case '3':
            		$value['state_str']='已成交';
            		break;
            	case '-1':
            		$value['state_str']='战败';
            		break;
            	default:
            		# code...
            		break;
            }
            $pix=[
            	'id'=>$value['id'],
            	'name'=>$value['name'],
            	'mobile'=>$value['mobile'],
            	'state_str'=>$value['state_str'],
            	'source'=>$value['source'],
            	'car_source'=>$value['car_source'],
            	'shop_name'=>$value['shop_name'],
            	'admin_name'=>$value['admin_name'],
            	'follow_at_str'=>$value['follow_at_str'],
            ];
            $new_data[]=$pix;
        }
        $file_name = 'customerList-'.date('YmdHis').'-'.mt_rand(1000,9999).'.xlsx';     //下载文件名    
        $file_dir = "excels/";        //下载文件存放目录  
        do_rmdir($file_dir,false);//先清空文件夹
        $rows = $new_data;
        import('PHP_XLSXWriter-master.xlsxwriter', EXTEND_PATH,'.class.php');
        $writer = new \XLSXWriter();
        $writer->writeSheetHeader('Sheet1', $header);
        foreach($rows as $row){
            $row=array_values($row);
            $writer->writeSheetRow('Sheet1', $row);
        }
        $writer->writeToFile($file_dir.$file_name);
        //检查文件是否存在    
        if (! file_exists ( $file_dir . $file_name )) {    
            return $this->error('文件未生成成功，请重试');
        } else {    
            record_log(request()->module(),request()->controller(),'导出客户列表');
            header('Location:'.config('finecar.host_url').'/'.$file_dir.$file_name);
            die;
        } 
	}
	//新建客户
	public function add(){  
        $now=time();
        // 保存数据
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $data=fortrim($data);
            //验证
            if($data['name']===''){
                return json_return('F','1001','客户名称必填');
            }
            if(!preg_match('/^[\x{4e00}-\x{9fa5}]{2,8}$/u',$data['name'])) {
                return json_return('F','1001','客户名称，只允许输入汉字，字符长度：2-8个字符');
            }
            if($data['mobile']===''){
                return json_return('F','1002','联系电话必填');
            }
            if(!preg_match('/^[0-9]{11}$/',$data['mobile'])) {
                return json_return('F','1002','联系电话只允许输入11位数字');
            }
            if(!isset($data['sex']) || $data['sex']===''){
                return json_return('F','1003','性别必选');
            }
            if($data['sex']!='男' && $data['sex']!='女') {
                return json_return('F','1003','性别只能男或女');
            }
            if($data['province_id']===''){
                return json_return('F','1004','所在省份必选');
            }
            if($data['city_id']===''){
                return json_return('F','1005','所在城市必选');
            }
            if($data['car_source_id']=='' && $data['defind_model']===''){
                return json_return('F','1006','意向车源必选');
            }
            $ismerchant=ismerchant();
            if($data['car_source_id']!=''){
            	$map=[];
	            if($ismerchant){
		            $map['b.id']=$ismerchant;
		        }
	            $carsource=db('car_sources')->alias('a')->field('a.id,a.merchant_id')->join('merchants b','a.merchant_id=b.id','LEFT')->where($map)->where('a.id',$data['car_source_id'])->find();
	            if(!$carsource){
	            	return json_return('F','1006','选择的意向车源已不存在');
	            }else{
                    $in_merchant_id=$carsource['merchant_id'];
                }
            }else{
                $in_merchant_id=(int)$ismerchant;
            }
            if($data['source']===''){
                return json_return('F','1007','客户来源必选');
            }
            if($data['state']===''){
                return json_return('F','1008','客户状态必选');
            }
            if(mb_strlen($data['remark'],'utf8')>200) {
                return json_return('F','1009','客户简介最多200个字');
            }
            //处理数据
            $insert['name']=$data['name'];
            $insert['mobile']=$data['mobile'];
            $insert['sex']=$data['sex'];
            $insert['province_id']=$data['province_id'];
            $insert['city_id']=$data['city_id'];
            if($data['car_source_id']>0){
            	$insert['car_source_id']=$data['car_source_id'];
            }else{
            	$insert['defind_model']=$data['defind_model'];
            }
            $insert['source']=$data['source'];
            $insert['state']=$data['state'];
            $insert['remark']=$data['remark'];
            $insert['merchant_id']=$in_merchant_id;
            $insert['created_at']=$now;
            $insert['follow_at']=$now;
            $insert['runner_id']=UID;
            $insert_id=db('customers')->insertGetId($insert);
            //入库
            if ($insert_id>0) {
                record_log(request()->module(),request()->controller(),'新建客户');
                return json_return('T','','新建客户成功');
            } else {
                return json_return('F','500','新建客户失败');
            }
        }
        //获取中国省份
        $province=db('regions')->field('id,name')->where(['parent_id'=>'1','level'=>'1'])->order('sort asc')->select();
        //模板赋值
        $this->assign([
            'province'=>$province,
        ]);
        //渲染模板
        return $this->fetch();
	}
	//修改
	public function edit($id=''){  
        $now=time();
        // 保存数据
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $data=fortrim($data);
            $customer=db('customers')->find($data['id']);
            if(!$customer){
                return json_return('F','500','请求错误');
            }
            $ismerchant=ismerchant();
            if($ismerchant){
                if($customer['merchant_id']!=$ismerchant){
                    return json_return('F','500','请求错误');
                }
            }
            //验证
            if($data['name']===''){
                return json_return('F','1001','客户名称必填');
            }
            if(!preg_match('/^[\x{4e00}-\x{9fa5}]{2,8}$/u',$data['name'])) {
                return json_return('F','1001','客户名称，只允许输入汉字，字符长度：2-8个字符');
            }
            if($data['mobile']===''){
                return json_return('F','1002','联系电话必填');
            }
            if(!preg_match('/^[0-9]{11}$/',$data['mobile'])) {
                return json_return('F','1002','联系电话只允许输入11位数字');
            }
            if(!isset($data['sex']) || $data['sex']===''){
                return json_return('F','1003','性别必选');
            }
            if($data['sex']!='男' && $data['sex']!='女') {
                return json_return('F','1003','性别只能男或女');
            }
            if($data['province_id']===''){
                return json_return('F','1004','所在省份必选');
            }
            if($data['city_id']===''){
                return json_return('F','1005','所在城市必选');
            }
            $data['car_source_id']=intval($data['car_source_id']);
            if($data['car_source_id']=='0' && $data['defind_model']===''){
                return json_return('F','1006','意向车源必选');
            }
            if($data['car_source_id']!='0'){
            	$map=[];
	            if($ismerchant){
		            $map['b.id']=$ismerchant;
		        }
	            $carsource=db('car_sources')->alias('a')->field('a.id,a.merchant_id')->join('merchants b','a.merchant_id=b.id','LEFT')->where($map)->where('a.id',$data['car_source_id'])->find();
	            if(!$carsource){
	            	return json_return('F','1006','选择的意向车源已不存在');
	            }else{
                    $in_merchant_id=$carsource['merchant_id'];
                }
            }else{
                $in_merchant_id=(int)$ismerchant;
            }
            if($data['source']===''){
                return json_return('F','1007','客户来源必选');
            }
            if($data['state']===''){
                return json_return('F','1008','客户状态必选');
            }
            if(mb_strlen($data['remark'],'utf8')>200) {
                return json_return('F','1009','客户简介最多200个字');
            }
            //处理数据
            $update['name']=$data['name'];
            $update['mobile']=$data['mobile'];
            $update['sex']=$data['sex'];
            $update['province_id']=$data['province_id'];
            $update['city_id']=$data['city_id'];
            if($data['car_source_id']>0){
            	$update['car_source_id']=$data['car_source_id'];
            	$update['defind_model']='';
            }else{
            	$update['defind_model']=$data['defind_model'];
            	$update['car_source_id']='0';
            }
            $update['source']=$data['source'];
            $update['state']=$data['state'];
            $update['remark']=$data['remark'];
            $update['merchant_id']=$in_merchant_id;
            $rt=db('customers')->where('id',$data['id'])->update($update);
            //入库
            if ($rt!==false) {
            	if($rt>0){
                    record_log(request()->module(),request()->controller(),'修改客户');
                } 
                return json_return('T','','修改客户成功');
            } else {
                return json_return('F','500','修改客户失败');
            }
        }

        $customer=db('customers')->find($id);
        if(!$customer){
            return $this->error('请求错误');
        }
        $ismerchant=ismerchant();
        if($ismerchant){
            if($customer['merchant_id']!=$ismerchant){
                return $this->error('请求错误');
            }
        }
        //处理数据
        $customer['remark_len']=mb_strlen($customer['remark'],'utf8');
        if($customer['car_source_id']>0){
            $map=[];
            if($ismerchant){
                $map['b.id']=$ismerchant;
            }
            $carsource=db('car_sources')->alias('a')->join('merchants b','a.merchant_id=b.id','LEFT')->where($map)->where('a.id',$customer['car_source_id'])->find();
            if($carsource){
                $customer['car_name']=$carsource['name'];
            }else{
                $customer['car_name']='';
            }
        }
        //获取中国省份
        $province=db('regions')->field('id,name')->where(['parent_id'=>'1','level'=>'1'])->order('sort asc')->select();
        $city=db('regions')->field('id,name')->where(['parent_id'=>$customer['province_id'],'level'=>'2'])->order('sort asc')->select();
        //模板赋值
        $this->assign([
            'province'=>$province,
            'city'=>$city,
            'customer'=>$customer,
        ]);
        //渲染模板
        return $this->fetch();
	}
	//详情
    public function look($id=''){
        $customer=db('customers')->where('id',$id)->find();
        if($customer){
            $ismerchant=ismerchant();
            if($ismerchant){
                if($customer['merchant_id']!=$ismerchant){
                    return $this->error('请求错误');
                }
            }
            $customer['region_text']=region_text([$customer['province_id'],$customer['city_id']]);
            $customer['created_at_str']=date('Y-m-d H:i',$customer['created_at']);
            $customer['follow_at_str']=date('Y-m-d H:i',$customer['follow_at']);
            $customer['admin_name']=(string)db('admin_user')->where('id',$customer['runner_id'])->value('username');
            $customer['shop_name']=(string)db('merchants')->where('id',$customer['merchant_id'])->value('shop_name');
            if($customer['car_source_id']>0){
            	$map=[];
	            if($ismerchant){
		            $map['b.id']=$ismerchant;
		        }
	            $carsource=db('car_sources')->alias('a')->join('merchants b','a.merchant_id=b.id','LEFT')->where($map)->where('a.id',$customer['car_source_id'])->find();
	            if($carsource){
	            	$customer['car_source']=$carsource['name'];
	            }else{
	            	$customer['car_source']='';
	            }
            }else{
				$customer['car_source']=$customer['defind_model'];
            }
            //模板赋值
            $this->assign([
                'customer'=>$customer,
            ]);
            //渲染模板
            return $this->fetch();
        }else{
            return $this->error('请求错误');
        }
    }
    //转交
    public function deliver(){
        $data = $this->request->post();
    	$customer=db('customers')->where('id',$data['id'])->where('car_source_id','0')->find();
        if($customer){
        	$merchant=db('merchants')->where('id',$data['merchant_id'])->find();
        	if($merchant){
            	$rt=db('customers')->where('id',$data['id'])->update(['merchant_id'=>$data['merchant_id']]);
            	if($rt!==false){
            		if($rt>0){
	                    record_log(request()->module(),request()->controller(),'转交客户');
	                }
					return json_return('T','','转交成功');
            	}else{
            		return json_return('F','500','转交失败');
            	}
	        }else{
	            return json_return('F','10000','转交的商户不存在');
	        }
        }else{
            return json_return('F','500','请求错误');
        }
    }
}