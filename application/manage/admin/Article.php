<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class Article extends Admin
{
	//文章列表
	public function index(){
        //获取筛选参数
        $filter=[
            'title'=>input('param.title',''),
            'ground_at_start'=>input('param.ground_at_start',''),
            'ground_at_end'=>input('param.ground_at_end',''),
        ];
        //整理筛选参数
        $map=[];
        if($filter['title']!==''){
            $map['title']=['like','%'.$filter['title'].'%'];
        }
        $filter_at['ground_at_start']=$filter['ground_at_start'].' 00:00:00';
        $filter_at['ground_at_end']=$filter['ground_at_end'].' 23:59:59';
        if($filter['ground_at_start']!=='' && $filter['ground_at_end']!==''){
            $map['ground_at']=['between time',[$filter_at['ground_at_start'],$filter_at['ground_at_end']]];
        }elseif($filter['ground_at_start']!=='' && $filter['ground_at_end']===''){
            $map['ground_at']=['>= time',$filter_at['ground_at_start']];
        }elseif($filter['ground_at_start']==='' && $filter['ground_at_end']!==''){
            $map['ground_at']=['<= time',$filter_at['ground_at_end']];
        }
        $order=input('param.order','ground_at desc');
        $order=str_replace('+', ' ', $order);
        //查出数据
        $object=db('articles')->where($map)->order($order)->paginate(15);
        // 获取分页显示
        $page = $object->render();
        $data_all = json_decode(json_encode($object),TRUE);
        $data=$data_all['data'];
        //处理数据
        foreach ($data as $key => $value) {
            $data[$key]['ground_at_str']=date('Y-m-d',$value['ground_at']);
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
                return json_return('F','1001','文章标题必填');
            }
            if(mb_strlen($data['title'],'utf8')>40) {
                return json_return('F','1001','文章标题最多40个字');
            }
            if($data['writer']===''){
                return json_return('F','1002','作者必填');
            }
            if(mb_strlen($data['writer'],'utf8')>8) {
                return json_return('F','1002','作者最多8个字');
            }
            if($data['ground_at']===''){
                $data['ground_at']=$now;
            }else{
                $data['ground_at']=strtotime($data['ground_at'].' 00:00:00');
            }
            if($data['img']===''){
                return json_return('F','1003','图片必传');
            }
            if($data['describe']===''){
                return json_return('F','1004','描述必填');
            }
            if(mb_strlen($data['describe'],'utf8')>200) {
                return json_return('F','1004','描述最多200个字');
            }
            if(strip_tags($_POST['content'])!==''){
                if(mb_strlen(strip_tags($_POST['content']),'utf8')>3000) {
                    return json_return('F','1005','正文最多3000个字');
                }
            }
            $insert=[];
            $insert['title']=$data['title'];
            $insert['writer']=$data['writer'];
            $insert['ground_at']=$data['ground_at'];
            $insert['img']=$data['img'];
            $insert['describe']=$data['describe'];
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
                return json_return('F','1001','文章标题必填');
            }
            if(mb_strlen($data['title'],'utf8')>40) {
                return json_return('F','1001','文章标题最多40个字');
            }
            if($data['writer']===''){
                return json_return('F','1002','作者必填');
            }
            if(mb_strlen($data['writer'],'utf8')>8) {
                return json_return('F','1002','作者最多8个字');
            }
            if($data['ground_at']===''){
                return json_return('F','1006','上架日期必选');
            }
            if($data['img']===''){
                return json_return('F','1003','图片必传');
            }
            if($data['describe']===''){
                return json_return('F','1004','描述必填');
            }
            if(mb_strlen($data['describe'],'utf8')>200) {
                return json_return('F','1004','描述最多200个字');
            }
            $data['ground_at']=strtotime($data['ground_at'].' 00:00:00');
            if(strip_tags($_POST['content'])!==''){
                if(mb_strlen(strip_tags($_POST['content']),'utf8')>3000) {
                    return json_return('F','1005','正文最多3000个字');
                }
            }
            $update=[];
            $update['title']=$data['title'];
            $update['writer']=$data['writer'];
            $update['ground_at']=$data['ground_at'];
            $insert['img']=$data['img'];
            $insert['describe']=$data['describe'];
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
            $article['describe_len']=mb_strlen($article['describe'],'utf8');
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
    //上架
    public function ground(){
        $id=input('param.id'); 
        $banner=db('articles')->where('id',$id)->find();
        if($banner){
            $rt=db('articles')->where('id',$id)->update(['state'=>'1']);
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'上架文章');
                return json_return('T','200','上架文章成功');
            }else{
                return json_return('F','500','上架文章失败');
            }
        }else{
            return json_return('F','500','请求错误');
        }
    }
    //下架
    public function lower(){
        $id=input('param.id'); 
        $banner=db('articles')->where('id',$id)->find();
        if($banner){
            $rt=db('articles')->where('id',$id)->update(['state'=>'0']);
            if($rt!==false){
                if($rt>0) record_log(request()->module(),request()->controller(),'下架文章');
                return json_return('T','200','下架文章成功');
            }else{
                return json_return('F','500','下架文章失败');
            }
        }else{
            return json_return('F','500','请求错误');
        }
    }
}