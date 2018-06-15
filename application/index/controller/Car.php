<?php
namespace app\index\controller;

use app\common\controller\Common;

class Car extends Common
{
    //获取车系
    public function getSeries($brand_id='')
    {
        $serie=db('series')->field('id,p_chexi_id,p_chexi')->where(['p_pinpai_id'=>$brand_id,'is_show'=>'1'])->select();
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
        $car=db('cars')->field('id,p_chexing_id,p_chexingmingcheng')->where(['p_chexi_id'=>$serie_id,'is_show'=>'1'])->select();
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
        $car=db('cars')->field('id,p_pinpai,p_chexi,p_chexing_id,p_chexingmingcheng')->where(['p_chexi_id'=>$serie_id,'is_show'=>'1'])->select();
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
    //查看车型
    public function look()
    {
        $id=input('param.id');
        $car=db('cars')->where(['p_chexing_id'=>$id])->find();
        if($car){
            $car_attr_cn=db('configs')->where('name','car_attr_cn')->value('value');
            $car_attr_cn=json_decode($car_attr_cn,true);
            $car_attr_en=db('configs')->where('name','car_attr_en')->value('value');
            $car_attr_en=json_decode($car_attr_en,true);
            $data=[];
            foreach ($car_attr_en as $k => $v) {
                if($car[$v]!==''){
                    $pix=[];
                    if($v=='p_waiguanyanse' || $v=='p_neishiyanse'){
                        $pix['type']=1;
                    }else{
                        $pix['type']=0;
                    }
                    $pix['name']=$car_attr_cn[$k];
                    $pix['value']=$car[$v];
                    $pix['value']=str_replace(['-','●','○'],['无','标配','选装'],$pix['value']);
                    $data[]=$pix;
                }
            }
            $data=['code'=>'200','msg'=>'请求成功','data'=>$data];
        }else{
            $data=['code'=>'500','msg'=>'请求错误'];
        }
        return json($data);
    }
    //查看车型（已分类）
    public function categorylook(){
        $car_attr=db('configs')->where('name','car_attr_category')->value('value');
        $car_attr=json_decode($car_attr,true);
        $id=input('param.id');
        $car=db('cars')->where(['p_chexing_id'=>$id])->find();
        if($car){
            $data=[];
            foreach ($car_attr as $key => $value) {
                $pix=[];
                $pix['title']=$value['title'];
                $pix['attr']=[];
                foreach ($value['attr'] as $k => $v) {
                    $zix=[];
                    if($car[$k]!==''){
                        $zix['name']=$v;
                        $zix['value']=$car[$k];
                        $zix['value']=str_replace(['-','●','○'],['无','标配','选装'],$zix['value']);
                        $pix['attr'][]=$zix;
                    }
                }
                if($pix['attr']){
                    $data[]=$pix;
                }
            }
            $data=['code'=>'200','msg'=>'请求成功','data'=>$data];
        }else{
            $data=['code'=>'500','msg'=>'请求错误'];
        }
        return json($data);
    }
}
