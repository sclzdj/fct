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
        echo '<form action="'.url('index/file/upload',['type'=>'image','multiple'=>'0']).'" method="post" enctype="multipart/form-data"><input type="file" name="file"><input type="submit" value="提交"></form>';
        echo '<form action="'.url('index/file/upload',['type'=>'image','multiple'=>'1']).'" method="post" enctype="multipart/form-data"><input type="file" name="file[]" multiple="multiple"><input type="submit" value="提交"></form>';
    }
}
 