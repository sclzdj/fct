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

/**
 * 前台首页控制器
 * @package app\index\controller
 */
class Index extends Home
{
    public function index()
    {
        // 默认跳转模块
        if (config('home_default_module') != 'index') {
            $this->redirect(config('home_default_module'). '/index/index');
        }
        return '<style type="text/css">*{ padding: 0; margin: 0; } .think_default_text{ padding: 4px 48px;} a{color:#2E5CD5;cursor: pointer;text-decoration: none} a:hover{text-decoration:underline; } body{ background: #fff; font-family: "Century Gothic","Microsoft yahei"; color: #333;font-size:18px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.6em; font-size: 42px }</style><div style="padding: 24px 48px;"> <h1>:)</h1><p> '.config("dolphin.product_name").' '.config("dolphin.product_version").'<br/><span style="font-size:30px">极速 · 极简 · 极致</span></p></div>';
    }
    public function opt(){
    	$options=[
    		'事故排查'=>[
    			'排除重大事故'=>['左前减震器座','右前减震器座','左前纵梁','右前纵梁','防火墙','右A柱','右B柱','右侧顶边梁','左C柱','右D柱','右后翼子板内衬','左后翼子板内衬','后备箱底板','右后纵梁','左后纵梁','左D柱','左C柱','左侧顶边梁','左B柱','左A柱'],
    			'排除水泡火烧'=>['机舱保险盒','防火墙隔音棉','发动机主线束','座椅滑轨及固定螺丝','车内线束','安全带底部','全车座椅坐垫','全车地毯地胶','烟灰缸底座','转向柱'],
    		],
    		'轻微碰撞'=>[
    			'轻微碰撞'=>['前防撞梁','水箱框架','左前大灯框架','右前大灯框架','左前翼子板内衬','右前翼子板内衬','右侧底大边','右侧驾驶舱底板','右侧尾灯框架','左侧尾灯框架','后围板','后防撞梁','左侧底大边','左侧驾驶舱底板'],
    		],
    		'易损耗部件'=>[
    			'易损耗部件'=>['左前减震器','气门室盖垫','发动机油底壳','防冻液液面','机油液面','电瓶（极柱）','主动油壶','助力油壶','转向助力泵','水箱水管','水箱','冰凝器','发动机外围皮带','发动机缸垫','变速箱油底壳','右前减震器','右后减震器','左后减震器'],
    		],
    		'常用功能'=>[
    			'安全系统'=>['驾驶座安全气囊','副驾驶安全气囊','前排侧气囊','后排侧气囊','前排头部气囊','后排头部气囊','胎压监测','中控锁','儿童座椅接口','无钥匙启动','无钥匙进入系统','遥控钥匙','防抱死系统（ABS）','车身稳定控制（EPS）','电子驻车制动'],
    			'外部配置'=>['左前轮毂','左前轮胎','前挡风玻璃','右前轮毂','右前轮胎','右后轮毂','右后轮胎','后挡风玻璃','左后轮毂','左后轮胎','全景天窗','感应雨刷','后雨刷','前电动车窗','后电动车窗','后视镜电动调节','后视镜电动折叠','后视镜加热','电动吸合门','后排侧遮阳帘','感应后备厢','电动天窗'],
    			'内部配置'=>['皮质座椅','前排座椅加热','座椅通风','驾驶座座椅电动调节','多功能方向盘','定速巡航','GPS导航','倒车雷达','倒车影像系统','手动空调','自动空调','HUD抬头显示','HUD抬头显示','后排座椅加热','空调'],
    			'灯光系统'=>['近光灯','远光灯','前转向灯','前雾灯','后转向灯','刹车灯','倒车灯','后雾灯','大灯高度可调','大灯清洗','室内顶灯','氙气大灯','LED大灯','自动灯头'],
    			'高科技配置'=>['车道偏离预警系统','自动泊车','盲点辅助系统','全景摄像头','发动机自动启停'],
    			'随车工具'=>['千斤顶','灭火器','三角警示标','维修工具包','备胎'],
    		],
    		'启动检测'=>[
    			'仪表台指示灯'=>['调表车','制动系统指示灯','安全气囊故障灯','车身稳定系统故障灯','发动机故障灯','变速箱故障灯'],
    			'发动机状态'=>['发动机总成','启动','怠速','发动机抖动','尾气'],
    			'变速箱状态'=>['变速箱总成','变速箱挂挡','转向'],
    		],
    	];
    	foreach ($options as $key => $value) {
    		$insert_id_1=db('check_report_options')->insertGetId(['level'=>'1','parent_id'=>'0','name'=>$key]);
    		foreach ($value as $k => $v) {
    			$insert_id_2=db('check_report_options')->insertGetId(['level'=>'2','parent_id'=>$insert_id_1,'name'=>$k]);
    			foreach ($v as $_k => $_v) {
    				db('check_report_options')->insertGetId(['level'=>'3','parent_id'=>$insert_id_2,'name'=>$_v]);
    			}
    		}
    	}
    	echo "ok";
    }
    public function test(){
        //echo '<form action="'.url('index/file/upload',['type'=>'image','multiple'=>'0']).'" method="post" enctype="multipart/form-data"><input type="file" name="file"><input type="submit" value="提交"></form>';
        echo '<form action="'.url('index/file/upload',['type'=>'image','multiple'=>'1']).'" method="post" enctype="multipart/form-data"><input type="file" name="file[]" multiple="multiple"><input type="submit" value="提交"></form>';
    }
    public function nocar(){
        return false;
        $data=db('cars')->field('id,p_pinpai_id,p_pinpai,p_chexi_id,p_chexi')->where("(p_chexing_id='' || p_chexingmingcheng='')")->select();
        $header = array(
          'ID'=>'string',//text
          '品牌号'=>'string',//text
          '品牌名称'=>'string',//text
          '车系号'=>'string',//text
          '车系名称'=>'string',//text
        );
        $file_name = 'nocar-'.date('YmdHis').'-'.mt_rand(1000,9999).'.xlsx';     //下载文件名    
        $file_dir = "excels/";        //下载文件存放目录  
        do_rmdir($file_dir,false);//先清空文件夹
        $rows = $data;
        import('PHP_XLSXWriter-master.xlsxwriter', EXTEND_PATH,'.class.php');
        $writer = new \XLSXWriter();
        $writer->writeSheetHeader('Sheet1', $header);
        foreach($rows as $row){
            $row=array_values($row);
            $writer->writeSheetRow('Sheet1', $row);
        }
        $writer->writeToFile($file_dir.$file_name);
        //检查文件是否存在    
        if (! file_exists ( $file_dir . $file_name )) {    
            return $this->error('文件未生成成功，请重试');
        } else { 
            header('Location:http://localhost/finecar/public/'.$file_dir.$file_name);
            die;
        } 
    }
    //好车显示
    public function filtercar(){
        //die;
        set_time_limit(0);
        db('brands')->where('id','neq','0')->update(['is_show'=>'0']);
        db('series')->where('id','neq','0')->update(['is_show'=>'0']);
        db('cars')->where('id','neq','0')->update(['is_show'=>'0']);
        db('brands')->where(['p_pinpai'=>['neq',''],'p_pinpai_id'=>['neq','']])->update(['is_show'=>'1']);
        db('series')->where(['p_chexi'=>['neq',''],'p_chexi_id'=>['neq','']])->update(['is_show'=>'1']);
        db('cars')->where(['p_chexingmingcheng'=>['neq',''],'p_chexing_id'=>['neq','']])->update(['is_show'=>'1']);
        $brand=db('brands')->field('id,p_pinpai_id,p_pinpai')->where(['is_show'=>'1'])->select();
        foreach ($brand as $b) {
            $serie=db('series')->field('id,p_chexi_id,p_chexi')->where(['is_show'=>'1','p_pinpai_id'=>$b['p_pinpai_id']])->select();
            if($serie){
                $pix=true;
                foreach ($serie as $s) {
                    $car=db('cars')->field('id,p_chexing_id,p_chexingmingcheng')->where(['is_show'=>'1','p_chexi_id'=>$s['p_chexi_id']])->select();
                    if($car){
                        $pix=false;
                    }else{
                        db('series')->where('id',$s['id'])->update(['is_show'=>'0']);
                    }
                }
                if($pix){
                    db('brands')->where('id',$b['id'])->update(['is_show'=>'0']);
                }
            }else{
                db('brands')->where('id',$b['id'])->update(['is_show'=>'0']);
            }    
        }
        die('执行完成');
    }
    //精简品牌
    public function easybrand(){
        //die;
        set_time_limit(0);
        $easy=['阿斯顿·马丁','阿尔法·罗密欧','保时捷','宝马','奔驰','宾利','巴博斯','保斐利','布加迪','大众','道奇','法拉利','丰田','福特','GMC','悍马','红旗','捷豹','柯尼塞克','柯尼塞格','凯迪拉克','劳斯莱斯','兰博基尼','雷克萨斯','路特斯','路虎','猎豹','林肯','雷诺','玛莎拉蒂','迈凯伦','迈巴赫','摩根','MINI','讴歌','乔治·巴顿','帕加尼','日产','Smart','世爵','特斯拉','沃尔沃','英菲尼迪','依维柯'];
        $data=[];
        $ids=[];
        foreach ($easy as $k => $v) {
            $brand=db('brands')->field('id,p_pinpai_id,p_pinpai,is_show')->where(" ( `p_pinpai` LIKE '%{$v}%' ) ")->select();
            if($brand){
                if($brand[0]['is_show']=='1'){
                    $ids[]=$brand[0]['id'];
                }
            }
            $data[$v]=$brand;
        }
        db('brands')->where('id','neq','0')->update(['is_show'=>'0']);
        db('brands')->where('id','in',$ids)->update(['is_show'=>'1']);
        dump($data);
        dump($ids);
        dump(db('brands')->where('is_show','1')->select());
        die('执行完成');
    }
    //精简车系
    public function easyserie(){
        //die;
        set_time_limit(0);
        $serie=db('series')->field('p_chexi_id')->where(['is_show'=>'1'])->select();dump(count($serie));
        $p_chexi_id=[];
        foreach ($serie as $k => $v) {
            $p_chexi_id[]=$v['p_chexi_id'];
        }
        $brand=db('brands')->field('p_pinpai_id')->where(['is_show'=>'1'])->select();
        $p_pinpai_id=[];
        foreach ($brand as $k => $v) {
            $p_pinpai_id[]=$v['p_pinpai_id'];
        }
        db('series')->where('id','neq','0')->update(['is_show'=>'0']);
        db('series')->where('p_pinpai_id','in',$p_pinpai_id)->where('p_chexi_id','in',$p_chexi_id)->update(['is_show'=>'1']);
        $serie=db('series')->field('p_chexi_id')->where(['is_show'=>'1'])->select();dump(count($serie));
        die('执行完成');
    }
    //精简车型
    public function easycar(){
        //die;
        set_time_limit(0);
        $car=db('cars')->field('p_chexing_id')->where(['is_show'=>'1'])->select();dump(count($car));
        $p_chexing_id=[];
        foreach ($car as $k => $v) {
            $p_chexing_id[]=$v['p_chexing_id'];
        }
        $serie=db('series')->field('p_chexi_id')->where(['is_show'=>'1'])->select();
        $p_chexi_id=[];
        foreach ($serie as $k => $v) {
            $p_chexi_id[]=$v['p_chexi_id'];
        }
        db('cars')->where('id','neq','0')->update(['is_show'=>'0']);
        db('cars')->where('p_chexi_id','in',$p_chexi_id)->where('p_chexing_id','in',$p_chexing_id)->update(['is_show'=>'1']);
        $car=db('cars')->field('p_chexing_id')->where(['is_show'=>'1'])->select();dump(count($car));
        die('执行完成');
    }
    //清空数据
    public function cleardata(){
        die;
        set_time_limit(0);
        //菜单表
        db('admin_menu')->where('id','>=','335')->delete();
        db()->execute('alter table '.config('database.prefix').'admin_menu auto_increment=335');
        //角色表
        db('admin_role')->where('id','>=','4')->delete();
        db()->execute('alter table '.config('database.prefix').'admin_role auto_increment=4');
        //账号表
        db('admin_user')->where('id','>=','3')->delete();
        db()->execute('alter table '.config('database.prefix').'admin_user auto_increment=3');
        //配置表
        db('configs')->where('id','>=','5')->delete();
        db()->execute('alter table '.config('database.prefix').'configs auto_increment=5');
        //贷款利率表
        db('lending_rates')->where('id','>=','4')->delete();
        db()->execute('alter table '.config('database.prefix').'lending_rates auto_increment=4');
        //下列表全部清空
        $table=['admin_action','admin_log','articles','banners','car_sources','customers','evaluates','feedbacks','guess_likes','home_brands','logs','merchants','orders','sellcars','today_recomments','users','user_collect'];
        foreach ($table as $k => $v) {
            db($v)->where('id','neq','0')->delete();
            db()->execute('alter table '.config('database.prefix').$v.' auto_increment=1');
        }
        die('执行完成');
    }
    //开启某个品牌
    public function onbrand($p_pinpai=''){
        die;
        //$brand=db('brands')->where('p_pinpai','like','%'.$p_pinpai.'%')->where('is_show','0')->select();dump($brand);die;
        $brand=db('brands')->where('p_pinpai',$p_pinpai)->where('is_show','0')->find();
        $serie=db('series')->where('p_pinpai_id',$brand['p_pinpai_id'])->where('p_chexi','neq','')->select();
        foreach ($serie as $key => $value) {
            $car=db('cars')->where('p_chexi_id',$value['p_chexi_id'])->where('p_chexingmingcheng','neq','')->select();
            if($car){
                db('cars')->where('p_chexi_id',$value['p_chexi_id'])->update(['is_show'=>'1']);
                db('series')->where('p_chexi_id',$value['p_chexi_id'])->update(['is_show'=>'1']);
                db('brands')->where('p_pinpai_id',$brand['p_pinpai_id'])->update(['is_show'=>'1']);
            }
        }
        die('执行完成');
    }
    //关闭某个品牌
    public function offbrand($p_pinpai_id=''){
        die;
        db('cars')->where('p_pinpai_id',$p_pinpai_id)->update(['is_show'=>'0']);
        db('series')->where('p_pinpai_id',$p_pinpai_id)->update(['is_show'=>'0']);
        db('brands')->where('p_pinpai_id',$p_pinpai_id)->update(['is_show'=>'0']);
    }
}
 