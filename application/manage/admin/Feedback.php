<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class Feedback extends Admin
{
	//反馈列表
	public function index(){
		//获取筛选参数
        $filter=[
        	'mobile'=>input('param.mobile',''),
        	'feedback_at_start'=>input('param.feedback_at_start',''),
        	'feedback_at_end'=>input('param.feedback_at_end',''),
        ];
        //整理筛选参数
        $map=[];
        if($filter['mobile']!==''){
        	$map['b.mobile']=['like','%'.$filter['mobile'].'%'];
        }
        $filter_at['feedback_at_start']=$filter['feedback_at_start'].' 00:00:00';
        $filter_at['feedback_at_end']=$filter['feedback_at_end'].' 23:59:59';
        if($filter['feedback_at_start']!=='' && $filter['feedback_at_end']!==''){
        	$map['a.feedback_at']=['between time',[$filter_at['feedback_at_start'],$filter_at['feedback_at_end']]];
        }elseif($filter['feedback_at_start']!=='' && $filter['feedback_at_end']===''){
        	$map['a.feedback_at']=['>= time',$filter_at['feedback_at_start']];
        }elseif($filter['feedback_at_start']==='' && $filter['feedback_at_end']!==''){
        	$map['a.feedback_at']=['<= time',$filter_at['feedback_at_end']];
        }
        $order=input('param.order','a.feedback_at desc');
        $order=str_replace('+', ' ', $order);
        //查出数据
        $object=db('feedbacks')->alias('a')->join('users b','a.user_id=b.id','LEFT')->field('a.id,a.content,a.feedback_at,a.created_at,b.mobile')->where($map)->order($order)->paginate(15);
        // 获取分页显示
		$page = $object->render();
		$data_all = json_decode(json_encode($object),TRUE);
        $data=$data_all['data'];
        //处理数据
        foreach ($data as $key => $value) {
        	$data[$key]['feedback_at_str']=date('Y-m-d H:i',$value['feedback_at']);
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