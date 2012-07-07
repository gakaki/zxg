<?php
define('IN_WAS', true);

class was {

	public $db;
	/**
	 * 构造函数
	 */
	public function __construct() {
		$this->db = pc_base::load_model('was_primary_model');
		pc_base::load_app_func('global');

		if(isset($_GET) && is_array($_GET) && count($_GET) > 0) {
			foreach($_GET as $k=>$v) {
				if(!in_array($k, array('m','c','a'))) {
					$_POST[$k] = $v;
				}
			}
		}	
	}
	
	public function hello(){
		$this->db->save(array("name"=>"Tbone","say"=>"Hello"),array("safe"=>true));
		var_dump(iterator_to_array($this->db->find()));
	}
	
	/**
	 * 加载模块模板
	 * @param string $file 文件名
	 * @param string $m 模型名
	 */
	public static function load_tpl($file, $m = '') {
		$m = empty($m) ? ROUTE_M : $m;
		if(empty($m)) return false;
		return PC_PATH.'modules'.DIRECTORY_SEPARATOR.$m.DIRECTORY_SEPARATOR.'templates'.DIRECTORY_SEPARATOR.$file.'.tpl.php';
	}
	
}
