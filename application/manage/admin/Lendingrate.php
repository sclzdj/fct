<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class Lendingrate extends Admin
{
	//贷款利率
	public function index(){
        //查出数据
        $data=db('lending_rates')->order('id asc')->select();
        foreach ($data as $key => $value) {
        	$data[$key]['rate']=number_format($value['rate']/100,2,'.','');
        }
        //模板赋值
        $this->assign([
        	'data'=>$data,
        ]);
        //渲染模板
        return $this->fetch();
	}
    //修改
    public function edit($id=''){
        // 保存数据
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $lending_rate=db('lending_rates')->find($data['id']);
            if(!$lending_rate){
                return json_return('F','500','请求错误');
            }
            //验证
            if($data['rate']===''){
                return json_return('F','1000','贷款利率必填');
            }
            if(!preg_match('/^[0-9]{1,2}(\.\d{1,2})?$/',$data['rate'])) {
                return json_return('F','1000','贷款利率只允许输入数字与符号. 格式：XX.XX，两位整数和小数');
            }
            //处理数据
            $update['rate']=$data['rate']*100;
            $rt=db('lending_rates')->where('id',$data['id'])->update($update);
            //入库
            if ($rt!==false) {
                if($rt>0){
                    record_log(request()->module(),request()->controller(),'修改贷款利率');
                } 
                return json_return('T','','修改贷款利率成功');
            } else {
                return json_return('F','500','修改贷款利率失败');
            }
        }
    }
}