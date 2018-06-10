<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class Homebrand extends Admin
{
	//首页品牌列表
	public function index(){
        //查出数据
        $data=db('home_brands')->order('sort asc,created_at desc')->select();
        //处理数据
        foreach ($data as $key => $value) {
        	$data[$key]['created_at_str']=date('Y-m-d H:i',$value['created_at']);
            $data[$key]['p_pinpai']=db('brands')->where('p_pinpai_id',$value['brand_id'])->value('p_pinpai');
        }
        //模板赋值
        $this->assign([
        	'data'=>$data,
        ]);
        //渲染模板
        return $this->fetch();
	}
    //添加首页品牌
    public function add(){
        $now=time();
        // 保存数据
        if ($this->request->isPost()) {
            $data = $this->request->post();
            //验证
            $count=db('home_brands')->count('id');
            if($count>=8){
                return json_return('F','1000','最多上传8张首页品牌图');
            }
            if($data['img']===''){
                return json_return('F','1000','图片必传');
            }
            if($data['brand']===''){
                return json_return('F','1000','品牌名称必填');
            }
            if($data['brand_id']===''){
                return json_return('F','1000','对应品牌必选');
            }
            //处理数据
            $insert['img']=$data['img'];
            $insert['brand']=$data['brand'];
            $insert['brand_id']=$data['brand_id'];
            $insert['runner_id']=UID;
            $insert['created_at']=$now;
            $insert_id=db('home_brands')->insertGetId($insert);
            //入库
            if ($insert_id>0) {
                record_log(request()->module(),request()->controller(),'添加首页品牌');
                return json_return('T','','添加首页品牌成功');
            } else {
                return json_return('F','500','添加首页品牌失败');
            }
        }
        //获取品牌
        $brand=db('brands')->field('id,p_pinpai_id,p_pinpai')->where(['p_pinpai_id'=>['neq',''],'p_pinpai'=>['neq','']])->select();
        //模板赋值
        $this->assign([
            'brand'=>$brand,
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
            $home_brand=db('home_brands')->find($data['id']);
            if(!$home_brand){
                return json_return('F','500','请求错误');
            }
            //验证
            if($data['img']===''){
                return json_return('F','1000','图片必传');
            }
            if($data['brand']===''){
                return json_return('F','1000','品牌名称必填');
            }
            if($data['brand_id']===''){
                return json_return('F','1000','对应品牌必选');
            }
            //处理数据
            $update['img']=$data['img'];
            $update['brand']=$data['brand'];
            $update['brand_id']=$data['brand_id'];
            $rt=db('home_brands')->where('id',$data['id'])->update($update);
            //入库
            if ($rt!==false) {
                if($rt>0){
                    record_log(request()->module(),request()->controller(),'修改首页品牌');
                }
                return json_return('T','','修改首页品牌成功');
            } else {
                return json_return('F','500','修改首页品牌失败');
            }
        }
        $home_brand=db('home_brands')->where('id',$id)->find();
        if($home_brand){
            $home_brand['created_at_str']=date('Y-m-d H:i',$home_brand['created_at']);
            //获取品牌
            $brand=db('brands')->field('id,p_pinpai_id,p_pinpai')->where(['p_pinpai_id'=>['neq',''],'p_pinpai'=>['neq','']])->select();
            //模板赋值
            $this->assign([
                'home_brand'=>$home_brand,
                'brand'=>$brand,
            ]);
            //渲染模板
            return $this->fetch();
        }else{
            return $this->error('请求错误');
        }
    }
    //删除
    public function delete($record = []){
        if ($this->request->isPost()) {
            $ids=input('param.id');
            $ids=explode(',',$ids);
            $rt=db('home_brands')->where('id','in',$ids)->delete();
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'删除首页品牌');
                return json_return('T','200','删除首页品牌成功');
            }else{
                return json_return('F','500','删除首页品牌失败');
            }
        } 
        $id=input('param.id'); 
        $home_brand=db('home_brands')->where('id',$id)->find();
        if($home_brand){
            $rt=db('home_brands')->where('id',$id)->delete();
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'删除首页品牌');
                return json_return('T','200','删除首页品牌成功');
            }else{
                return json_return('F','500','删除首页品牌失败');
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
            $rt_c+=(int)db('home_brands')->where('id',$v)->update(['sort'=>$k+1]);
        }
        if($type){
            $tips='上移';
        }else{
            $tips='下移';
        }
        if($rt_c>0){
            record_log(request()->module(),request()->controller(),$tips.'首页品牌');
        }
        return json_return('T','200',$tips.'首页品牌成功');
    }
}