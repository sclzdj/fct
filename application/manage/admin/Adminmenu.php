<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class Adminmenu extends Admin
{
	//权限树
	public function index(){
        //查出权限
        if(!isSupper()){
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
	//添加
	public function add(){
		$now=time(); 
		if ($this->request->isPost()) {
            $data = $this->request->post();
            if(!isSupper() && $data['pid']<=334 && $data['pid']!=236) return json_return('F','500','封装好的权限只有开发者可操作！请在‘好车’权限上添加顶级权限在进行其他操作');
            if($data['pid']>0){
                $admin_menu=db('admin_menu')->find($data['pid']);
                if(!$admin_menu){
                    return json_return('F','500','请求错误');
                }
                if(!isSupper()){
                    $menu_auth=db('admin_role')->where('id','3')->value('menu_auth');
                    $menu_auth=json_decode($menu_auth,true);
                    $admin_menus=db('admin_menu')->field('id')->where('id','in',$menu_auth)->order('sort asc')->select();
                    $pix=false;
                    foreach ($admin_menus as $k => $v) {
                        if($data['pid']==$v['id']){
                            $pix=true;
                        }
                    }
                    if(!$pix){
                        return json_return('F','500','请求错误');
                    }
                }
                $menu_pids=get_menu_pids($data['pid']);
                if($menu_pids){
                    $menu_pids=explode(',',$menu_pids);
                }
                if(count($menu_pids)>2){
                    return json_return('F','500','请求错误');
                }
            }else{
                return json_return('F','500','请求错误');
            }
            if($data['title']===''){
                return json_return('F','1000','权限名称必填');
            }
            if(mb_strlen($data['title'],'utf8')>20) {
                return json_return('F','1000','权限名称最多20个字');
            }
            //入库
            $insert=[];
            $insert['pid']=$data['pid'];
            $insert['title']=$data['title'];
            $insert['url_value']=$data['url_value'];
            $insert['sort']='100';
            $insert['module']='manage';
            $insert['icon']='fa fa-fw fa-list';
            $insert['url_type']='module_admin';
            $insert['url_target']='_self';
            $insert['update_time']=$now;
            $insert['create_time']=$now;
            $insert['status']='1';
            $insert_id=db('admin_menu')->insertGetId($insert);
            if($insert_id>0){
                $menu_auth=db('admin_role')->where('id','3')->value('menu_auth');
                $menu_auth=json_decode($menu_auth,true);
                $menu_auth[]=$insert_id;
                $menu_auth=array_values($menu_auth);
                $menu_auth=json_encode($menu_auth);
                db('admin_role')->where('id','3')->update(['menu_auth'=>$menu_auth]);
                record_log(request()->module(),request()->controller(),'添加权限');
                return json_return('T','200','添加成功');
            }else{
                return json_return('F','500','添加失败');
            }
        } 
	}
    //修改
    public function edit($id=''){
        $now=time(); 
        if ($this->request->isPost()) {
            $data = $this->request->post();
            if(!isSupper() && $data['id']<=334) return json_return('F','500','封装好的权限只有开发者可操作！请在‘好车’权限上添加顶级权限在进行其他操作');
            if($data['id']>0){
                $admin_menu=db('admin_menu')->find($data['id']);
                if(!$admin_menu){
                    return json_return('F','500','请求错误');
                }
                if(!isSupper()){
                    $menu_auth=db('admin_role')->where('id','3')->value('menu_auth');
                    $menu_auth=json_decode($menu_auth,true);
                    $admin_menus=db('admin_menu')->field('id')->where('id','in',$menu_auth)->order('sort asc')->select();
                    $pix=false;
                    foreach ($admin_menus as $k => $v) {
                        if($data['id']==$v['id']){
                            $pix=true;
                        }
                    }
                    if(!$pix){
                        return json_return('F','500','请求错误');
                    }
                }
            }else{
                return json_return('F','500','请求错误');
            }
            if($data['title']===''){
                return json_return('F','1000','权限名称必填');
            }
            if(mb_strlen($data['title'],'utf8')>20) {
                return json_return('F','1000','权限名称最多20个字');
            }
            //入库
            $update=[];
            $update['title']=$data['title'];
            $update['url_value']=$data['url_value'];
            $rt=db('admin_menu')->where('id',$data['id'])->update($update);
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'修改权限');
                return json_return('T','200','修改成功');
            }else{
                return json_return('F','500','修改失败');
            }
        } 
    }
    //删除
    public function delete($record=[]){
        $id=input('param.id');
        if(!isSupper() && $id<=334) return json_return('F','500','封装好的权限只有开发者可操作！请在‘好车’权限上添加顶级权限在进行其他操作');
        $admin_menu=db('admin_menu')->find($id);
        if(!$admin_menu){
            return json_return('F','500','请求错误');
        }
        if(!isSupper()){
            $menu_auth=db('admin_role')->where('id','3')->value('menu_auth');
            $menu_auth=json_decode($menu_auth,true);
            $admin_menus=db('admin_menu')->field('id')->where('id','in',$menu_auth)->order('sort asc')->select();
            $pix=false;
            foreach ($admin_menus as $k => $v) {
                if($id==$v['id']){
                    $pix=true;
                }
            }
            if(!$pix){
                return json_return('F','500','请求错误');
            }
        }
        $admin_menus=db('admin_menu')->where('pid',$id)->select();
        if($admin_menus){
            return json_return('F','10000','请先删除它的下级权限');
        }
        $rt=db('admin_menu')->where('id',$id)->delete();
        if($rt!==false){
            if($rt>0) record_log(request()->module(),request()->controller(),'删除权限');
            return json_return('T','200','删除成功');
        }else{
            return json_return('F','500','删除失败');
        }
    }
}