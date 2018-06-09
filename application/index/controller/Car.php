<?php
namespace app\index\controller;

use app\common\controller\Common;

class Car extends Common
{
    //获取车系
    public function getSeries($brand_id='')
    {
        $serie=db('series')->field('id,p_chexi_id,p_chexi')->where(['p_pinpai_id'=>$brand_id,'p_chexi'=>['neq',''],'p_chexi_id'=>['neq','']])->select();
        if($serie!==false){
            $data=['code'=>'200','msg'=>'请求成功','serie'=>$serie];
        }else{
            $data=['code'=>'500','msg'=>'请求失败'];
        }
        return json($data);
    }
    //获取车型
    public function getCars($serie_id='')
    {
        $car=db('cars')->field('id,p_chexing_id,p_chexingmingcheng')->where(['p_chexi_id'=>$serie_id,'p_chexingmingcheng'=>['neq',''],'p_chexing_id'=>['neq','']])->select();
        if($car!==false){
            $data=['code'=>'200','msg'=>'请求成功','car'=>$car];
        }else{
            $data=['code'=>'500','msg'=>'请求失败'];
        }
        return json($data);
    }
    //获取车型，车型名称简写
    public function getJxCars($serie_id='')
    {
        $car=db('cars')->field('id,p_pinpai,p_chexi,p_chexing_id,p_chexingmingcheng')->where(['p_chexi_id'=>$serie_id,'p_chexingmingcheng'=>['neq',''],'p_chexing_id'=>['neq','']])->select();
        if($car!==false){
            foreach ($car as $k => $v) {
                $car[$k]['p_chexingmingcheng_jx']=str_replace([$v['p_pinpai'],$v['p_chexi']], ['',''], $v['p_chexingmingcheng']);
            }
            $data=['code'=>'200','msg'=>'请求成功','car'=>$car];
        }else{
            $data=['code'=>'500','msg'=>'请求失败'];
        }
        return json($data);
    }
}
