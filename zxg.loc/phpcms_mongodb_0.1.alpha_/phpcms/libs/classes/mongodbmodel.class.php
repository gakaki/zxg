<?php 
/**
 *  mongomodel.class.php 数据模型基类
 *
 * @copyright			(C) 2005-2011 Tsing.cn
 * @license				http://www.tsing.cn/license/
 * @lastmodify			2011-5-4
 */

pc_base::load_sys_class('mongodb_factory', '', 0);
class mongodbmodel {
	
	//数据库配置
	protected $db_config = '';
	//数据库连接
	protected $db = '';
	//调用数据库的配置项
	protected $db_setting = 'default';
	//Collection名
	protected $collection_name = '';
	//Collection前缀
	public  $db_collectionpre = '';
	
	public function __construct() {
		if (!isset($this->db_config[$this->db_setting])) {
			$this->db_setting = 'default';
		}
		$this->collection_name = $this->db_config[$this->db_setting]['collectionpre'].$this->collection_name;
		$this->db_collectionpre = $this->db_config[$this->db_setting]['collectionpre'];
		$this->db = mongodb_factory::get_instance($this->db_config)->get_database($this->db_setting);
	}


	public function insert($a, $options = array() ){
		return $this->db->insert($this->collection_name, $a, $options);
	}
	
	public function batchInsert($a, $options = array() ){
		return $this->db->batchInsert($this->collection_name, $a, $options);
	}
	
	public function save($a, $options = array() ){
		return $this->db->save($this->collection_name, $a, $options);
	}


	public function findOne($query=array(), $filed=array()){    
		return $this->db->findOne($this->collection_name, $query,$filed);
	}

	public function find($query=array(), $filed=array()){
		return $this->db->find($this->collection_name, $query,$filed);
	}
   
	public function count($query=array(), $limit=0, $skip=0){
		return $this->db->count($this->collection_name, $query, $limit, $skip);
	}


	public function update($criteria, $newobj, $options = array() ){
		return $this->db->update($this->collection_name, $criteria, $newobj, $options);
	}

	public function remove($criteria, $newobj, $option=array("justOne"=>false)){
		return $this->db->remove($this->collection_name, $criteria, $newobj, $option);
	}
	
}