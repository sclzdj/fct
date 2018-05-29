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
            'model_id'=>input('param.model_id',''),
            'shop_name'=>input('param.shop_name',''),
            'merchant_sn'=>input('param.merchant_sn',''),
            'audit_at_start'=>input('param.audit_at_start',''),
            'audit_at_end'=>input('param.audit_at_end',''),
            'stock_state'=>input('param.stock_state',''),
        ];
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
        if($filter['merchant_sn']!==''){
            $map['c.sn']=['like','%'.$filter['merchant_sn'].'%'];
        }
        if($filter['audit_at_start']!=='' && $filter['audit_at_end']!==''){
            $map['a.audit_at']=['between time',[$filter['audit_start'],$filter['audit_at_end']]];
        }elseif($filter['audit_at_start']!=='' && $filter['audit_at_end']===''){
            $map['a.audit_at']=['>= time',$filter['audit_at_start']];
        }elseif($filter['audit_at_start']==='' && $filter['audit_at_end']!==''){
            $map['a.audit_at']=['<= time',$filter['audit_at_end']];
        }
        if($filter['stock_state']!==''){
            $map['a.stock_state']=$filter['stock_state'];
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
            $data[$key]['created_at_str']=date('Y-m-d H:i',$value['created_at']);
            $data[$key]['audit_at_str']=date('Y-m-d H:i',$value['audit_at']);
            $data[$key]['price']=number_format($value['price'],2,'.','');
            $data[$key]['main_img']=explode(',',$value['imgs'])[0];
            $data[$key]['reservoir_age']=ceil((time()-$value['audit_at'])/(24*60*60));
            $data[$key]['first_plate_year']=explode('-',$value['first_plate_at'])[0];
            $data[$key]['region_one_text']=region_text([$value['plate_province_id'],$value['plate_city_id']],false);
        }
        //模板赋值
        $this->assign([
            'filter'=>$filter,
            'order'=>$order,
            'data'=>$data,
            'page'=>$page,
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
            //验证
            if($data['vin_no']===''){
                return json_return('F','1000','车架号必填');
            }
            if(!preg_match('/^[A-Z0-9]{1,34}$/',$data['vin_no'])) {
                return json_return('F','1000','车架号允许大写字母和数字组合，字符长度：34个字符，例WDBGP57B6PB127810');
            }
            /*if($data['brand_id']===''){
                return json_return('F','1000','车牌必选');
            }
            if($data['serie_id']===''){
                return json_return('F','1000','车系必选');
            }
            if($data['model_id']===''){
                return json_return('F','1000','车型必选');
            }*/
            if($data['install_config']!==''){
                if(mb_strlen($data['install_config'],'utf8')>1000) {
                    return json_return('F','1000','加装配置最多1000个字');
                }
            }
            if($data['price']===''){
                return json_return('F','1000','价格必填');
            }
            if(!preg_match('/^[0-9]+(\.\d{1,2})?$/',$data['price'])) {
                return json_return('F','1000','价格只允许输入数字与符号. 格式：XXX.XX，两位小数');
            }
            if($data['color']===''){
                return json_return('F','1000','车身颜色必选');
            }
            if($data['is_oncard']===''){
                return json_return('F','1000','是否上牌必选');
            }
            if($data['maintain']===''){
                return json_return('F','1000','定期保养必选');
            }
            if($data['mileage']===''){
                return json_return('F','1000','表显里程必填');
            }
            if(!preg_match('/^[\d]{1}(\.\d{1})?$/',$data['mileage'])) {
                return json_return('F','1000','表显里程只允许输入数字与符号. 格式：X.X');
            }
            if($data['mileage']==0){
                return json_return('F','1000','表显里程需大于0');
            }
            if($data['first_plate_at']===''){
                return json_return('F','1000','首次上牌时间必选');
            }
            if($data['guid_price']!==''){
                if(!preg_match('/^[0-9]+(\.\d{1,2})?$/',$data['guid_price'])) {
                    return json_return('F','1000','新手指导价只允许输入数字与符号. 格式：XXX.XX，两位小数');
                }
            }
            if($data['transfer_num']!==''){
                if(!preg_match('/^[0-9]+$/',$data['transfer_num'])) {
                    return json_return('F','1000','过户次数只允许输入数字');
                }
            }
            if($data['key_num']!==''){
                if(!preg_match('/^[0-9]+$/',$data['key_num'])) {
                    return json_return('F','1000','钥匙数量只允许输入数字');
                }
            }
            if($data['car_condition']===''){
                return json_return('F','1000','车况介绍必填');
            }
            if(mb_strlen($data['car_condition'],'utf8')>1000) {
                return json_return('F','1000','车况介绍最多1000个字');
            }
            if(!isset($data['imgs']) || $data['imgs']==[]){
                return json_return('F','1000','车源图片必传');
            }
            $imgs_count=count($data['imgs']);
            if($imgs_count>15 || $imgs_count<4){
                return json_return('F','1000','车源图片最少上传4张，最多上传15张');
            }
            if(mb_strlen($data['check_result'],'utf8')>1000) {
                return json_return('F','1000','车源检测结论最多1000个字');
            }
            //处理多级选项
            $option_ids=$data['option_ids'];
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
            $insert['driving_img']=$data['driving_img'];
            $insert['vin_no']=$data['vin_no'];
            $insert['brand_id']=$data['brand_id'];
            $insert['serie_id']=$data['serie_id'];
            $insert['model_id']=$data['model_id'];
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
            $insert['merchant_id']=intval(ismerchant());
            $insert['runner_id']=UID;
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
		$option=get_arr_tree($option);/*dump($option);die;*/
		//获取颜色配置
		$colorpick=config('colorpick');
        //获取中国省份
        $province=db('regions')->field('id,name')->where(['parent_id'=>'1','level'=>'1'])->order('sort asc')->select();
        //模板赋值
        $this->assign([
            'province'=>$province,
            'colorpick'=>$colorpick,
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
            $car_source=db('car_sources')->find($data['id']);
            if(!$car_source){
                return json_return('F','500','请求错误');
            }
            if(ismerchant()){
                if($car_source['merchant_id']!=ismerchant()){
                    return json_return('F','500','请求错误');
                }
            }
            //验证
            if($data['vin_no']===''){
                return json_return('F','1000','车架号必填');
            }
            if(!preg_match('/^[A-Z0-9]{1,34}$/',$data['vin_no'])) {
                return json_return('F','1000','车架号允许大写字母和数字组合，字符长度：34个字符，例WDBGP57B6PB127810');
            }
            /*if($data['brand_id']===''){
                return json_return('F','1000','车牌必选');
            }
            if($data['serie_id']===''){
                return json_return('F','1000','车系必选');
            }
            if($data['model_id']===''){
                return json_return('F','1000','车型必选');
            }*/
            if($data['install_config']!==''){
                if(mb_strlen($data['install_config'],'utf8')>1000) {
                    return json_return('F','1000','加装配置最多1000个字');
                }
            }
            if($data['price']===''){
                return json_return('F','1000','价格必填');
            }
            if(!preg_match('/^[0-9]+(\.\d{1,2})?$/',$data['price'])) {
                return json_return('F','1000','价格只允许输入数字与符号. 格式：XXX.XX，两位小数');
            }
            if($data['color']===''){
                return json_return('F','1000','车身颜色必选');
            }
            if($data['is_oncard']===''){
                return json_return('F','1000','是否上牌必选');
            }
            if($data['maintain']===''){
                return json_return('F','1000','定期保养必选');
            }
            if($data['mileage']===''){
                return json_return('F','1000','表显里程必填');
            }
            if(!preg_match('/^[\d]{1}(\.\d{1})?$/',$data['mileage'])) {
                return json_return('F','1000','表显里程只允许输入数字与符号. 格式：X.X');
            }
            if($data['mileage']==0){
                return json_return('F','1000','表显里程需大于0');
            }
            if($data['first_plate_at']===''){
                return json_return('F','1000','首次上牌时间必选');
            }
            if($data['guid_price']!==''){
                if(!preg_match('/^[0-9]+(\.\d{1,2})?$/',$data['guid_price'])) {
                    return json_return('F','1000','新手指导价只允许输入数字与符号. 格式：XXX.XX，两位小数');
                }
            }
            if($data['transfer_num']!==''){
                if(!preg_match('/^[0-9]+$/',$data['transfer_num'])) {
                    return json_return('F','1000','过户次数只允许输入数字');
                }
            }
            if($data['key_num']!==''){
                if(!preg_match('/^[0-9]+$/',$data['key_num'])) {
                    return json_return('F','1000','钥匙数量只允许输入数字');
                }
            }
            if($data['car_condition']===''){
                return json_return('F','1000','车况介绍必填');
            }
            if(mb_strlen($data['car_condition'],'utf8')>1000) {
                return json_return('F','1000','车况介绍最多1000个字');
            }
            if(!isset($data['imgs']) || $data['imgs']==[]){
                return json_return('F','1000','车源图片必传');
            }
            $imgs_count=count($data['imgs']);
            if($imgs_count>15 || $imgs_count<4){
                return json_return('F','1000','车源图片最少上传4张，最多上传15张');
            }
            if(mb_strlen($data['check_result'],'utf8')>1000) {
                return json_return('F','1000','车源检测结论最多1000个字');
            }
            //处理多级选项
            $option_ids=$data['option_ids'];
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
            $update['driving_img']=$data['driving_img'];
            $update['vin_no']=$data['vin_no'];
            $update['brand_id']=$data['brand_id'];
            $update['serie_id']=$data['serie_id'];
            $update['model_id']=$data['model_id'];
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
        if(ismerchant()){
            if($car_source['merchant_id']!=ismerchant()){
                return $this->error('请求错误');
            }
        }
        //处理数据
        $car_source['created_at_str']=date('Y-m-d H:i',$car_source['created_at']);
        $car_source['audit_at_str']=date('Y-m-d H:i',$car_source['audit_at']);
        $car_source['price']=number_format($car_source['price'],2,'.','');
        $car_source['guid_price']=number_format($car_source['guid_price'],2,'.','');
        $car_source['option_ids']=explode(',', $car_source['option_ids']);
        $car_source['install_config_len']=mb_strlen($car_source['install_config'],'utf8');
        $car_source['car_condition_len']=mb_strlen($car_source['car_condition'],'utf8');
        $car_source['check_result_len']=mb_strlen($car_source['check_result'],'utf8');
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
        //获取中国省份
        $province=db('regions')->field('id,name')->where(['parent_id'=>'1','level'=>'1'])->order('sort asc')->select();
        $city=db('regions')->field('id,name')->where(['parent_id'=>$car_source['plate_province_id'],'level'=>'2'])->order('sort asc')->select();
        //模板赋值
        $this->assign([
            'province'=>$province,
            'city'=>$city,
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
            if(ismerchant()){
                if($car_source['merchant_id']!=ismerchant()){
                    return $this->error('请求错误');
                }
            }
            $car_source['region_text']=region_text([$car_source['plate_province_id'],$car_source['plate_city_id']]);
            $car_source['created_at_str']=date('Y-m-d H:i',$car_source['created_at']);
            $car_source['audit_at_str']=date('Y-m-d H:i',$car_source['audit_at']);
            $car_source['price']=number_format($car_source['price'],2,'.','');
            $car_source['guid_price']=number_format($car_source['guid_price'],2,'.','');
            $car_source['option']=db('check_report_options')->field('id,name,parent_id')->where('level','in','1,2,3')->where('id','in',$car_source['option_ids'])->order('sort asc')->select();
            $car_source['option']=get_arr_tree($car_source['option']);
            $car_source['admin_name']=(string)db('admin_user')->where('id',$car_source['runner_id'])->value('username');
            if($car_source['imgs']===''){
                $car_source['imgs']=[];
            }else{
                $car_source['imgs']=explode(',', $car_source['imgs']);
            }//获取颜色配置
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
            foreach ($car_source as $k => $v) {
                if(ismerchant()){
                    if($v['merchant_id']!=ismerchant()){
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
            if(ismerchant()){
                if($car_source['merchant_id']!=ismerchant()){
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
            foreach ($car_source as $k => $v) {
                if(ismerchant()){
                    if($v['merchant_id']!=ismerchant()){
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
            if(ismerchant()){
                if($car_source['merchant_id']!=ismerchant()){
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
            if(ismerchant()){
                if($car_source['merchant_id']!=ismerchant()){
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
            if(ismerchant()){
                if($car_source['merchant_id']!=ismerchant()){
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
            if(ismerchant()){
                if($car_source['merchant_id']!=ismerchant()){
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
}