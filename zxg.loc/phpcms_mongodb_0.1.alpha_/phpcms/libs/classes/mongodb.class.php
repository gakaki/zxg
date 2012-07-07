<?php
/**
 *  mongo_db.class.php 数据库实现类
 *
 * @copyright			(C) 2005-2011 Tsing.cn
 * @license				http://www.tsing.cn/license/
 * @lastmodify			2011-04-13
 */

final class mongo_db {
	
	/**
	 * 数据库配置信息
	 */
	private $config = null;
	
	/**
	 * Collection配置信息
	 */
	private $collection_config = null;
	
	
	/**
	 * 数据库连接资源句柄
	 */
	public $link = null;
	public $linkdb = null;
	
	/**
	 * 最近一次查询资源句柄
	 */
	public $lastqueryid = null;
	
	/**
	 *  统计数据库查询次数
	 */
	public $querycount = 0;
	
	public function __construct() {
	}
	
    public function __get($attribute)
    {
        switch($attribute){
            case 'collection_config':
                return $this->collection_config;
                break;
        }
    }
	
	/**
	 * 打开数据库
	 * @param $config	连接参数
	 * 			
	 * @return void
	 */
	public function open($config) {
		$this->config = $config;
		if($config['autoconnect'] == 1) {
			$this->connect();
		}
	}
	
	/**
	 * 真正开启数据库连接
	 * 			
	 * @return void
	 */
	public function connect() {
		$connect_options = array('connect'=> $this->config['autoconnect'],
								 'persist' => $this->config['pconnect'],
								 'timeout' => $this->config['timeout'],
								 'replicaSet' => $this->config['replicaset'],
								 'username' => $this->config['username'],
								 'password' => $this->config['password']
								);
		if(!$this->link = @new Mongo("mongodb://".$this->config['hostname'], $connect_options)) {
			$this->halt('Can not connect to MongoDB server');
			return false;
		}
		
		if($this->config['database'] && !@$this->linkdb = $this->link->selectDB($this->config['database'])) {
			$this->halt('Cannot use database '.$this->config['database']);
			return false;
		}

		$this->database = $this->config['database']; 
		return $this->link;
	}
	
	public function selectCollection($collection_name){
		if(!is_resource($this->link) || !is_resource($this->linkdb)) {
			$this->connect();
		}
		return $this->linkdb->selectCollection($collection_name);
	}

	public function insert($collection_name, $a, $options = array() ){
		$collection = $this->selectCollection($collection_name);
		return $collection->insert($a, $options);
	}
	
	public function batchInsert($collection_name, $a, $options = array() ){
		$collection = $this->selectCollection($collection_name);
		return $collection->batchInsert($a, $options);
	}
	
	public function save($collection_name, $a, $options = array() ){
		$collection = $this->selectCollection($collection_name);
		return $collection->save($a, $options);
	}


	public function findOne($collection_name, $query=array(), $filed=array()){    
		$collection = $this->selectCollection($collection_name);     
		return $collection->findOne($query,$filed);
	}

	public function find($collection_name, $query=array(), $filed=array()){
		$collection = $this->selectCollection($collection_name);
		return $collection->find($query,$filed);
	}
   
	public function count($collection_name, $query=array(), $limit=0, $skip=0){
		$collection = $this->selectCollection($collection_name);
		return $collection->count($query, $limit, $skip);
	}


	public function update($collection_name, $criteria, $newobj, $options = array() ){
		$collection = $this->selectCollection($collection_name);
		return $collection->update($criteria, $newobj, $options);
	}

	public function remove($collection_name, $criteria, $newobj, $option=array("justOne"=>false)){
		$collection = $this->selectCollection($collection_name);
		return $collection->remove($criteria, $newobj, $option);
	}
	
	/**
	 * 析构函数
	 */
	public function __destruct() {
	}

	public function halt($message = '', $operate = '') {
		$this->errormsg = "<b>MongoDB Operate : </b>$operate <br /><b> MongoDB Error :  </b> $message";
		$msg = $this->errormsg;
			echo '<div style="font-size:12px;text-align:left; border:1px solid #9cc9e0; padding:1px 4px;color:#000000;font-family:Arial, Helvetica,sans-serif;"><span>'.$msg.'</span></div>';
			exit;
	}

}
?>
