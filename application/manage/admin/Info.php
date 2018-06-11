<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;
use app\user\model\User as AdminModel;

class Info extends Admin
{
    //修改密码
    public function setpassword(){
        $now=time();
        // 保存数据
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $admin_user=db('admin_user')->find(UID);
            if(!$admin_user){
                return json_return('F','500','请求错误');
            }
            //验证
            if($data['password0']===''){
                return json_return('F','1001','密码必填');
            }
            if(!preg_match('/^[A-Za-z0-9!@#$%^&*-,.?;]{8,16}$/',$data['password0'])) {
                return json_return('F','1001','密码允许大小写数字、字母、特殊字符的8-16个字符，必须有其中三项组成');
            }
            $a=preg_match('/[0-9]/', $data['password0']);
            $b=preg_match('/[a-zA-Z]/', $data['password0']);
            $c=preg_match('/[!@#$%^&*-,.?;]/', $data['password0']);
            if(!($a && $b && $c)){
                return json_return('F','1001','密码允许大小写数字、字母、特殊字符的8-16个字符，必须有其中三项组成');
            }
            if($data['password']===''){
                return json_return('F','1002','确认密码必填');
            }
            if($data['password0']!==$data['password']){
                return json_return('F','1002','两次密码输入不一致');
            }
            //处理数据
            $update['id']=UID;
            $update['password']=$data['password'];
            AdminModel::update($update);
            record_log(request()->module(),request()->controller(),'修改密码');
            return json_return('T','','修改密码成功，请重新登录');
        }
        //渲染模板
        return $this->fetch();
    }
}