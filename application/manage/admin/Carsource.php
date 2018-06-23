<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class Carsource extends Admin
{
    //车源列表
    public function index(){
        //获取筛选参数
        $filter=[
            'sn'=>input('param.sn',''),
            'audit'=>input('param.audit',''),
            'brand_id'=>input('param.brand_id',''),
            'serie_id'=>input('param.serie_id',''),
            'car_id'=>input('param.car_id',''),
            'shop_name'=>input('param.shop_name',''),
            'merchant_sn'=>input('param.merchant_sn',''),
            'audit_at_start'=>input('param.audit_at_start',''),
            'audit_at_end'=>input('param.audit_at_end',''),
            'stock_state'=>input('param.stock_state',''),
        ];
        $filter=fortrim($filter);
        //整理筛选参数
        $map=[];
        if($filter['sn']!==''){
            $map['a.sn']=['like','%'.$filter['sn'].'%'];
        }
        if($filter['audit']!==''){
            $map['a.audit']=$filter['audit'];
        }
        if($filter['brand_id']!==''){
            $map['a.brand_id']=$filter['brand_id'];
            $serie=db('series')->field('id,p_chexi_id,p_chexi')->where(['p_pinpai_id'=>$filter['brand_id'],'p_chexi_id'=>['neq',''],'p_chexi'=>['neq','']])->select();
        }else{
            $serie=[];
        }
        if($filter['serie_id']!==''){
            $map['a.serie_id']=$filter['serie_id'];
            $car=db('cars')->field('id,p_pinpai,p_chexi,p_chexing_id,p_chexingmingcheng')->where(['p_chexi_id'=>$filter['serie_id'],'p_chexing_id'=>['neq',''],'p_chexingmingcheng'=>['neq','']])->select();
            foreach ($car as $k => $v) {
                $car[$k]['p_chexingmingcheng_jx']=str_replace([$v['p_pinpai'],$v['p_chexi']], ['',''], $v['p_chexingmingcheng']);
            }
        }else{
            $car=[];
        }
        if($filter['car_id']!==''){
            $map['a.car_id']=$filter['car_id'];
        }
        if($filter['shop_name']!==''){
            $map['c.shop_name']=['like','%'.$filter['shop_name'].'%'];
        }
        if($filter['merchant_sn']!==''){
            $map['c.sn']=['like','%'.$filter['merchant_sn'].'%'];
        }
        $filter_at['audit_at_start']=$filter['audit_at_start'].' 00:00:00';
        $filter_at['audit_at_end']=$filter['audit_at_end'].' 23:59:59';
        if($filter['audit_at_start']!=='' && $filter['audit_at_end']!==''){
            $map['a.audit_at']=['between time',[$filter_at['audit_at_start'],$filter_at['audit_at_end']]];
        }elseif($filter['audit_at_start']!=='' && $filter['audit_at_end']===''){
            $map['a.audit_at']=['>= time',$filter_at['audit_at_start']];
        }elseif($filter['audit_at_start']==='' && $filter['audit_at_end']!==''){
            $map['a.audit_at']=['<= time',$filter_at['audit_at_end']];
        }
        if($filter['stock_state']!==''){
            $map['a.stock_state']=$filter['stock_state'];
        }
        //车商
        $ismerchant=ismerchant();
        if($ismerchant){
            $map['c.id']=$ismerchant;
        }
        $order=input('param.order','a.audit_at desc');
        $order=str_replace('+', ' ', $order);
        //查出数据
        $object=db('car_sources')->alias('a')->field('a.id,a.name,a.sn,a.brand_id,a.serie_id,a.car_id,a.plate_province_id,a.plate_city_id,a.first_plate_at,a.mileage,a.price,a.imgs,a.stock_state,a.audit,a.audit_at,a.created_at,b.username admin_name,c.shop_name')->join('admin_user b','a.runner_id=b.id','LEFT')->join('merchants c','a.merchant_id=c.id','LEFT')->where($map)->order($order)->paginate(10);
        // 获取分页显示
        $page = $object->render();
        $data_all = json_decode(json_encode($object),TRUE);
        $data=$data_all['data'];
        //处理数据
        foreach ($data as $key => $value) {
            $data[$key]['created_at_str']=date('Y-m-d H:i',$value['created_at']);
            $data[$key]['audit_at_str']=date('Y-m-d H:i',$value['audit_at']);
            $data[$key]['price']=number_format($value['price']/100,2,'.','');
            $data[$key]['main_img']=explode(',',$value['imgs'])[0];
            $data[$key]['reservoir_age']=ceil((time()-$value['audit_at'])/(24*60*60));
            $data[$key]['first_plate_year']=explode('-',$value['first_plate_at'])[0];
            $data[$key]['region_one_text']=region_text([$value['plate_province_id'],$value['plate_city_id']],false);
        }
        //获取品牌
        $brand=db('brands')->field('id,p_pinpai_id,p_pinpai')->where(['is_show'=>'1'])->select();
        //模板赋值
        $this->assign([
            'filter'=>$filter,
            'order'=>$order,
            'data'=>$data,
            'page'=>$page,
            'brand'=>$brand,
            'serie'=>$serie,
            'car'=>$car,
        ]);
        //渲染模板
        return $this->fetch();
    }
    //发布车源
	public function add(){  
        $now=time();
        // 保存数据
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $data=fortrim($data);
            //验证
            if(isset($data['cert_imgs']) && $data['cert_imgs']!=[]){
                $cert_imgs_count=count($data['cert_imgs']);
                if($cert_imgs_count>5){
                    return json_return('F','1018','证件图片最多上传5张');
                }
            }
            if($data['vin_no']===''){
                return json_return('F','1001','车架号必填');
            }
            if(!preg_match('/^[A-Z0-9]{1,34}$/',$data['vin_no'])) {
                return json_return('F','1001','车架号允许大写字母和数字组合，字符长度：34个字符，例WDBGP57B6PB127810');
            }
            if($data['brand_id']=='-1'){
                return json_return('F','1002','品牌必选');
            }
            if($data['serie_id']=='-1'){
                return json_return('F','1003','车系必选');
            }
            if($data['car_id']=='-1'){
                return json_return('F','1004','车型必选');
            }
            if($data['install_config']!==''){
                if(mb_strlen($data['install_config'],'utf8')>1000) {
                    return json_return('F','1005','加装配置最多1000个字');
                }
            }
            if($data['price']===''){
                return json_return('F','1006','价格必填');
            }
            if(!preg_match('/^[0-9]+(\.\d{1,2})?$/',$data['price'])) {
                return json_return('F','1006','价格只允许输入数字与符号. 格式：XXX.XX，两位小数');
            }
            if($data['color']===''){
                return json_return('F','1007','车身颜色必选');
            }
            if(!isset($data['is_oncard']) || $data['is_oncard']===''){
                return json_return('F','1008','是否上牌必选');
            }
            if(!isset($data['maintain']) || $data['maintain']===''){
                return json_return('F','1009','定期保养必选');
            }
            if($data['mileage']===''){
                return json_return('F','1010','表显里程必填');
            }
            if(!preg_match('/^[\d]{1}(\.\d{1})?$/',$data['mileage'])) {
                return json_return('F','1010','表显里程只允许输入数字与符号. 格式：X.X');
            }
            if($data['mileage']==0){
                return json_return('F','1010','表显里程需大于0');
            }
            if($data['first_plate_at']===''){
                return json_return('F','1011','首次上牌时间必选');
            }
            if($data['guid_price']!==''){
                if(!preg_match('/^[0-9]+(\.\d{1,2})?$/',$data['guid_price'])) {
                    return json_return('F','1012','新手指导价只允许输入数字与符号. 格式：XXX.XX，两位小数');
                }
            }
            if($data['transfer_num']!==''){
                if(!preg_match('/^[0-9]+$/',$data['transfer_num'])) {
                    return json_return('F','1013','过户次数只允许输入数字');
                }
            }
            if($data['key_num']!==''){
                if(!preg_match('/^[0-9]+$/',$data['key_num'])) {
                    return json_return('F','1014','钥匙数量只允许输入数字');
                }
            }
            if($data['car_condition']===''){
                return json_return('F','1015','车况介绍必填');
            }
            if(mb_strlen($data['car_condition'],'utf8')>1000) {
                return json_return('F','1015','车况介绍最多1000个字');
            }
            if(!isset($data['imgs']) || $data['imgs']==[]){
                return json_return('F','1016','车源图片必传');
            }
            $imgs_count=count($data['imgs']);
            if($imgs_count>15 || $imgs_count<4){
                return json_return('F','1016','车源图片最少上传4张，最多上传15张');
            }
            if(mb_strlen($data['check_result'],'utf8')>1000) {
                return json_return('F','1017','车源检测结论最多1000个字');
            }
            //处理多级选项
            if(isset($data['option_ids'])){
                $option_ids=$data['option_ids'];
            }else{
                $option_ids=[];
            }
            $new_option_ids=[];
            foreach ($option_ids as $k => $v) {
                $option=db('check_report_options')->field('id,level,parent_id')->where('id',$v)->where('level','in','1,2,3')->find();
                if($option){
                    if($option['level']=='3'){
                        $p_option=db('check_report_options')->field('id,level,parent_id')->where(['level'=>'2','id'=>$option['parent_id']])->find();
                        if($p_option){
                            $p_o=db('check_report_options')->field('id,level,parent_id')->where(['level'=>'1','id'=>$p_option['parent_id']])->find();
                            if($p_o){
                                $new_option_ids[]=$v;
                                $new_option_ids[]=$p_option['id'];
                                $new_option_ids[]=$p_o['id'];
                            }
                        }
                    }
                }
            }
            $new_option_ids=array_unique($new_option_ids);
            //处理数据
            $insert['cert_imgs']=(isset($data['cert_imgs']) && $data['cert_imgs']!=[])?implode(',', $data['cert_imgs']):'';
            $insert['vin_no']=$data['vin_no'];
            $insert['brand_id']=$data['brand_id'];
            $insert['serie_id']=$data['serie_id'];
            $insert['car_id']=$data['car_id'];
            $insert['install_config']=$data['install_config'];
            $insert['price']=$data['price']*100;
            $insert['color']=$data['color'];
            $insert['is_oncard']=$data['is_oncard'];
            $insert['maintain']=$data['maintain'];
            $insert['plate_province_id']=$data['plate_province_id'];
            $insert['plate_city_id']=$data['plate_city_id'];
            $insert['mileage']=number_format($data['mileage'],1,".","");
            $insert['first_plate_at']=$data['first_plate_at'];
            $insert['year_check_at']=$data['year_check_at'];
            $insert['insurance_at']=$data['insurance_at'];
            $insert['out_factory_at']=$data['out_factory_at'];
            $insert['guid_price']=$data['guid_price']*100;
            $insert['transfer_num']=$data['transfer_num'];
            $insert['key_num']=$data['key_num'];
            $insert['inner_color']=$data['inner_color'];
            $insert['car_condition']=$data['car_condition'];
            $insert['imgs']=implode(',', $data['imgs']);
            $insert['check_result']=$data['check_result'];
            $insert['option_ids']=implode(',', $new_option_ids);
            $insert['stock_state']=1;
            $insert['created_at']=$now;
            $insert['audit']=1;
            $insert['audit_at']=$now;
            $ismerchant=ismerchant();
            $insert['merchant_id']=intval($ismerchant);
            $insert['runner_id']=UID;
            $car=db('cars')->field('p_pinpai,p_chexi,p_chexingmingcheng,p_pailiang_ml')->where('p_chexing_id',$data['car_id'])->find();
            if(strpos($car['p_chexingmingcheng'],$car['p_chexi']) !== false){ 
                if(strpos($car['p_chexingmingcheng'],$car['p_pinpai']) !== false){
                    $car_name=$car['p_chexingmingcheng'];
                }else{
                    $car_name=$car['p_pinpai'].' '.$car['p_chexingmingcheng'];
                }
            }else{
                if(strpos($car['p_chexingmingcheng'],$car['p_pinpai']) !== false){
                    $car['p_chexingmingcheng']=str_replace($car['p_pinpai'],'',$car['p_chexingmingcheng']);
                    $car_name=$car['p_pinpai'].' '.$car['p_chexi'].' '.$car['p_chexingmingcheng'];
                }else{
                    $car_name=$car['p_pinpai'].' '.$car['p_chexi'].' '.$car['p_chexingmingcheng'];
                } 
            }
            $insert['name']=$car_name;
            $insert['displacement']=$car['p_pailiang_ml'];
            $insert_id=db('car_sources')->insertGetId($insert);
            //入库
            if ($insert_id>0) {
                db('car_sources')->where('id',$insert_id)->update(['sn'=>'HC'.date('Ymd').str_pad($insert_id,3,"0",STR_PAD_LEFT)]);
                record_log(request()->module(),request()->controller(),'发布车源');
                return json_return('T','','发布车源成功');
            } else {
                return json_return('F','500','发布车源失败');
            }
        }
		//获取检测报告配置项
		$option=db('check_report_options')->field('id,name,parent_id')->where('level','in','1,2,3')->order('sort asc')->select();
		$option=get_arr_tree($option);
		//获取颜色配置
		$colorpick=config('colorpick');
        //获取中国省份
        $province=db('regions')->field('id,name')->where(['parent_id'=>'1','level'=>'1'])->order('sort asc')->select();
        //获取品牌
        $brand=db('brands')->field('id,p_pinpai_id,p_pinpai')->where(['is_show'=>'1'])->select();
        //模板赋值
        $this->assign([
            'province'=>$province,
            'colorpick'=>$colorpick,
            'brand'=>$brand,
            'option'=>$option,
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
            $car_source=db('car_sources')->find($data['id']);
            if(!$car_source){
                return json_return('F','500','请求错误');
            }
            $ismerchant=ismerchant();
            if($ismerchant){
                if($car_source['merchant_id']!=$ismerchant){
                    return json_return('F','500','请求错误');
                }
            }
            //验证
            if(isset($data['cert_imgs']) && $data['cert_imgs']!=[]){
                $cert_imgs_count=count($data['cert_imgs']);
                if($cert_imgs_count>5){
                    return json_return('F','1018','证件图片最多上传5张');
                }
            }
            if($data['vin_no']===''){
                return json_return('F','1001','车架号必填');
            }
            if(!preg_match('/^[A-Z0-9]{1,34}$/',$data['vin_no'])) {
                return json_return('F','1001','车架号允许大写字母和数字组合，字符长度：34个字符，例WDBGP57B6PB127810');
            }
            if($data['brand_id']=='-1'){
                return json_return('F','1002','品牌必选');
            }
            if($data['serie_id']=='-1'){
                return json_return('F','1003','车系必选');
            }
            if($data['car_id']=='-1'){
                return json_return('F','1004','车型必选');
            }
            if($data['install_config']!==''){
                if(mb_strlen($data['install_config'],'utf8')>1000) {
                    return json_return('F','1005','加装配置最多1000个字');
                }
            }
            if($data['price']===''){
                return json_return('F','1006','价格必填');
            }
            if(!preg_match('/^[0-9]+(\.\d{1,2})?$/',$data['price'])) {
                return json_return('F','1006','价格只允许输入数字与符号. 格式：XXX.XX，两位小数');
            }
            if($data['color']===''){
                return json_return('F','1007','车身颜色必选');
            }
            if(!isset($data['is_oncard']) || $data['is_oncard']===''){
                return json_return('F','1008','是否上牌必选');
            }
            if(!isset($data['maintain']) || $data['maintain']===''){
                return json_return('F','1009','定期保养必选');
            }
            if($data['mileage']===''){
                return json_return('F','1010','表显里程必填');
            }
            if(!preg_match('/^[\d]{1}(\.\d{1})?$/',$data['mileage'])) {
                return json_return('F','1010','表显里程只允许输入数字与符号. 格式：X.X');
            }
            if($data['mileage']==0){
                return json_return('F','1010','表显里程需大于0');
            }
            if($data['first_plate_at']===''){
                return json_return('F','1011','首次上牌时间必选');
            }
            if($data['guid_price']!==''){
                if(!preg_match('/^[0-9]+(\.\d{1,2})?$/',$data['guid_price'])) {
                    return json_return('F','1012','新手指导价只允许输入数字与符号. 格式：XXX.XX，两位小数');
                }
            }
            if($data['transfer_num']!==''){
                if(!preg_match('/^[0-9]+$/',$data['transfer_num'])) {
                    return json_return('F','1013','过户次数只允许输入数字');
                }
            }
            if($data['key_num']!==''){
                if(!preg_match('/^[0-9]+$/',$data['key_num'])) {
                    return json_return('F','1014','钥匙数量只允许输入数字');
                }
            }
            if($data['car_condition']===''){
                return json_return('F','1015','车况介绍必填');
            }
            if(mb_strlen($data['car_condition'],'utf8')>1000) {
                return json_return('F','1015','车况介绍最多1000个字');
            }
            if(!isset($data['imgs']) || $data['imgs']==[]){
                return json_return('F','1016','车源图片必传');
            }
            $imgs_count=count($data['imgs']);
            if($imgs_count>15 || $imgs_count<4){
                return json_return('F','1016','车源图片最少上传4张，最多上传15张');
            }
            if(mb_strlen($data['check_result'],'utf8')>1000) {
                return json_return('F','1017','车源检测结论最多1000个字');
            }
            //处理多级选项
            if(isset($data['option_ids'])){
                $option_ids=$data['option_ids'];
            }else{
                $option_ids=[];
            }
            $new_option_ids=[];
            foreach ($option_ids as $k => $v) {
                $option=db('check_report_options')->field('id,level,parent_id')->where('id',$v)->where('level','in','1,2,3')->find();
                if($option){
                    if($option['level']=='3'){
                        $p_option=db('check_report_options')->field('id,level,parent_id')->where(['level'=>'2','id'=>$option['parent_id']])->find();
                        if($p_option){
                            $p_o=db('check_report_options')->field('id,level,parent_id')->where(['level'=>'1','id'=>$p_option['parent_id']])->find();
                            if($p_o){
                                $new_option_ids[]=$v;
                                $new_option_ids[]=$p_option['id'];
                                $new_option_ids[]=$p_o['id'];
                            }
                        }
                    }
                }
            }
            $new_option_ids=array_unique($new_option_ids);
            //处理数据
            $update['cert_imgs']=(isset($data['cert_imgs']) && $data['cert_imgs']!=[])?implode(',', $data['cert_imgs']):'';
            $update['vin_no']=$data['vin_no'];
            $update['brand_id']=$data['brand_id'];
            $update['serie_id']=$data['serie_id'];
            $update['car_id']=$data['car_id'];
            $update['install_config']=$data['install_config'];
            $update['price']=$data['price']*100;
            $update['color']=$data['color'];
            $update['is_oncard']=$data['is_oncard'];
            $update['maintain']=$data['maintain'];
            $update['plate_province_id']=$data['plate_province_id'];
            $update['plate_city_id']=$data['plate_city_id'];
            $update['mileage']=number_format($data['mileage'],1,".","");
            $update['first_plate_at']=$data['first_plate_at'];
            $update['year_check_at']=$data['year_check_at'];
            $update['insurance_at']=$data['insurance_at'];
            $update['out_factory_at']=$data['out_factory_at'];
            $update['guid_price']=$data['guid_price']*100;
            $update['transfer_num']=$data['transfer_num'];
            $update['key_num']=$data['key_num'];
            $update['inner_color']=$data['inner_color'];
            $update['car_condition']=$data['car_condition'];
            $update['imgs']=implode(',', $data['imgs']);
            $update['check_result']=$data['check_result'];
            $update['option_ids']=implode(',', $new_option_ids);
            $car=db('cars')->field('p_pinpai,p_chexi,p_chexingmingcheng,p_pailiang_ml')->where('p_chexing_id',$data['car_id'])->find();
            if(strpos($car['p_chexingmingcheng'],$car['p_chexi']) !== false){ 
                if(strpos($car['p_chexingmingcheng'],$car['p_pinpai']) !== false){
                    $car_name=$car['p_chexingmingcheng'];
                }else{
                    $car_name=$car['p_pinpai'].' '.$car['p_chexingmingcheng'];
                }
            }else{
                if(strpos($car['p_chexingmingcheng'],$car['p_pinpai']) !== false){
                    $car['p_chexingmingcheng']=str_replace($car['p_pinpai'],'',$car['p_chexingmingcheng']);
                    $car_name=$car['p_pinpai'].' '.$car['p_chexi'].' '.$car['p_chexingmingcheng'];
                }else{
                    $car_name=$car['p_pinpai'].' '.$car['p_chexi'].' '.$car['p_chexingmingcheng'];
                } 
            }
            $update['name']=$car_name;
            $update['displacement']=$car['p_pailiang_ml'];
            $rt=db('car_sources')->where('id',$data['id'])->update($update);
            //入库
            if ($rt!==false) {
                if($rt>0){
                    record_log(request()->module(),request()->controller(),'修改车源');
                } 
                return json_return('T','','修改车源成功');
            } else {
                return json_return('F','500','修改车源失败');
            }
        }
        $car_source=db('car_sources')->find($id);
        if(!$car_source){
            return $this->error('请求错误');
        }
        $ismerchant=ismerchant();
        if($ismerchant){
            if($car_source['merchant_id']!=$ismerchant){
                return $this->error('请求错误');
            }
        }
        //处理数据
        $car_source['created_at_str']=date('Y-m-d H:i',$car_source['created_at']);
        $car_source['audit_at_str']=date('Y-m-d H:i',$car_source['audit_at']);
        $car_source['price']=number_format($car_source['price']/100,2,'.','');
        $car_source['guid_price']=number_format($car_source['guid_price']/100,2,'.','');
        $car_source['option_ids']=explode(',', $car_source['option_ids']);
        $car_source['install_config_len']=mb_strlen($car_source['install_config'],'utf8');
        $car_source['car_condition_len']=mb_strlen($car_source['car_condition'],'utf8');
        $car_source['check_result_len']=mb_strlen($car_source['check_result'],'utf8');
        if($car_source['cert_imgs']===''){
            $car_source['cert_imgs']=[];
        }else{
            $car_source['cert_imgs']=explode(',', $car_source['cert_imgs']);
        }
        if($car_source['imgs']===''){
            $car_source['imgs']=[];
        }else{
            $car_source['imgs']=explode(',', $car_source['imgs']);
        }
        //获取检测报告配置项
        $option=db('check_report_options')->field('id,name,parent_id')->where('level','in','1,2,3')->order('sort asc')->select();
        $option=get_arr_tree($option);
        //获取颜色配置
        $colorpick=config('colorpick');
        //获取中国地区
        $province=db('regions')->field('id,name')->where(['parent_id'=>'1','level'=>'1'])->order('sort asc')->select();
        $city=db('regions')->field('id,name')->where(['parent_id'=>$car_source['plate_province_id'],'level'=>'2'])->order('sort asc')->select();
        //获取车型
        $brand=db('brands')->field('id,p_pinpai_id,p_pinpai')->where(['is_show'=>'1'])->select();
        $serie=db('series')->field('id,p_chexi_id,p_chexi')->where(['p_pinpai_id'=>$car_source['brand_id'],'is_show'=>'1'])->select();
        $car=db('cars')->field('id,p_pinpai,p_chexi,p_chexing_id,p_chexingmingcheng')->where(['p_chexi_id'=>$car_source['serie_id'],'is_show'=>'1'])->select();
        foreach ($car as $k => $v) {
            $car[$k]['p_chexingmingcheng_jx']=str_replace([$v['p_pinpai'],$v['p_chexi']], ['',''], $v['p_chexingmingcheng']);
        }
        //模板赋值
        $this->assign([
            'province'=>$province,
            'city'=>$city,
            'brand'=>$brand,
            'serie'=>$serie,
            'car'=>$car,
            'colorpick'=>$colorpick,
            'option'=>$option,
            'car_source'=>$car_source,
        ]);
        //渲染模板
        return $this->fetch();
    }
    //详情
    public function look($id=''){
        $car_source=db('car_sources')->where('id',$id)->find();
        if($car_source){
            $ismerchant=ismerchant();
            if($ismerchant){
                if($car_source['merchant_id']!=$ismerchant){
                    return $this->error('请求错误');
                }
            }
            $car_source['region_text']=region_text([$car_source['plate_province_id'],$car_source['plate_city_id']]);
            $car_source['created_at_str']=date('Y-m-d H:i',$car_source['created_at']);
            $car_source['audit_at_str']=date('Y-m-d H:i',$car_source['audit_at']);
            $car_source['price']=number_format($car_source['price']/100,2,'.','');
            $car_source['guid_price']=number_format($car_source['guid_price']/100,2,'.','');
            $car_source['option']=db('check_report_options')->field('id,name,parent_id')->where('level','in','1,2,3')->where('id','in',$car_source['option_ids'])->order('sort asc')->select();
            $car_source['option']=get_arr_tree($car_source['option']);
            $car_source['admin_name']=(string)db('admin_user')->where('id',$car_source['runner_id'])->value('username');
            if($car_source['cert_imgs']===''){
                $car_source['cert_imgs']=[];
            }else{
                $car_source['cert_imgs']=explode(',', $car_source['cert_imgs']);
            }
            if($car_source['imgs']===''){
                $car_source['imgs']=[];
            }else{
                $car_source['imgs']=explode(',', $car_source['imgs']);
            }
            //获取颜色配置
            $colorpick=config('colorpick');
            //模板赋值
            $this->assign([
                'car_source'=>$car_source,
                'colorpick'=>$colorpick,
            ]);
            //渲染模板
            return $this->fetch();
        }else{
            return $this->error('请求错误');
        }
    }
    //审核通过
    public function enable($id=''){
        if ($this->request->isPost()) {
            $ids=input('param.id');
            $ids=explode(',',$ids);
            $car_source=db('car_sources')->where('id','in',$ids)->where('audit','0')->select();
            $ismerchant=ismerchant();
            foreach ($car_source as $k => $v) {
                if($ismerchant){
                    if($v['merchant_id']!=$ismerchant){
                        unset($id[$k]);
                    }
                }
            }
            $ids=implode(',',$ids);
            $rt=db('car_sources')->where('id','in',$ids)->where('audit','0')->update(['audit'=>'1']);
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'车源审核通过');
                return json_return('T','200','审核通过成功');
            }else{
                return json_return('F','500','审核通过失败');
            }
        }  
        $car_source=db('car_sources')->where('id',$id)->find();
        if($car_source){
            $ismerchant=ismerchant();
            if($ismerchant){
                if($car_source['merchant_id']!=$ismerchant){
                    return json_return('F','500','请求错误');
                }
            }
            $rt=db('car_sources')->where('id',$id)->where('audit','0')->update(['audit'=>'1']);
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'车源审核通过');
                return json_return('T','200','审核通过成功');
            }else{
                return json_return('F','500','审核通过失败');
            }
        }else{
            return json_return('F','500','请求错误');
        }
    }
    //拒绝
    public function disable($id=''){
        if ($this->request->isPost()) {
            $ids=input('param.id');
            $ids=explode(',',$ids);
            $car_source=db('car_sources')->where('id','in',$ids)->where('audit','0')->select();
            $ismerchant=ismerchant();
            foreach ($car_source as $k => $v) {
                if($ismerchant){
                    if($v['merchant_id']!=$ismerchant){
                        unset($id[$k]);
                    }
                }
            }
            $ids=implode(',',$ids);
            $rt=db('car_sources')->where('id','in',$ids)->where('audit','0')->update(['audit'=>'2']);
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'车源拒绝');
                return json_return('T','200','拒绝成功');
            }else{
                return json_return('F','500','拒绝失败');
            }
        }  
        $car_source=db('car_sources')->where('id',$id)->find();
        if($car_source){
            $ismerchant=ismerchant();
            if($ismerchant){
                if($car_source['merchant_id']!=$ismerchant){
                    return json_return('F','500','请求错误');
                }
            }
            $rt=db('car_sources')->where('id',$id)->where('audit','0')->update(['audit'=>'2']);
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'车源拒绝');
                return json_return('T','200','拒绝成功');
            }else{
                return json_return('F','500','拒绝失败');
            }
        }else{
            return json_return('F','500','请求错误');
        }
    }
    //上架
    public function upstock($id=''){
        $car_source=db('car_sources')->where('id',$id)->find();
        if($car_source){
            $ismerchant=ismerchant();
            if($ismerchant){
                if($car_source['merchant_id']!=$ismerchant){
                    return json_return('F','500','请求错误');
                }
            }
            $rt=db('car_sources')->where('id',$id)->where('stock_state','0')->update(['stock_state'=>'1']);
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'车源上架');
                return json_return('T','200','上架成功');
            }else{
                return json_return('F','500','上架失败');
            }
        }else{
            return json_return('F','500','请求错误');
        }
    }
    //下架
    public function downstock($id=''){
        $car_source=db('car_sources')->where('id',$id)->find();
        if($car_source){
            $ismerchant=ismerchant();
            if($ismerchant){
                if($car_source['merchant_id']!=$ismerchant){
                    return json_return('F','500','请求错误');
                }
            }
            $rt=db('car_sources')->where('id',$id)->where('stock_state','1')->update(['stock_state'=>'0']);
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'车源下架');
                return json_return('T','200','下架成功');
            }else{
                return json_return('F','500','下架失败');
            }
        }else{
            return json_return('F','500','请求错误');
        }
    }
    //退库
    public function outstock($id=''){
        $car_source=db('car_sources')->where('id',$id)->find();
        if($car_source){
            $ismerchant=ismerchant();
            if($ismerchant){
                if($car_source['merchant_id']!=$ismerchant){
                    return json_return('F','500','请求错误');
                }
            }
            $rt=db('car_sources')->where('id',$id)->update(['stock_state'=>'4']);
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'车源退库');
                return json_return('T','200','退库成功');
            }else{
                return json_return('F','500','退库失败');
            }
        }else{
            return json_return('F','500','请求错误');
        }
    }
