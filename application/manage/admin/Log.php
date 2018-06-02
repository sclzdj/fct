<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class Log extends Admin
{
	//日志列表
	public function index(){
		//获取筛选参数
        $filter=[
        	'username'=>input('param.username',''),
        	'module'=>input('param.module',''),
        	'created_at_start'=>input('param.created_at_start',''),
        	'created_at_end'=>input('param.created_at_end',''),
        ];
        //整理筛选参数
        $map=[];
        if($filter['username']!==''){
        	$map['b.username']=['like','%'.$filter['username'].'%'];
        }
        if($filter['module']!==''){
        	$map['a.module']=$filter['module'];
        }
        $filter_at['created_at_start']=$filter['created_at_start'].' 00:00:00';
        $filter_at['created_at_end']=$filter['created_at_end'].' 23:59:59';
        if($filter['created_at_start']!=='' && $filter['created_at_end']!==''){
        	$map['a.created_at']=['between time',[$filter_at['created_at_start'],$filter_at['created_at_end']]];
        }elseif($filter['created_at_start']!=='' && $filter['created_at_end']===''){
        	$map['a.created_at']=['>= time',$filter_at['created_at_start']];
        }elseif($filter['created_at_start']==='' && $filter['created_at_end']!==''){
        	$map['a.created_at']=['<= time',$filter_at['created_at_end']];
        }
        $order=input('param.order','a.created_at desc');
        $order=str_replace('+', ' ', $order);
        //查出数据
        $object=db('logs')->alias('a')->field('a.*,b.username')->join('admin_user b','a.runner_id=b.id','LEFT')->where($map)->order($order)->paginate(15);
        // 获取分页显示
		$page = $object->render();
		$data_all = json_decode(json_encode($object),TRUE);
        $data=$data_all['data'];
        //处理数据
        foreach ($data as $key => $value) {
        	$data[$key]['created_at_str']=date('Y-m-d H:i',$value['created_at']);
        }
        //获取日志类型
        $module_us=config('module_us');
        $module=[];
        foreach ($module_us as $key => $value) {
        	foreach ($value as $k => $v) {
        		$module[]=$v;;
        	}
        }
        $module=array_unique($module);
        //模板赋值
        $this->assign([
        	'filter'=>$filter,
        	'order'=>$order,
        	'data'=>$data,
        	'page'=>$page,
        	'module'=>$module,
        ]);
        //渲染模板
        return $this->fetch();
	}
}