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

// 为方便系统核心升级，二次开发中需要用到的公共函数请写在这个文件，不要去修改common.php文件
use app\admin\model\Menu as MenuModel;
/**
 * 清空/删除 文件夹
 * @param string $dirname 文件夹路径
 * @param bool $self 是否删除当前文件夹
 * @return bool
 */
if(!function_exists('do_rmdir')){
    function do_rmdir($dirname, $self = true) {
        if (!file_exists($dirname)) {
            return false;
        }
        if (is_file($dirname) || is_link($dirname)) {
            return @unlink($dirname);
        }
        $dir = dir($dirname);
        if ($dir) {
            while (false !== $entry = $dir->read()) {
                if ($entry == '.' || $entry == '..') {
                    continue;
                }
                do_rmdir($dirname . '/' . $entry);
            }
        }
        $dir->close();
        $self && @rmdir($dirname);
    }
}
//json输出
if(!function_exists('json_return')){
    function json_return($type,$param1='',$param2=''){
        if($type=='T'){
            if($param2==='') $param2='success';
            return json(['code'=>200,'msg'=>$param2,'data'=>$param1]);
        }else{
            if($param1==='') $param1='500';
            return json(['code'=>$param1,'msg'=>$param2]);
        }
    }
}

//json字符串输出（图片接口用这个）
if(!function_exists('json_text_return')){
    function json_text_return($type,$param1='',$param2=''){
        if($type=='T'){
            if($param2==='') $param2='success';
            echo json_encode(['code'=>200,'msg'=>$param2,'data'=>$param1]);die;
        }else{
            if($param1==='') $param1='500';
            echo json_encode(['code'=>$param1,'msg'=>$param2]);die;
        }
    }
}

//地区文字
if(!function_exists('region_text')){
    function region_text($data='',$pix=true){
        $text='';
        if(is_array($data)){
            foreach ($data as $key => $value) {
                $region=db('regions')->where('id',$value)->find();
                if($region){
                    $text.=$region['name'].' ';
                }
            }
            $text=trim($text);
        }else{
            $region=db('regions')->where('id',$data)->find();
            if($region){
                $text=$region['name'];
            }
        }
        if(!$pix){
            $text=explode(' ',$text);
            $text=$text[0];
        }
        return $text;
    }
}

