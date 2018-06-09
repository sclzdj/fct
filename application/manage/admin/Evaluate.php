<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class Evaluate extends Admin
{
	//估价列表
	public function index(){
		//获取筛选参数
        $filter=[
        	'mobile'=>input('param.mobile',''),
        	'evaluate_at_start'=>input('param.evaluate_at_start',''),
        	'evaluate_at_end'=>input('param.evaluate_at_end',''),
        ];
        //整理筛选参数
        $map=[];
        if($filter['mobile']!==''){
        	$map['mobile']=['like','%'.$filter['mobile'].'%'];
        }
        $filter_at['evaluate_at_start']=$filter['evaluate_at_start'].' 00:00:00';
        $filter_at['evaluate_at_end']=$filter['evaluate_at_end'].' 23:59:59';
        if($filter['evaluate_at_start']!=='' && $filter['evaluate_at_end']!==''){
        	$map['evaluate_at']=['between time',[$filter_at['evaluate_at_start'],$filter_at['evaluate_at_end']]];
        }elseif($filter['evaluate_at_start']!=='' && $filter['evaluate_at_end']===''){
        	$map['evaluate_at']=['>= time',$filter_at['evaluate_at_start']];
        }elseif($filter['evaluate_at_start']==='' && $filter['evaluate_at_end']!==''){
        	$map['evaluate_at']=['<= time',$filter_at['evaluate_at_end']];
        }
        $order=input('param.order','evaluate_at desc');
        $order=str_replace('+', ' ', $order);
        //查出数据
        $object=db('evaluates')->where($map)->order($order)->paginate(15);
        // 获取分页显示
		$page = $object->render();
		$data_all = json_decode(json_encode($object),TRUE);
        $data=$data_all['data'];
        //处理数据
        foreach ($data as $key => $value) {
        	$data[$key]['evaluate_at_str']=date('Y-m-d H:i',$value['evaluate_at']);
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
}