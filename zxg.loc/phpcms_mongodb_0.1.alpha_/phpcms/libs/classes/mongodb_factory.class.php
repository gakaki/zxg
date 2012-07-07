<?php
/**
 *  db_factory.class.php 数据库工厂类
 *
 * @copyright			(C) 2005-2010 PHPCMS
 * @license				http://www.phpcms.cn/license/
 * @lastmodify			2010-6-1
 */

final class mongodb_factory {
	
	/**
	 * 当前数据库工厂类静态实例
	 */
	private static $db_factory;
	
	/**
	 * 数据库配置列表
	 */
	protected $db_config = array();
	
	/**
	 * 数据库操作实例化列表
	 */
	protected $db_list = array();
	
	/**
	 * 构造函数
	 */
	public function __construct() {
	
	}
	
	/**
	 * 返回当前终级类对象的实例
	 * @param $db_config 数据库配置
	 * @return object
	 */
	public static function get_instance($db_config = '') {
		if($db_config == '') {
			$db_config = pc_base::load_config('mongodb');
		}
		if(mongodb_factory::$db_factory == '') {
			mongodb_factory::$db_factory = new mongodb_factory();
		}
		if($db_config != '' && $db_config != mongodb_factory::$db_factory->db_config) mongodb_factory::$db_factory->db_config = array_merge($db_config, mongodb_factory::$db_factory->db_config);
		return mongodb_factory::$db_factory;
	}
	
	/**
	 * 获取数据库操作实例
	 * @param $db_name 数据库配置名称
	 */
	public function get_database($db_name) {
		if(!isset($this->db_list[$db_name]) || !is_object($this->db_list[$db_name])) {
			$this->db_list[$db_name] = $this->connect($db_name);
		}
		return $this->db_list[$db_name];
	}
	
	/**
	 *  加载数据库驱动
	 * @param $db_name 	数据库配置名称
	 * @return object
	 */
	public function connect($db_name) {
		$object = null;
		if($this->db_config[$db_name]['type']=='mongodb') {
			pc_base::load_sys_class('mongodb', '', 0);
			$object = new mongo_db();
			$object->open($this->db_config[$db_name]);
		}
		return $object;
	}


	
	/**
	 * 析构函数
	 */
	public function __destruct() {
	}
}
?>
