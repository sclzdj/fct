<?php
namespace app\manage\admin;

use app\admin\controller\Admin;
use think\Db;
use think\Request;
use think\Validate;
use app\common\builder\ZBuilder;


class Index extends Admin
{
	public function index(){  
        return ZBuilder::make('table')
            ->setPageTitle('') // 设置页面标题
            ->setPageTips('') // 设置页面提示信息
            ->hideCheckbox() //隐藏第一列多选框
            ->fetch();
	}
}