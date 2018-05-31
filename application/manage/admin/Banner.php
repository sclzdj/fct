<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class Banner extends Admin
{
	//banner列表
	public function index(){
        $terminal=input('param.terminal','0');
        //查出数据
        $data=db('banners')->where('terminal',$terminal)->order('sort asc,created_at desc')->select();
        //处理数据
        foreach ($data as $key => $value) {
        	$data[$key]['created_at_str']=date('Y-m-d H:i',$value['created_at']);
        }
        //模板赋值
        $this->assign([
            'terminal'=>$terminal,
        	'data'=>$data,
        ]);
        //渲染模板
        return $this->fetch();
	}
    //添加banner
    public function add(){
        $now=time();
        // 保存数据
        if ($this->request->isPost()) {
            $data = $this->request->post();
            //验证
            if($data['terminal']===''){
                return json_return('F','1000','展示端必选');
            }
            if($data['img']===''){
                return json_return('F','1000','图片必传');
            }
            if($data['brand']===''){
                return json_return('F','1000','对应品牌必填');
            }
            if($data['remark']===''){
                return json_return('F','1000','描述必填');
            }
            if(mb_strlen($data['remark'],'utf8')>40) {
                return json_return('F','1000','描述最多40个字');
            }
            //处理数据
            $insert['terminal']=$data['terminal'];
            $insert['img']=$data['img'];
            $insert['brand']=$data['brand'];
            $insert['remark']=$data['remark'];
            $insert['runner_id']=UID;
            $insert['created_at']=$now;
            $insert_id=db('banners')->insertGetId($insert);
            //入库
            if ($insert_id>0) {
                record_log(request()->module(),request()->controller(),'添加Banner');
                return json_return('T','','添加Banner成功');
            } else {
                return json_return('F','500','添加Banner失败');
            }
        }
        //渲染模板
        return $this->fetch();
    }
    //修改
    public function edit($id=''){
        $now=time();
        // 保存数据
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $banner=db('banners')->find($data['id']);
            if(!$banner){
                return json_return('F','500','请求错误');
            }
            //验证
            if($data['terminal']===''){
                return json_return('F','1000','展示端必选');
            }
            if($data['img']===''){
                return json_return('F','1000','图片必传');
            }
            if($data['brand']===''){
                return json_return('F','1000','对应品牌必填');
            }
            if($data['remark']===''){
                return json_return('F','1000','描述必填');
            }
            if(mb_strlen($data['remark'],'utf8')>40) {
                return json_return('F','1000','描述最多40个字');
            }
            //处理数据
            $update['terminal']=$data['terminal'];
            $update['img']=$data['img'];
            $update['brand']=$data['brand'];
            $update['remark']=$data['remark'];
            $update['created_at']=$now;
            $rt=db('banners')->where('id',$data['id'])->update($update);
            //入库
            if ($rt!==false) {
                if($rt>0){
                    record_log(request()->module(),request()->controller(),'修改Banner');
                }
                return json_return('T','','修改Banner成功');
            } else {
                return json_return('F','500','修改Banner失败');
            }
        }
        $banner=db('banners')->where('id',$id)->find();
        if($banner){
            $banner['created_at_str']=date('Y-m-d H:i',$banner['created_at']);
            //模板赋值
            $this->assign([
                'banner'=>$banner,
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
            $rt=db('banners')->where('id','in',$ids)->delete();
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'删除Banner');
                return json_return('T','200','删除Banner成功');
            }else{
                return json_return('F','500','删除Banner失败');
            }
        } 
        $id=input('param.id'); 
        $banner=db('banners')->where('id',$id)->find();
        if($banner){
            $rt=db('banners')->where('id',$id)->delete();
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'删除Banner');
                return json_return('T','200','删除Banner成功');
            }else{
                return json_return('F','500','删除Banner失败');
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
            $rt_c+=(int)db('banners')->where('id',$v)->update(['sort'=>$k+1]);
        }
        if($type){
            $tips='上移';
        }else{
            $tips='下移';
        }
        if($rt_c>0){
            record_log(request()->module(),request()->controller(),$tips.'Banner');
        }
        return json_return('T','200',$tips.'Banner成功');
    }
}