<?php
namespace app\command\home;

use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\console\input\Argument;
use think\console\input\Option;
use app\common\controller\Common;
use think\Db;
import("alioss.autoload",EXTEND_PATH);
use OSS\Core\OssException;//不然OssException 报错
use OSS\OssClient;
class DelOssFiles extends Command
{
    protected function configure()
    {
        //设置参数
        //$this->addArgument('timed', Argument::REQUIRED);//可选参数
        $this->setName('del_oss_files')->setDescription('清除oss无效文件');
    }
    protected function execute(Input $input, Output $output)
    {
        set_time_limit(0);
        //放执行代码
        $now=time();
        //设置正在执行状态
        db('configs')->where('name','oss_upload_file_clear_run')->update(['value'=>'1']);
        //图片字段
        $imgs=[
            'articles'=>['img','content'],
            'banners'=>['img'],
            'car_sources'=>['cert_imgs','imgs'],
            'merchants'=>['licence_img','identcard_front_img','identcard_back_img','imgs'],
            'orders'=>['contract_img'],
            'sellcars'=>['imgs'],
        ];
        //所有上传文件
        $files=db('oss_files')->select();
        //过滤有效文件
        foreach ($files as $key => $value) {
            foreach ($imgs as $k => $v) {
                $map=[];
                foreach ($v as $_k => $_v) {
                    $map[]="`".$_v."` LIKE '%".$value['object']."%'";
                }
                $where=" ( ".implode(" || ", $map)." ) ";
                $data=db($k)->where($where)->select();
                if($data){
                    unset($files[$key]);
                    continue 2;
                }
            }
        }
        //获取oss的配置
        $alioss = config('alioss');
        //实例化对象 将配置传入
        $ossClient = new OssClient($alioss['KeyId'], $alioss['KeySecret'], $alioss['Endpoint']);  
        $is_unlinks=[];
        //删除无效文件
        foreach ($files as $k => $v) {
            $is_unlinks[]=$v['url'];
            //判断文件是否存在
            $exist = $ossClient->doesObjectExist($v['bucket'], $v['object']);
            if($exist){
                //$ossClient->deleteObject($v['bucket'], $v['object']);//删除oss文件
                //db('oss_files')->where('id',$v['id'])->delete();//删除数据库文件记录
            }else{
                db('oss_files')->where('id',$v['id'])->delete();//删除数据库文件记录
            }
        }
        //取消正在执行状态
        db('configs')->where('name','oss_upload_file_clear_run')->update(['value'=>'0']);
        //打印已删除的文件
        print_r($is_unlinks);
    }
}