/*    //打印价签
    public function printig($id=''){
        $car_source=db('car_sources')->where('id',$id)->find();
        if($car_source){
            $ismerchant=ismerchant();
            if($ismerchant){
                if($car_source['merchant_id']!=$ismerchant){
                    return $this->error('请求错误');
                }
            }
            $car_source['attr']=db('cars')->where('p_chexing_id',$car_source['car_id'])->find();
            if($car_source['plate_city_id']>0){
                $car_source['region_text']=db('regions')->where('id',$car_source['plate_city_id'])->value('name');
            }else if($car_source['plate_province_id']>0){
                $car_source['region_text']=db('regions')->where('id',$car_source['plate_province_id'])->value('name');
            }else{
                $car_source['region_text']='';
            }
            $car_source['created_at_str']=date('Y-m-d H:i',$car_source['created_at']);
            $car_source['audit_at_str']=date('Y-m-d H:i',$car_source['audit_at']);
            $car_source['price']=number_format($car_source['price']/100,2,'.','');
            $car_source['guid_price']=number_format($car_source['guid_price']/100,2,'.','');
            if($car_source['imgs']===''){
                $car_source['imgs']=[];
            }else{
                $car_source['imgs']=explode(',', $car_source['imgs']);
            }
            $car=db('cars')->where(['p_chexing_id'=>$car_source['car_id']])->find();
            $car_attr=db('configs')->where('name','car_attr_category')->value('value');
            $car_attr=json_decode($car_attr,true);
            $wb_attr=[];
            $waibu=[];
            foreach ($car_attr[4]['attr'] as $k => $v) {
                if($car[$k]=='●' || $car[$k]=='前●/后●' || $car[$k]=='前●/后○' || $car[$k]=='前○/后●' || $car[$k]=='前●/后-' || $car[$k]=='前-/后●'){
                    if($car[$k]=='前●/后○' || $car[$k]=='前●/后-'){
                        $v=str_replace('/后','',$v);
                    }
                    if($car[$k]=='前○/后●' || $car[$k]=='前-/后●'){
                        $v=str_replace('前/','',$v);
                    }
                    if(mb_strlen($v,'utf8')<=7){
                        if(count($wb_attr)>=3){
                            $waibu[]=$v;
                        }else{
                            $wb_attr[]=$v;
                        }
                    }
                }
            }
            $nb_attr=[];
            $neibu=[];
            foreach ($car_attr[5]['attr'] as $k => $v) {
                if($car[$k]=='●' || $car[$k]=='前●/后●' || $car[$k]=='前●/后○' || $car[$k]=='前○/后●' || $car[$k]=='前●/后-' || $car[$k]=='前-/后●'){
                    if($car[$k]=='前●/后○' || $car[$k]=='前●/后-'){
                        $v=str_replace('/后','',$v);
                    }
                    if($car[$k]=='前○/后●' || $car[$k]=='前-/后●'){
                        $v=str_replace('前/','',$v);
                    }
                    if(mb_strlen($v,'utf8')<=7){
                        if(count($nb_attr)>=3){
                            $neibu[]=$v;
                        }else{
                            $nb_attr[]=$v;
                        }
                    }
                }
            }
            $fz_attr=[];
            $fuzhu=[];
            foreach ($car_attr[6]['attr'] as $k => $v) {
                if($car[$k]=='●' || $car[$k]=='前●/后●' || $car[$k]=='前●/后○' || $car[$k]=='前○/后●' || $car[$k]=='前●/后-' || $car[$k]=='前-/后●'){
                    if($car[$k]=='前●/后○' || $car[$k]=='前●/后-'){
                        $v=str_replace('/后','',$v);
                    }
                    if($car[$k]=='前○/后●' || $car[$k]=='前-/后●'){
                        $v=str_replace('前/','',$v);
                    }
                    if(mb_strlen($v,'utf8')<=7){
                        if(count($fz_attr)>=3){
                            $fuzhu[]=$v;
                        }else{
                            $fz_attr[]=$v;
                        }
                    }
                }
            }
            $attr=array_merge($wb_attr,$nb_attr,$fz_attr);
            $count_attr=count($attr);
            if($count_attr<9){
                $attr_yu=array_merge($waibu,$neibu,$fuzhu);
                $yu=array_slice($attr_yu, 0,9-$count_attr);
                $attr=array_merge($attr,$yu);
            }
            $car_source['configs']=$attr;
            //模板赋值
            $p_huanbaobiaozhun_html=$car_source['attr']['p_huanbaobiaozhun']?$car_source['attr']['p_huanbaobiaozhun']:'<span style="color: #ccc;">暂无</span>';
            $p_pailiang_ml_html=$car_source['attr']['p_pailiang_ml']?$car_source['attr']['p_pailiang_ml']:'<span style="color: #ccc;">暂无</span>';
            $region_text_html=$car_source['region_text']?$car_source['region_text']:'<span style="color: #ccc;">暂无</span>';
            $configs_html='';
            foreach ($car_source['configs'] as $k => $v) {
                //$configs_html.="<li>".$v."</li>";
            }
            $host_url=config('finecar.host_url');
            $html=<<<STR
<!DOCTYPE html>
<!--[if IE 9]>         <html class="ie9 no-focus" lang="zh"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-focus" lang="zh"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>后台 | 车源管理 | 打印价签</title>
    <meta name="description" content="">
    <meta name="author" content="caiweiming">
    <meta name="robots" content="noindex, nofollow">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0,user-scalable=0">
    <style>
    @page { size: landscape; }  
    body{padding:0;margin: 0 auto;text-align: center;}
    .print_box{width: 1250px; display: inline-block;}
    .print_box .top{height: 85px;background: #fff;text-align: center;}
    .print_box .top img.img_top{height: 79px;margin: 3px auto;}
    .print_box .con{}
    .print_box .con .t{height: 121px;background: #ffe600;padding:11px 0;overflow: hidden;}
    .print_box .con .t .title{height: 61px;line-height:61px; text-align: center; width: 100%;overflow: hidden;font-size: 40px;font-weight: bold;color: #212425;}
    .print_box .con .m{height: 480px;overflow: hidden;}
    .print_box .con .m .img{height: 480px;width: 700px;float: left;background: #d8d8d8;}
    .print_box .con .m .img img{height: 480px;width: 700px;border:none;}
    .print_box .con .m .neirong{height: 380px;width: 490px;padding: 50px 30px; background: #212425;overflow: hidden;}
    .print_box .con .m .neirong .attr{text-align: left;padding: 50px 0;}
    .print_box .con .m .neirong .attr li{width: 163px;float: left;line-height: 65px;font-size: 20px;overflow: hidden;list-style: none;color: #fff;}
    .print_box .con .b{height: 83px;background: #ffe600;padding: 30px 1%;overflow: hidden;text-align: center;}
    .print_box .con .b table.table{max-width: 98%;display: inline-block;height: 83px;overflow: hidden;}
    .print_box .con .b table.table th{height:50px;line-height: 50px;font-size: 20px;text-align: left;color: #212425;padding: 0 30px;border-right: 1px solid #9d900f;overflow: hidden;}
    .print_box .con .b table.table td{height:33px;line-height: 33px;font-size: 18px;text-align: left;color: #212425;padding: 0 30px;border-right: 1px solid #9d900f;overflow: hidden;}
    </style>
</head>
<body>
<div class="print_box">
    <div class="top">
        <img src="{$host_url}/static/admin/img/finecar/print_top.jpg" class="img_top">
    </div>
    <div class="con">
        <div class="t">
            <div class="title">{$car_source['attr']['p_pinpai']}</div>
            <div class="title" style="font-size: 34px;">{$car_source['name']}</div>
        </div>
        <div class="m">
            <div class="img">
                <img src="{$car_source['imgs'][0]}">
            </div>
            <div class="neirong">
                <div style="text-align: left;">
                    <div style="display: table-cell; max-width: 365px;color: #ffe600;font-size: 60px;font-weight: bold;overflow: hidden;vertical-align: bottom;height:86px;">{$car_source['price']}&nbsp;</div>
                    <div style="display: table-cell;vertical-align: bottom;">
                        <img src="{$host_url}/static/admin/img/finecar/print_price.png" style="width: 60px;height: 30px;"><br>
                        <span style="color: #ffe600;font-size: 30px;font-weight: bold;">万元</span>
                    </div>
                </div>
                <div class="attr">
                    {$configs_html}
                </div>
            </div>
        </div>
        <div class="b">
            <table class="table" cellpadding="0" cellspacing="0">
                <tr>
                    <th>{$car_source['mileage']}万公里</th>
                    <th>{$car_source['transfer_num']}次过户</th>
                    <th>{$p_huanbaobiaozhun_html}</th>
                    <th>{$p_pailiang_ml_html}</th>
                    <th>{$car_source['maintain']}</th>
                    <th>{$car_source['first_plate_at']}</th>
                    <th style="border-right:none;">{$region_text_html}</th>
                </tr>
                <tr>
                    <td>表现里程</td>
                    <td>过户次数</td>
                    <td>排放标准</td>
                    <td>排量</td>
                    <td>定期保养</td>
                    <td>首次上牌</td>
                    <td style="border-right:none;">上牌地点</td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>
STR;
            import('tcpdf.tcpdf', EXTEND_PATH,'.php');
            date_default_timezone_set('Asia/Shanghai'); 
            $pdf = new \TCPDF('P', 'mm', 'A4', true, 'UTF-8', false); 
$pdf->AddPage();  
$pdf->lastPage();  $pdf->Ln(4);  

            $pdf->writeHTMLCell(0, 0, '', '', $html, 0, 1, 0, true, '', true);   
            $pdf->Output('report_new.pdf', 'D');        
        }else{
            return $this->error('请求错误');
        }
    }*/
    //打印价签
    public function printig($id=''){
        $car_source=db('car_sources')->where('id',$id)->find();
        if($car_source){
            $ismerchant=ismerchant();
            if($ismerchant){
                if($car_source['merchant_id']!=$ismerchant){
                    return $this->error('请求错误');
                }
            }
            $car_source['attr']=db('cars')->where('p_chexing_id',$car_source['car_id'])->find();
            if($car_source['plate_city_id']>0){
                $car_source['region_text']=db('regions')->where('id',$car_source['plate_city_id'])->value('name');
            }else if($car_source['plate_province_id']>0){
                $car_source['region_text']=db('regions')->where('id',$car_source['plate_province_id'])->value('name');
            }else{
                $car_source['region_text']='';
            }
            $car_source['created_at_str']=date('Y-m-d H:i',$car_source['created_at']);
            $car_source['audit_at_str']=date('Y-m-d H:i',$car_source['audit_at']);
            $car_source['price']=number_format($car_source['price']/100,2,'.','');
            $car_source['guid_price']=number_format($car_source['guid_price']/100,2,'.','');
            if($car_source['imgs']===''){
                $car_source['imgs']=[];
            }else{
                $car_source['imgs']=explode(',', $car_source['imgs']);
            }
            $car=db('cars')->where(['p_chexing_id'=>$car_source['car_id']])->find();
            $car_attr=db('configs')->where('name','car_attr_category')->value('value');
            $car_attr=json_decode($car_attr,true);
            $wb_attr=[];
            $waibu=[];
            foreach ($car_attr[4]['attr'] as $k => $v) {
                if($car[$k]=='●' || $car[$k]=='前●/后●' || $car[$k]=='前●/后○' || $car[$k]=='前○/后●' || $car[$k]=='前●/后-' || $car[$k]=='前-/后●'){
                    if($car[$k]=='前●/后○' || $car[$k]=='前●/后-'){
                        $v=str_replace('/后','',$v);
                    }
                    if($car[$k]=='前○/后●' || $car[$k]=='前-/后●'){
                        $v=str_replace('前/','',$v);
                    }
                    if(mb_strlen($v,'utf8')<=7){
                        if(count($wb_attr)>=3){
                            $waibu[]=$v;
                        }else{
                            $wb_attr[]=$v;
                        }
                    }
                }
            }
            $nb_attr=[];
            $neibu=[];
            foreach ($car_attr[5]['attr'] as $k => $v) {
                if($car[$k]=='●' || $car[$k]=='前●/后●' || $car[$k]=='前●/后○' || $car[$k]=='前○/后●' || $car[$k]=='前●/后-' || $car[$k]=='前-/后●'){
                    if($car[$k]=='前●/后○' || $car[$k]=='前●/后-'){
                        $v=str_replace('/后','',$v);
                    }
                    if($car[$k]=='前○/后●' || $car[$k]=='前-/后●'){
                        $v=str_replace('前/','',$v);
                    }
                    if(mb_strlen($v,'utf8')<=7){
                        if(count($nb_attr)>=3){
                            $neibu[]=$v;
                        }else{
                            $nb_attr[]=$v;
                        }
                    }
                }
            }
            $fz_attr=[];
            $fuzhu=[];
            foreach ($car_attr[6]['attr'] as $k => $v) {
                if($car[$k]=='●' || $car[$k]=='前●/后●' || $car[$k]=='前●/后○' || $car[$k]=='前○/后●' || $car[$k]=='前●/后-' || $car[$k]=='前-/后●'){
                    if($car[$k]=='前●/后○' || $car[$k]=='前●/后-'){
                        $v=str_replace('/后','',$v);
                    }
                    if($car[$k]=='前○/后●' || $car[$k]=='前-/后●'){
                        $v=str_replace('前/','',$v);
                    }
                    if(mb_strlen($v,'utf8')<=7){
                        if(count($fz_attr)>=3){
                            $fuzhu[]=$v;
                        }else{
                            $fz_attr[]=$v;
                        }
                    }
                }
            }
            $attr=array_merge($wb_attr,$nb_attr,$fz_attr);
            $count_attr=count($attr);
            if($count_attr<9){
                $attr_yu=array_merge($waibu,$neibu,$fuzhu);
                $yu=array_slice($attr_yu, 0,9-$count_attr);
                $attr=array_merge($attr,$yu);
            }
            $car_source['configs']=$attr;
            //模板赋值
            $this->assign([
                'car_source'=>$car_source,
            ]);
            //渲染模板
            return $this->fetch();
        }else{
            return $this->error('请求错误');
        }
    }
}