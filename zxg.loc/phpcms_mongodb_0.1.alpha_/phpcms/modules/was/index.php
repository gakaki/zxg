<?php
defined('IN_PHPCMS') or exit('No permission resources.');
pc_base::load_app_class('was', 'was', 0);


class index extends was {
	
	private $username, $config;
	
	public function __construct() {
		parent::__construct();
	}
	
	public function init() {
		include $this->load_tpl('index');
	}

	
}
?>
