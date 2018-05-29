<?php
namespace app\index\controller;

use app\common\controller\Common;

/**
 * 前台公共控制器
 * @package app\index\controller
 */
class Region extends Common
{
    
    public function getChilds($id='')
    {
        $level=db('regions')->where('id',$id)->value('level');
        $region=db('regions')->field('id,name')->where(['parent_id'=>$id,'level'=>$level+1])->order('sort asc')->select();
        if($id>0){
            $data=['code'=>'200','msg'=>'请求成功','region'=>$region];
        }else{
            $data=['code'=>'500','msg'=>'请求失败'];
        }
        return json($data);
    }
}
