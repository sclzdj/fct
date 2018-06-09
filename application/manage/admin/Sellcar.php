<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class Sellcar extends Admin
{
	//个人卖车信息列表
	public function index(){
		//获取筛选参数
        $filter=[
        	'mobile'=>input('param.mobile',''),
        	'submit_at_start'=>input('param.submit_at_start',''),
        	'submit_at_end'=>input('param.submit_at_end',''),
        ];
        //整理筛选参数
        $map=[];
        if($filter['mobile']!==''){
        	$map['mobile']=['like','%'.$filter['mobile'].'%'];
        }
        $filter_at['submit_at_start']=$filter['submit_at_start'].' 00:00:00';
        $filter_at['submit_at_end']=$filter['submit_at_end'].' 23:59:59';
        if($filter['submit_at_start']!=='' && $filter['submit_at_end']!==''){
        	$map['submit_at']=['between time',[$filter_at['submit_at_start'],$filter_at['submit_at_end']]];
        }elseif($filter['submit_at_start']!=='' && $filter['submit_at_end']===''){
        	$map['submit_at']=['>= time',$filter_at['submit_at_start']];
        }elseif($filter['submit_at_start']==='' && $filter['submit_at_end']!==''){
        	$map['submit_at']=['<= time',$filter_at['submit_at_end']];
        }
        $order=input('param.order','submit_at desc');
        $order=str_replace('+', ' ', $order);
        //查出数据
        $object=db('sellcars')->where($map)->order($order)->paginate(15);
        // 获取分页显示
		$page = $object->render();
		$data_all = json_decode(json_encode($object),TRUE);
        $data=$data_all['data'];
        //处理数据
        foreach ($data as $key => $value) {
        	$data[$key]['submit_at_str']=date('Y-m-d H:i',$value['submit_at']);
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
    public function look($id=''){
        $sellcar=db('sellcars')->where('id',$id)->find();
        if($sellcar){
            $sellcar['plate_at_str']=date('Y-m-d H:i',$sellcar['plate_at']);
            $sellcar['submit_at_str']=date('Y-m-d H:i',$sellcar['submit_at']);
            $sellcar['created_at_str']=date('Y-m-d H:i',$sellcar['created_at']);
            if($sellcar['imgs']===''){
                $sellcar['imgs']=[];
            }else{
                $sellcar['imgs']=explode(',', $sellcar['imgs']);
            }
            //模板赋值
            $this->assign([
                'sellcar'=>$sellcar,
            ]);
            //渲染模板
            return $this->fetch();
        }else{
            return $this->error('请求错误');
        }
    }
}