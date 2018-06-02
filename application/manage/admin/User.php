<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class User extends Admin
{
	//用户列表
	public function index(){
		//获取筛选参数
        $filter=[
        	'mobile'=>input('param.mobile',''),
        	'register_at_start'=>input('param.register_at_start',''),
        	'register_at_end'=>input('param.register_at_end',''),
        ];
        //整理筛选参数
        $map=[];
        if($filter['mobile']!==''){
        	$map['mobile']=['like','%'.$filter['mobile'].'%'];
        }
        $filter_at['register_at_start']=$filter['register_at_start'].' 00:00:00';
        $filter_at['register_at_end']=$filter['register_at_end'].' 23:59:59';
        if($filter['register_at_start']!=='' && $filter['register_at_end']!==''){
        	$map['register_at']=['between time',[$filter_at['register_at_start'],$filter_at['register_at_end']]];
        }elseif($filter['register_at_start']!=='' && $filter['register_at_end']===''){
        	$map['register_at']=['>= time',$filter_at['register_at_start']];
        }elseif($filter['register_at_start']==='' && $filter['register_at_end']!==''){
        	$map['register_at']=['<= time',$filter_at['register_at_end']];
        }
        $order=input('param.order','register_at desc');
        $order=str_replace('+', ' ', $order);
        //查出数据
        $object=db('users')->where($map)->order($order)->paginate(15);
        // 获取分页显示
		$page = $object->render();
		$data_all = json_decode(json_encode($object),TRUE);
        $data=$data_all['data'];
        //缓存导出数据
        session('user_index_export_map',$map);
        session('user_index_export_order',$order);
        //处理数据
        foreach ($data as $key => $value) {
        	$data[$key]['register_at_str']=date('Y-m-d H:i',$value['register_at']);
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
	//用户列表导出
	public function export(){
		$header = array(
          'ID'=>'string',//text
          '手机号'=>'string',//text
          '注册时间'=>'string',//text
        );
        $data = db('users')->where(session('user_index_export_map'))->order(session('user_index_export_order'))->select();
        //处理数据
        foreach ($data as $key => $value) {
        	$data[$key]['register_at']=date('Y-m-d H:i',$value['register_at']);
        }
        $file_name = 'userList-'.date('YmdHis').'-'.mt_rand(1000,9999).'.xlsx';     //下载文件名    
        $file_dir = "excels/";        //下载文件存放目录  
        do_rmdir($file_dir,false);//先清空文件夹
        $rows = $data;
        import('PHP_XLSXWriter-master.xlsxwriter', EXTEND_PATH,'.class.php');
        $writer = new \XLSXWriter();
        $writer->writeSheetHeader('Sheet1', $header);
        foreach($rows as $row){
            $row=array_values($row);
            $writer->writeSheetRow('Sheet1', $row);
        }
        $writer->writeToFile($file_dir.$file_name);
        //检查文件是否存在    
        if (! file_exists ( $file_dir . $file_name )) {    
            return $this->error('文件未生成成功，请重试');
        } else {    
            record_log(request()->module(),request()->controller(),'导出用户列表');
            header('Location:'.config('finecar.host_url').'/public/'.$file_dir.$file_name);
            die;
        } 
	}
}