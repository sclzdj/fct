<?php
// +----------------------------------------------------------------------
// | 海豚PHP框架 [ DolphinPHP ]
// +----------------------------------------------------------------------
// | 版权所有 2016~2017 河源市卓锐科技有限公司 [ http://www.zrthink.com ]
// +----------------------------------------------------------------------
// | 官方网站: http://dolphinphp.com
// +----------------------------------------------------------------------
// | 开源协议 ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------

namespace app\index\controller;
use think\Image;
import("alioss.autoload",EXTEND_PATH);
use OSS\Core\OssException;//不然OssException 报错
use OSS\OssClient;

class File extends Home
{
    //后台上传文件
    public function upload()
    {
        $oss_upload_file_clear_run=(int)db('configs')->where('name','oss_upload_file_clear_run')->value('value');
        if($oss_upload_file_clear_run){
            return json_return('F','1000','系统正在清除OSS无效文件，请稍后上传！');
        }
        $type=input('param.type','file');
        $multiple=input('param.multiple','0');
        $size=(int)input('param.size',3*1024*1024);
        $suffix=input('param.suffix','');
        if(!in_array($type, ['image','file'])){
            return json_return('F','1000','上传类型错误！');
        }
        if($size<=0){
            return json_return('F','1000','大小限制需大于0！');
        }
        $file = request()->file('file');  //获取到上传的文件
        $now=time();
        if($multiple){
            $up=[];
            foreach ($file as $key => $value) {
                $info=$value->getInfo();
                $tye_arr=explode('/', $info['type']);
                $tye=$tye_arr[0];
                if($type=='image'){
                    if($tye!='image'){
                        return json_return('F','1000','你上传的不是图片类型！');
                    }
                }
                $name_arr=explode('.', $info['name']);
                $fix=$name_arr[count($name_arr)-1];
                if($suffix!==''){
                    $suffix_arr=explode(',',$suffix);
                    if(!in_array($fix,$suffix_arr)){
                        return json_return('F','1000','后缀只能为'.$suffix.'！');
                    }
                }
                if($info['size']>$size){
                    if($size>1024*1024){
                        $tips=($size/(1024*1024)).'MB';
                    }elseif($size>1024){
                        $tips=($size/1024).'KB';
                    }else{
                        $tips=$size.'B';
                    }
                    return json_return('F','1000','文件大小不能超过'.$tips.'！');
                }
                $up[]=['fix'=>$fix,'tmp_name'=>$info['tmp_name']];
            }
            $alioss = config('alioss'); //获取oss的配置
            //实例化对象 将配置传入
            $ossClient = new OssClient($alioss['KeyId'], $alioss['KeySecret'], $alioss['Endpoint']); 
            $data=[];
            foreach ($up as $key => $value) {
                //生成文件名 之后连接上后缀
                $fileName = date('YmdHis', $now) . random(26) . '.' . $value['fix'];
                //执行阿里云上传 
                $result=$ossClient->uploadFile($alioss['Bucket'], $fileName, $value['tmp_name']);
                if(isset($result['info']['url'])){
                    db('oss_files')->insertGetId(['bucket'=>$alioss['Bucket'],'object'=>$fileName,'url'=>$result['info']['url'],'created_at'=>$now]);
                    $data[]=$result['info']['url'];
                }
            }
            if($data){
                return json_return('T',$data,'上传成功'.count($data).'张');
            }else{
                return json_return('F','500','上传失败');
            }
        }else{
            $info=$file->getInfo();
            $tye_arr=explode('/', $info['type']);
            $tye=$tye_arr[0];
            if($type=='image'){
                if($tye!='image'){
                    return json_return('F','1000','你上传的不是图片类型！');
                }
            }
            $name_arr=explode('.', $info['name']);
            $fix=$name_arr[count($name_arr)-1];
            if($suffix!==''){
                $suffix_arr=explode(',',$suffix);
                if(!in_array($fix,$suffix_arr)){
                    return json_return('F','1000','后缀只能为'.$suffix.'！');
                }
            }
            if($info['size']>$size){
                if($size>1024*1024){
                    $tips=($size/(1024*1024)).'MB';
                }elseif($size>1024){
                    $tips=($size/1024).'KB';
                }else{
                    $tips=$size.'B';
                }
                return json_return('F','1000','文件大小不能超过'.$tips.'！');
            }
            $alioss = config('alioss'); //获取oss的配置
            //实例化对象 将配置传入
            $ossClient = new OssClient($alioss['KeyId'], $alioss['KeySecret'], $alioss['Endpoint']);  
            //生成文件名 之后连接上后缀
            $fileName = date('YmdHis', $now) . random(26) . '.' . $fix;
            //执行阿里云上传 
            $result=$ossClient->uploadFile($alioss['Bucket'], $fileName, $info['tmp_name']);
            if(isset($result['info']['url'])){
                db('oss_files')->insertGetId(['bucket'=>$alioss['Bucket'],'object'=>$fileName,'url'=>$result['info']['url'],'created_at'=>$now]);
                $data=$result['info']['url'];
                return json_return('T',$data,'上传成功');
            }else{
                return json_return('F','500','上传失败');
            }
        }
    }
    //百度编辑器上传文件
    public function ueditorUpload()
    {
        $oss_upload_file_clear_run=(int)db('configs')->where('name','oss_upload_file_clear_run')->value('value');
        if($oss_upload_file_clear_run){
            echo json_encode(["state"=>"系统正在清除OSS无效文件，请稍后上传！"]);die;
        }
        $return=[];
        $file = request()->file('file');  //获取到上传的文件
        $now=time();
        $info=$file->getInfo();
        $return['original']=$info['name'];
        $name_arr=explode('.', $info['name']);
        $fix=$name_arr[count($name_arr)-1];
        $return['type']='.'.$fix;
        $return['size']=$info['size'];
        $alioss = config('alioss'); //获取oss的配置
        //实例化对象 将配置传入
        $ossClient = new OssClient($alioss['KeyId'], $alioss['KeySecret'], $alioss['Endpoint']);  
        //生成文件名 之后连接上后缀
        $fileName = date('YmdHis', $now) . random(26) . '.' . $fix;
        $return['title']=$fileName;
        //执行阿里云上传 
        $result=$ossClient->uploadFile($alioss['Bucket'], $fileName, $info['tmp_name']);
        if(isset($result['info']['url'])){
            db('oss_files')->insertGetId(['bucket'=>$alioss['Bucket'],'object'=>$fileName,'url'=>$result['info']['url'],'created_at'=>$now]);
            $return['url']=$result['info']['url'];
            $return['state']='SUCCESS';
            echo json_encode($return);die;
        }else{
            echo json_encode(["state"=>"上传失败"]);die;
        }
    }
}
 