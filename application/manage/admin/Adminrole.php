<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class Adminrole extends Admin
{
	//角色列表
	public function index(){
        //获取筛选参数
        $filter=[
            'name'=>input('param.name',''),
        ];
        $filter=fortrim($filter);
        //整理筛选参数
        $map=[];
        if($filter['name']!==''){
            $map['name']=['like','%'.$filter['name'].'%'];
        }
        //车商
        $ismerchant=ismerchant();
        if($ismerchant){
            $map['merchant_id']=$ismerchant;
        }
        $order=input('param.order','create_time desc');
        $order=str_replace('+', ' ', $order);
        //查出数据
        $object=db('admin_role')->where('id','neq','1')->where($map)->order($order)->paginate(15);
        // 获取分页显示
        $page = $object->render();
        $data_all = json_decode(json_encode($object),TRUE);
        $data=$data_all['data'];
        //处理数据
        foreach ($data as $key => $value) {
            $data[$key]['create_time_str']=date('Y-m-d H:i',$value['create_time']);
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
	//添加
	public function add(){
		$now=time(); 
		if ($this->request->isPost()) {
            $data = $this->request->post();
            $data=fortrim($data);
            if($data['name']===''){
                return json_return('F','1001','角色名称必填');
            }
            if(mb_strlen($data['name'],'utf8')>20) {
                return json_return('F','1001','角色名称最多20个字');
            }
            $ismerchant=ismerchant();
            //检查有无越限
            if($ismerchant){
                $menu_auth=db('admin_role')->where('id','2')->value('menu_auth');
                $menu_auth=json_decode($menu_auth,true);
                $default_module='236';
            }elseif(!isSupper()){
                $menu_auth=db('admin_role')->where('id','3')->value('menu_auth');
                $menu_auth=json_decode($menu_auth,true);
                $default_module='236';
            }else{
                $menu_auth=[];
                $admin_menu=db('admin_menu')->field('id')->select();
                foreach ($admin_menu as $k => $v) {
                    $menu_auth[]=$v['id'];
                }
                $default_module='0';
            }
            foreach ($data['menu_auth'] as $k => $v) {
                if(!in_array($v, $menu_auth)){
                    unset($data['menu_auth'][$k]);
                }
            }
            $data['menu_auth']=array_values($data['menu_auth']);
            $new_menu_auth=[];
            //检查是否丢失上级
            foreach ($data['menu_auth'] as $k => $v) {
                $menu=db('admin_menu')->where('id',$v)->find();
                if($menu){
                    $new_menu_auth[]=$v;
                    $pids=get_menu_pids($v);
                    $pids=explode(',',$pids);
                    if($pids){
                        foreach ($pids as $_k => $_v) {
                            if(is_numeric($_v)){
                                $new_menu_auth[]=$_v;
                            }
                        }
                    }
                }
            }
            $new_menu_auth=array_unique($new_menu_auth);
            $new_menu_auth=array_values($new_menu_auth);
            $new_menu_auth=json_encode($new_menu_auth);
            //入库
            $insert=[];
            $insert['name']=$data['name'];
            $insert['menu_auth']=$new_menu_auth;
            $insert['sort']='100';
            $insert['status']='1';
            $insert['access']='1';
            $insert['default_module']=$default_module;
            $insert['update_time']=$now;
            $insert['create_time']=$now;
            $insert['merchant_id']=(int)$ismerchant;
            $insert_id=db('admin_role')->insertGetId($insert);
            if($insert_id>0){
                record_log(request()->module(),request()->controller(),'添加角色');
                return json_return('T','200','添加成功');
            }else{
                return json_return('F','500','添加失败');
            }
        } 
        //查出权限
        $ismerchant=ismerchant();
        if($ismerchant){
            $menu_auth=db('admin_role')->where('id','2')->value('menu_auth');
            $menu_auth=json_decode($menu_auth,true);
            $admin_menu=db('admin_menu')->field('id,title,pid,url_value')->where('id','in',$menu_auth)->order('sort asc')->select();
        }elseif(!isSupper()){
            $menu_auth=db('admin_role')->where('id','3')->value('menu_auth');
            $menu_auth=json_decode($menu_auth,true);
            $admin_menu=db('admin_menu')->field('id,title,pid,url_value')->where('id','in',$menu_auth)->order('sort asc')->select();
        }else{
            $menu_auth=false;
            $admin_menu=db('admin_menu')->field('id,title,pid,url_value')->order('sort asc')->select();
        }
        $admin_menu=cateSort($admin_menu,0,0,'pid');
        //模板赋值
        $this->assign([
            'admin_menu'=>$admin_menu,
            'menu_auth'=>$menu_auth,
        ]);
        //渲染模板
        return $this->fetch();
	}
    //修改
    public function edit($id=''){
        $now=time(); 
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $data=fortrim($data);
            $ismerchant=ismerchant();
            $admin_role=db('admin_role')->find($data['id']);
            if(!$admin_role){
                return json_return('F','500','请求错误');
            }
            if($ismerchant){
                if($admin_role['merchant_id']!=$ismerchant){
                    return json_return('F','500','请求错误');
                }
            }
            if($data['name']===''){
                return json_return('F','1001','角色名称必填');
            }
            if(mb_strlen($data['name'],'utf8')>20) {
                return json_return('F','1001','角色名称最多20个字');
            }
            //检查有无越限
            if($ismerchant){
                $menu_auth=db('admin_role')->where('id','2')->value('menu_auth');
                $menu_auth=json_decode($menu_auth,true);
            }elseif(!isSupper()){
                $menu_auth=db('admin_role')->where('id','3')->value('menu_auth');
                $menu_auth=json_decode($menu_auth,true);
            }else{
                $menu_auth=[];
                $admin_menu=db('admin_menu')->field('id')->select();
                foreach ($admin_menu as $k => $v) {
                    $menu_auth[]=$v['id'];
                }
            }
            foreach ($data['menu_auth'] as $k => $v) {
                if(!in_array($v, $menu_auth)){
                    unset($data['menu_auth'][$k]);
                }
            }
            $data['menu_auth']=array_values($data['menu_auth']);
            $new_menu_auth=[];
            //检查是否丢失上级
            foreach ($data['menu_auth'] as $k => $v) {
                $menu=db('admin_menu')->where('id',$v)->find();
                if($menu){
                    $new_menu_auth[]=$v;
                    $pids=get_menu_pids($v);
                    $pids=explode(',',$pids);
                    if($pids){
                        foreach ($pids as $_k => $_v) {
                            if(is_numeric($_v)){
                                $new_menu_auth[]=$_v;
                            }
                        }
                    }
                }
            }
            $new_menu_auth=array_unique($new_menu_auth);
            $new_menu_auth=array_values($new_menu_auth);
            $new_menu_auth=json_encode($new_menu_auth);
            //入库
            $update=[];
            $update['name']=$data['name'];
            $update['menu_auth']=$new_menu_auth;
            $rt=db('admin_role')->where('id',$data['id'])->update($update);
            if($rt!==false){
                if($rt>0){
                    record_log(request()->module(),request()->controller(),'修改角色');
                }
                return json_return('T','200','修改成功');
            }else{
                return json_return('F','500','修改失败');
            }
        } 
        $ismerchant=ismerchant();
        $admin_role=db('admin_role')->find($id);
        if(!$admin_role){
            return json_return('F','500','请求错误');
        }
        if($ismerchant){
            if($admin_role['merchant_id']!=$ismerchant){
                return json_return('F','500','请求错误');
            }
        }
        //查出权限
        if($ismerchant){
            $menu_auth=db('admin_role')->where('id','2')->value('menu_auth');
            $menu_auth=json_decode($menu_auth,true);
            $admin_menu=db('admin_menu')->field('id,title,pid,url_value')->where('id','in',$menu_auth)->order('sort asc')->select();
        }elseif(!isSupper()){
            $menu_auth=db('admin_role')->where('id','3')->value('menu_auth');
            $menu_auth=json_decode($menu_auth,true);
            $admin_menu=db('admin_menu')->field('id,title,pid,url_value')->where('id','in',$menu_auth)->order('sort asc')->select();
        }else{
            $menu_auth=false;
            $admin_menu=db('admin_menu')->field('id,title,pid,url_value')->order('sort asc')->select();
        }
        $admin_menu=cateSort($admin_menu,0,0,'pid');
        //处理数据
        $admin_role['menu_auth']=json_decode($admin_role['menu_auth'],true);
        //模板赋值
        $this->assign([
            'admin_menu'=>$admin_menu,
            'menu_auth'=>$menu_auth,
            'admin_role'=>$admin_role,
        ]);
        //渲染模板
        return $this->fetch();
    }
    //详情
    public function look($id=''){
        $ismerchant=ismerchant();
        $admin_role=db('admin_role')->find($id);
        if(!$admin_role){
            return json_return('F','500','请求错误');
        }
        if($ismerchant){
            if($admin_role['merchant_id']!=$ismerchant){
                return json_return('F','500','请求错误');
            }
        }
        //查出权限
        if($ismerchant){
            $menu_auth=db('admin_role')->where('id','2')->value('menu_auth');
            $menu_auth=json_decode($menu_auth,true);
            $admin_menu=db('admin_menu')->field('id,title,pid,url_value')->where('id','in',$menu_auth)->order('sort asc')->select();
        }elseif(!isSupper()){
            $menu_auth=db('admin_role')->where('id','3')->value('menu_auth');
            $menu_auth=json_decode($menu_auth,true);
            $admin_menu=db('admin_menu')->field('id,title,pid,url_value')->where('id','in',$menu_auth)->order('sort asc')->select();
        }else{
            $menu_auth=false;
            $admin_menu=db('admin_menu')->field('id,title,pid,url_value')->order('sort asc')->select();
        }
        $admin_menu=cateSort($admin_menu,0,0,'pid');
        //处理数据
        $admin_role['menu_auth']=json_decode($admin_role['menu_auth'],true);
        //模板赋值
        $this->assign([
            'admin_menu'=>$admin_menu,
            'menu_auth'=>$menu_auth,
            'admin_role'=>$admin_role,
        ]);
        //渲染模板
        return $this->fetch();
    }
    //删除
    public function delete($record=[]){
        $id=input('param.id');
        if($id=='1' || $id=='2' || $id=='3'){
            return json_return('F','500','请求错误');
        }
        $ismerchant=ismerchant();
        $map=[];
        if($ismerchant){
            $map['merchant_id']=$ismerchant;
        }
        $admin_role=db('admin_role')->where($map)->where('id',$id)->find();
        if($admin_role){
            $admin_user=db('admin_user')->where('role',$id)->select();
            if($admin_user){
                return json_return('F','10000','此角色已被帐号引用，请删除账号后再删除此角色');
            }
            $rt=db('admin_role')->where($map)->where('id',$id)->delete();
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'删除角色');
                return json_return('T','200','删除角色成功');
            }else{
                return json_return('F','500','删除角色失败');
            }
        }else{
            return json_return('F','500','请求错误');
        }
    }
}