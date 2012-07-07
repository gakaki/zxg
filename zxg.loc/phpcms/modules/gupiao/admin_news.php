<?php
defined('IN_PHPCMS') or exit('No permission resources.');
pc_base::load_app_class('admin','admin',0);

class admin_news extends admin {

	public $db;
	public function __construct() {
		parent::__construct();
		//if (!module_exists(ROUTE_M)) showmessage(L('module_not_exists'));
		$this->username = param::get_cookie('admin_username');
		
		//$this->db = pc_base::load_model('announce_model');
		$this->db = pc_base::load_model('gupiao_news_model');
	//	pc_base::load_app_func('global');
		
	}

	public function lists()
	{
		echo 'news lists';
	}
	/*
			use zxg;
			for (i=0; i < 30 ; i++) { 
				title = 'gakaki_'+i;
				db.news.insert({
					title:title
				})
			}
	*/
	
	public function init() {
		//新闻列表
		$sql = '';
		$_GET['status'] = $_GET['status'] ? intval($_GET['status']) : 1;
		$sql = '`siteid`=\''.$this->get_siteid().'\'';
		
		$page = max(intval($_GET['page']), 1);
		
/*
		$m = new Mongo();
		$db = $m->zxg;
		$collection = $db->news;
		$cursor = $collection->find();
		foreach ($cursor as $obj) {
		    echo $obj["title"] . "\n";
		}
*/

		$data = $this->db->listinfo($query=array(), $order=array('_id'=>1), $page);	//-1是降序
		
		
		
	//	$big_menu = array('javascript:window.top.art.dialog({id:\'add\',iframe:\'?m=gupiao&c=admin_news&a=add\', title:\''.L('gupiao_add').'\', width:\'700\', height:\'500\', lock:true}, function(){var d = window.top.art.dialog({id:\'add\'}).data.iframe;var form = d.document.getElementById(\'dosubmit\');form.click();return false;}, function(){window.top.art.dialog({id:\'add\'}).close()});void(0);', L('gupiao_add'));
		$big_menu = array('javascript:window.top.art.dialog({id:\'add\',iframe:\'?m=gupiao&c=admin_news&a=add\', title:\''.'新闻添加'.'\', width:\'700\', height:\'500\', lock:true}, function(){var d = window.top.art.dialog({id:\'add\'}).data.iframe;var form = d.document.getElementById(\'dosubmit\');form.click();return false;}, function(){window.top.art.dialog({id:\'add\'}).close()});void(0);', '新闻添加');
		include $this->admin_tpl('news_list');
	}
	
	/**
	 * ajax检测新闻标题是否重复
	 */
	public function public_check_title()
	{
		$title = $_GET['title'];
		if (!$title) exit(0);
		
		$r = $this->db->findOne(array('title' => $title));
		
		if($r) {
			exit('0');
		} else {
			exit('1');
		}
	}
	/**
	 * 添加公告
	 */
	public function add() {
		if(isset($_REQUEST['dosubmit'])) {
			$_POST['news'] = $this->check($_REQUEST['news']);
			if($this->db->insert($_POST['news'])) showmessage(L('news_successful_added'), HTTP_REFERER, '', 'add');
		} else {
			//获取站点模板信息
			pc_base::load_app_func('global', 'admin');
			$siteid = $this->get_siteid();
			$template_list = template_list($siteid, 0);
			$site = pc_base::load_app_class('sites','admin');
			
			$info = $site->get_by_id($siteid);
			
			foreach ($template_list as $k=>$v) {
				$template_list[$v['dirname']] = $v['name'] ? $v['name'] : $v['dirname'];
				unset($template_list[$k]);
			}
			
			$show_header = $show_validator = $show_scroll = 1;
			pc_base::load_sys_class('form', '', 0);
			
			include $this->admin_tpl('news_add');
		}
	}
	
	/**
	 * 修改公告
	 */
	public function edit() {
		
		$db_id = $_GET['id'];
		$news  = $_POST['news'];

		if(!$db_id) showmessage(L('illegal_operation'));

		$where = array('_id' => new MongoId($db_id));	
		$old_news = $this->db->findOne($where);

		if(isset($_POST['dosubmit'])) {
			$news = $this->check($news, 'edit');
			$news['updated_at'] = new MongoDate();
			$result = array_merge($old_news, $news);

			if($this->db->save($result)) showmessage(L('news_successful_updated'), HTTP_REFERER, '', 'edit');
		} else {

			$news = $old_news;
			pc_base::load_sys_class('form', '', 0);
			//获取站点模板信息
			pc_base::load_app_func('global', 'admin');
			$template_list = template_list($this->siteid, 0);
			foreach ($template_list as $k=>$v) {
				$template_list[$v['dirname']] = $v['name'] ? $v['name'] : $v['dirname'];
				unset($template_list[$k]);
			}
			$show_header = $show_validator = $show_scroll = 1;

			include $this->admin_tpl('news_edit');
		}
	}
	
	/**
	 * 批量修改公告状态 使其成为审核、未审核状态
	 */
	public function public_approval() {

		$db_id = $_REQUEST['id'];

		if((!isset($db_id) || empty($db_id)) ) {
			showmessage(L('illegal_operation'));
		} else {
			//must be array
			if(is_array($db_id) ) {

				$in_values = mongodb_ids_to_a($db_id);
				//die(var_dump( 'in_values', $in_values));
				$this->db->update(array(
					'_id'=>array(
						'$in'=>$in_values
					)),
					array(
						'$set'=>array('status'=>0)
					),
					array('multiple'=>true)
				);
			} 
			showmessage(L('news_passed'), HTTP_REFERER);
		}
	}
	
	/**
	 * 批量删除公告
	 */
	public function delete() {

		$db_id = $_POST['id'];

		if((!isset($db_id) || empty($db_id))  ) {
			showmessage(L('illegal_operation'));
		} else {
			//must be array
			if(is_array($db_id) ) {
				$in_values = mongodb_ids_to_a($db_id);
				//die(var_dump( '$in_values',$in_values ));
				$this->db->remove(array('_id'=>array('$in'=>$in_values)));
			} 
			showmessage(L('news_deleted'), HTTP_REFERER);
		}
	}
	
	/**
	 * 验证表单数据
	 * @param  		array 		$data 表单数组数据
	 * @param  		string 		$a 当表单为添加数据时，自动补上缺失的数据。
	 * @return 		array 		验证后的数据
	 */
	private function check($data = array(), $a = 'add') {

		if($data['title']=='') showmessage(L('title_cannot_empty'));
		if($data['content']=='') showmessage(L('news_content_cannot_be_empty'));
		$r = $this->db->findOne(array('title' => $data['title']));

		if ($a=='add') {
			if (is_array($r) && !empty($r)) {
				showmessage(L('news_exist'), HTTP_REFERER);
			}
			$data['siteid'] = $this->get_siteid();

			$data['addtime'] = SYS_TIME;
			$data['created_at'] = new MongoDate();
			$data['updated_at'] = new MongoDate();

			$data['username'] = $this->username;
	
		} else {
			/*if ($r['_id'] && ($r['_id']!=$_GET['_id'])) {
				showmessage(L('news_exist'), HTTP_REFERER);
			}*/
		}
		return $data;
	}
}
