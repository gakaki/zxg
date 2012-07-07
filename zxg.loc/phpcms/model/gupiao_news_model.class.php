<?php
defined('IN_PHPCMS') or exit('No permission resources.');
pc_base::load_sys_class('mongodbmodel', '', 0);
class gupiao_news_model extends mongodbmodel {
	public function __construct() {
		$this->db_config = pc_base::load_config('mongodb');
		$this->db_setting = 'default';
		$this->collection_name = 'news';
		parent::__construct();
	}
	
}