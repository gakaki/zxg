<?php
defined('IN_PHPCMS') or exit('Access Denied');
defined('INSTALL') or exit('Access Denied');

$parentid = $menu_db->insert(array('name'=>'gupiao', 'parentid'=>0, 'm'=>'gupiao', 'c'=>'gupiao', 'a'=>'init', 'data'=>'', 'listorder'=>0, 'display'=>'1'), true);

$second_parentid = $menu_db->insert(array('name'=>'gupiao', 'parentid'=>$parentid, 'm'=>'gupiao', 'c'=>'admin_news', 'a'=>'init', 'data'=>'', 'listorder'=>0, 'display'=>'1'), true);

$menu_db->insert(array('name'=>'gupiao_news_add', 'parentid'=>$second_parentid, 'm'=>'gupiao', 'c'=>'admin_news', 'a'=>'add', 'data'=>'', 'listorder'=>0, 'display'=>'1'), true);
$menu_db->insert(array('name'=>'gupiao_news_data', 'parentid'=>$second_parentid, 'm'=>'gupiao', 'c'=>'admin_news', 'a'=>'data', 'data'=>'', 'listorder'=>0, 'display'=>'1'), true);

$language = array('gupiao'=>'股票', 'gupiao_news_data'=>'股票新闻列表','gupiao_news_add'=>'添加股票新闻');