//记录日志
if(!function_exists('record_log')){
    function record_log($module,$controller,$remark){
        $module_us=config('module_us');
        $insert=[
            'runner_id'=>session('user_auth.uid'),
            'created_at'=>time(),
            'module'=>$module_us[strtolower($module)][strtolower($controller)],
            'remark'=>$remark,
        ];
        db('logs')->insertGetId($insert);
    }
}
//是否车商,返回车商ID
if(!function_exists('ismerchant')){
    function ismerchant($admin_id=0){
        if($admin_id<=0){
            $admin_id=session('user_auth.uid');
        }
        $role_id=db('admin_user')->where('id',$admin_id)->value('role');
        if($role_id==2){
            $merchant_id=db('merchants')->where('admin_id',$admin_id)->value('id');
            return $merchant_id;
        }
        $merchant_id=db('admin_role')->where('id',$role_id)->value('merchant_id');
        if($merchant_id>0){
            return $merchant_id;
        }else{
            return false;
        }
    }
}
//是否为超级管理员
if(!function_exists('isSupper')){
    function isSupper($id=''){
        if($id===''){
            $uid=defined('UID')?UID:session('user_auth.uid');
            $id=$uid;
        }
        $role=db('admin_user')->where('id',$id)->value('role');
        if($role=='1'){
            return true;
        }else{
            return false;
        }
    }
}
//权限
if(!function_exists('menu_auth')){
    function menu_auth($uid=0,$ismerchant=false){
        if($uid<=0){
            $uid=defined('UID')?UID:session('user_auth.uid');
        }
        $role=db('admin_user')->where('id',$uid)->value('role');
        if($role==1){
            $admin_menu=db('admin_menu')->field('id')->select();
            $menus=[];
            foreach ($admin_menu as $k => $v) {
                $menus[]=$v['id'];
            }
            return $menus;
        }
        
        //车商
        if($ismerchant){
            $menu_auth=db('admin_role')->where('id','2')->value('');
            eval('$menus='.$menu_auth.';');
            $manage_auth=$menus;
        }else{
            //管理员
            $menu_auth=db('admin_role')->where('id','3')->value('menu_auth');
            eval('$menus='.$menu_auth.';');
            $manage_auth=$menus;
        }
        //具体权限
        $menu_auth=db('admin_role')->where('id',$role)->value('menu_auth');
        eval('$menus='.$menu_auth.';');
        foreach ($menus as $k => $v) {
            if(!in_array($v,$manage_auth)){
                unset($menus[$k]);
            }
        }
        return $menus;
    }
}
//是否有权限
if(!function_exists('isaccess')){
    function isaccess($menu_id=0){
        $uid=defined('UID')?UID:session('user_auth.uid');
        $role=db('admin_user')->where('id',$uid)->value('role');
        if($role==1) return true;//完全豁免
        if($menu_id<=0){
            // 获取当前操作的id
            $location = MenuModel::getLocation();
            $action   = end($location);
            $menu_id=$action['id'];
        }  
        
        //车商
        if(ismerchant()){
            $menu_auth=db('admin_role')->where('id','2')->value('menu_auth');
            eval('$menu_auth='.$menu_auth.';');
            if(!in_array($menu_id, $menu_auth)){
                return false;
            }
        }else{
            //管理员
            $menu_auth=db('admin_role')->where('id','3')->value('menu_auth');
            eval('$menu_auth='.$menu_auth.';');
            if(!in_array($menu_id, $menu_auth)){
                return false;
            }
        }
        //具体权限
        $menu_auth=db('admin_role')->where('id',$role)->value('menu_auth');
        eval('$menu_auth='.$menu_auth.';');
        if(in_array($menu_id, $menu_auth)){
            return true;
        }else{
            return false;
        }
    }
}
//是否显示
if(!function_exists('ismeunshow')){
    function ismeunshow($url_value){
        $role=db('admin_user')->where('id',UID)->value('role');
        if($role==1) return true;//完全豁免
        $menu_id=db('admin_menu')->where('url_value',$url_value)->value('id');
        //管理员
        $menu_auth=db('admin_role')->where('id','3')->value('menu_auth');
        eval('$menu_auth='.$menu_auth.';');
        if(!in_array($menu_id, $menu_auth)){
            return false;
        }
        //车商
        if(ismerchant()){
            $menu_auth=db('admin_role')->where('id','2')->value('menu_auth');
            eval('$menu_auth='.$menu_auth.';');
            if(!in_array($menu_id, $menu_auth)){
                return false;
            }
        }
        //具体权限
        $menu_auth=db('admin_role')->where('id',$role)->value('menu_auth');
        eval('$menu_auth='.$menu_auth.';');
        if(in_array($menu_id, $menu_auth)){
            return true;
        }else{
            return false;
        }
    }
}
//树形数组结构
if(!function_exists('get_arr_tree')){
    function get_arr_tree($items,$pid ="parent_id") {
        $map  = [];
        $tree = [];    
        foreach ($items as &$it){ //数据的ID名生成新的引用索引树
            $map[$it['id']] = &$it;
        }  
        foreach ($items as &$it){
            $parent = &$map[$it[$pid]];
            if($parent) {
                $parent['son'][] = &$it;
            }else{
                $tree[] = &$it;
            }
        }
        return $tree;
    }
}
/**
 * 随机字符
 * @param number $length 长度
 * @param string $type 类型
 * @param number $convert 转换大小写
 * @return string
 */
if(!function_exists('random')){
    function random($length=4, $type='all', $convert=0){
        $config = array(
            'number'=>'1234567890',
            'letter'=>'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
            'small'=>'abcdefghijklmnopqrstuvwxyz',
            'big'=>'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
            'string'=>'abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789',
            'all'=>'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'
        );
        
        if(!isset($config[$type])) $type = 'string';
        $string = $config[$type];
        
        $code = '';
        $strlen = strlen($string) -1;
        for($i = 0; $i < $length; $i++){
            $code .= $string{mt_rand(0, $strlen)};
        }
        if(!empty($convert)){
            $code = ($convert > 0)? strtoupper($code) : strtolower($code);
        }
        return $code;
    }
}
//查找菜单所有父级
if(!function_exists('get_menu_pids')){
    function get_menu_pids($id){
        $pids = '';
        $parent_id = db('admin_menu')->where('id',$id)->value('pid');
        if( $parent_id != '' ){
            $pids .= $parent_id;
            $npids = get_menu_pids( $parent_id );
            if(isset($npids))
                $pids .= ','.$npids;
        }
        $pids=trim($pids,',');
        return $pids;
    }
}
 /**
 * 功能:无限级分类排序
 * 参数:$data 类别查询结果集
 * 返回值:$arr 递归查询排序后的数组
 */
if(!function_exists('cateSort')){
    function cateSort($data,$pid=0,$level=0,$parent_name='parent_id') {
        static $arr = [];
        foreach($data as $k => $v) {
            if($v[$parent_name] == $pid) {
                $arr[$k] = $v;
                $arr[$k]['level'] = $level + 1;
                cateSort($data,$v['id'],$level+1,$parent_name);
            }
        }
        return $arr;
    }
}