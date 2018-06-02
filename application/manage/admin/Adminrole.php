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
        //整理筛选参数
        $map=[];
        if($filter['name']!==''){
            $map['name']=['like','%'.$filter['name'].'%'];
        }
        //车商
        if(ismerchant()){
            $map['merchant_id']=ismerchant();
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
            if($data['title']===''){
                return json_return('F','1000','文章标题必填');
            }
            if(mb_strlen($data['title'],'utf8')>40) {
                return json_return('F','1000','文章标题最多40个字');
            }
            if($data['writer']===''){
                return json_return('F','1000','作者必填');
            }
            if(mb_strlen($data['writer'],'utf8')>40) {
                return json_return('F','1000','作者最多8个字');
            }
            if($data['ground_at']===''){
                $data['ground_at']=$now;
            }else{
                $data['ground_at']=strtotime($data['ground_at'].' 00:00:00');
            }
            if($data['lower_at']===''){
                return json_return('F','1000','下架日期必选');
            }
            $data['lower_at']=strtotime($data['lower_at'].' 23:59:59');
            if($data['ground_at']-$data['lower_at']>=0){
                return json_return('F','1000','下架日期必需大于上架日期');
            }
            if(strip_tags($_POST['content'])!==''){
                if(mb_strlen(strip_tags($_POST['content']),'utf8')>3000) {
                    return json_return('F','1000','正文最多3000个字');
                }
            }
            $insert=[];
            $insert['title']=$data['title'];
            $insert['writer']=$data['writer'];
            $insert['ground_at']=$data['ground_at'];
            $insert['lower_at']=$data['lower_at'];
            $insert['content']=$_POST['content'];
            $insert['state']='1';
            $insert['runner_id']=UID;
            $insert['created_at']=$now;
            $insert_id=db('articles')->insertGetId($insert);
            if($insert_id>0){
                record_log(request()->module(),request()->controller(),'添加文章');
                return json_return('T','200','添加成功');
            }else{
                return json_return('F','500','添加失败');
            }
        } 
        //渲染模板
        return $this->fetch();
	}
    //修改
    public function edit($id=''){
        $now=time(); 
        if ($this->request->isPost()) {
            $data = $this->request->post();
            $article=db('articles')->find($data['id']);
            if(!$article){
                return json_return('F','500','请求错误');
            }
            if($data['title']===''){
                return json_return('F','1000','文章标题必填');
            }
            if(mb_strlen($data['title'],'utf8')>40) {
                return json_return('F','1000','文章标题最多40个字');
            }
            if($data['writer']===''){
                return json_return('F','1000','作者必填');
            }
            if(mb_strlen($data['writer'],'utf8')>40) {
                return json_return('F','1000','作者最多8个字');
            }
            if($data['ground_at']===''){
                return json_return('F','1000','上架日期必选');
            }
            $data['ground_at']=strtotime($data['ground_at'].' 00:00:00');
            if($data['lower_at']===''){
                return json_return('F','1000','下架日期必选');
            }
            $data['lower_at']=strtotime($data['lower_at'].' 23:59:59');
            if($data['ground_at']-$data['lower_at']>=0){
                return json_return('F','1000','下架日期必需大于上架日期');
            }
            if(strip_tags($_POST['content'])!==''){
                if(mb_strlen(strip_tags($_POST['content']),'utf8')>3000) {
                    return json_return('F','1000','正文最多3000个字');
                }
            }
            $update=[];
            $update['title']=$data['title'];
            $update['writer']=$data['writer'];
            $update['ground_at']=$data['ground_at'];
            $update['lower_at']=$data['lower_at'];
            $update['content']=$_POST['content'];
            $rt=db('articles')->where('id',$data['id'])->update($update);
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'修改文章');
                return json_return('T','200','修改成功');
            }else{
                return json_return('F','500','修改失败');
            }
        } 
        $article=db('articles')->where('id',$id)->find();
        if($article){
            $article['created_at_str']=date('Y-m-d H:i',$article['created_at']);
            $article['ground_at']=date('Y-m-d',$article['ground_at']);
            $article['lower_at']=date('Y-m-d',$article['lower_at']);
            //模板赋值
            $this->assign([
                'article'=>$article,
            ]);
            //渲染模板
            return $this->fetch();
        }else{
            return $this->error('请求错误');
        }
    }
    //详情
    public function look($id=''){
        $article=db('articles')->where('id',$id)->find();
        if($article){
            $article['created_at_str']=date('Y-m-d H:i',$article['created_at']);
            $article['ground_at']=date('Y-m-d',$article['ground_at']);
            $article['lower_at']=date('Y-m-d',$article['lower_at']);
            //模板赋值
            $this->assign([
                'article'=>$article,
            ]);
            //渲染模板
            return $this->fetch();
        }else{
            return $this->error('请求错误');
        }
    }
}