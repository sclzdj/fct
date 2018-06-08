<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class Todayrecomment extends Admin
{
	//今日好车推荐列表
	public function index(){
        //查出数据
        $data=db('today_recomments')->alias('a')->field('a.*,b.sn,b.driving_img,b.brand_id,b.serie_id,b.model_id,b.plate_province_id,b.plate_city_id,b.first_plate_at,b.mileage,b.price,b.imgs,b.audit_at,c.shop_name')->join('car_sources b','a.car_source_id=b.id','LEFT')->join('merchants c','b.merchant_id=c.id','LEFT')->order('a.sort asc,a.created_at desc')->select();
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
        //模板赋值
        $this->assign([
        	'data'=>$data,
        ]);
        //渲染模板
        return $this->fetch();
	}
	//添加
	public function add(){
		$now=time(); 
		if ($this->request->isPost()) {
            $data = $this->request->post();
            $today_recomment=db('today_recomments')->where('car_source_id',$data['car_source_id'])->find();
            if($today_recomment){
            	return json_return('F','10000','该车源已添加');
            }
            $car_source=db('car_sources')->where('id',$data['car_source_id'])->find();
            if(!$car_source){
            	return json_return('F','10000','该车源不存在');
            }
            $insert=[];
            $insert['car_source_id']=$data['car_source_id'];
            $insert['runner_id']=UID;
            $insert['created_at']=$now;
            $insert_id=db('today_recomments')->insertGetId($insert);
            if($insert_id>0){
                record_log(request()->module(),request()->controller(),'添加今日好车推荐');
                return json_return('T','200','添加成功');
            }else{
                return json_return('F','500','添加失败');
            }
        } 
	}
	//移除
    public function delete($record = []){
        if ($this->request->isPost()) {
            $ids=input('param.id');
            $ids=explode(',',$ids);
            $rt=db('today_recomments')->where('id','in',$ids)->delete();
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'移除今日好车推荐');
                return json_return('T','200','移除今日好车推荐成功');
            }else{
                return json_return('F','500','移除今日好车推荐失败');
            }
        } 
        $id=input('param.id'); 
        $banner=db('today_recomments')->where('id',$id)->find();
        if($banner){
            $rt=db('today_recomments')->where('id',$id)->delete();
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'移除今日好车推荐');
                return json_return('T','200','移除今日好车推荐成功');
            }else{
                return json_return('F','500','移除今日好车推荐失败');
            }
        }else{
            return json_return('F','500','请求错误');
        }
    }
    //移动
    public function move(){
        $ids=input('param.id');
        $type=input('param.type');
        $ids=explode(',',$ids);
        $rt_c=0;
        foreach ($ids as $k => $v) {
            $rt_c+=(int)db('today_recomments')->where('id',$v)->update(['sort'=>$k+1]);
        }
        if($type){
            $tips='上移';
        }else{
            $tips='下移';
        }
        if($rt_c>0){
            record_log(request()->module(),request()->controller(),$tips.'今日好车推荐');
        }
        return json_return('T','200',$tips.'今日好车推荐成功');
    }
    //保存标签
    public function savetag(){
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $today_recomment=db('today_recomments')->where('id',$data['id'])->find();
            if(!$today_recomment){
                return json_return('F','500','请求错误');
            }
            if($data['tag1']!==''){
                if(mb_strlen($data['tag1'],'utf8')>10) {
                    return json_return('F','1000','标签1最多10个字');
                }
            }
            if($data['tag2']!==''){
                if(mb_strlen($data['tag2'],'utf8')>10) {
                    return json_return('F','1000','标签2最多10个字');
                }
            }
            if($data['tag3']!==''){
                if(mb_strlen($data['tag3'],'utf8')>10) {
                    return json_return('F','1000','标签3最多10个字');
                }
            }
            $update=[];
            $update['id']=$data['id'];
            $update['tag1']=$data['tag1'];
            $update['tag2']=$data['tag2'];
            $update['tag3']=$data['tag3'];
            $rt=db('today_recomments')->where('id',$data['id'])->update($update);
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'保存今日好车推荐标签');
                return json_return('T','200','保存标签成功');
            }else{
                return json_return('F','500','保存标签失败');
            }
        } 
    }
}