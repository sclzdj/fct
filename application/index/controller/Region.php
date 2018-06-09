<?php
namespace app\index\controller;

use app\common\controller\Common;

class Region extends Common
{
    //获取子地区
    public function getChilds($id='')
    {
        $level=db('regions')->where('id',$id)->value('level');
        $region=db('regions')->field('id,name')->where(['parent_id'=>$id,'level'=>$level+1])->order('sort asc')->select();
        if($region!==false){
            $data=['code'=>'200','msg'=>'请求成功','region'=>$region];
        }else{
            $data=['code'=>'500','msg'=>'请求失败'];
        }
        return json($data);
    }
}
