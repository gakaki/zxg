<?php

    if (!defined('DS')) {
        define('DS',DIRECTORY_SEPARATOR);
    }
	define('FIREPHP','lib'.DS.'FirePHPCore');
	define('DEBUGCONSOLE','debugconsole');


	require_once(FIREPHP.DS.'FirePHP.class.php');
	require_once(FIREPHP.DS.'fb.php');
	//require_once DEBUGCONSOLE.DS.'debugConsole.php';
	
	include_once('ChromePhp.php');
	
    function class_info_chrome($instance)
    {
        $data = array();
        $data['class']          = get_class($instance);
        $data['parent_class']   = get_parent_class($instance);
        $data['methods']        = get_class_methods(get_class($instance));
        $data['vars']           = get_object_vars($instance);
        
        ChromePhp::log($data,'class_info_chrome');
        return $data;
    }
    
	function get_info_chrome($instance,$method)
	{
		//$method = new ReflectionMethod(get_class($item), 'getPromotion');
		$method = new ReflectionMethod(get_class($instance), $method);
		$data = sprintf  (
			    "===> The %s%s%s%s%s%s%s method '%s' (which is %s)\n" .
			    "     declared in %s\n" .
			    "     lines %d to %d\n" .
			    "     having the modifiers %d[%s]\n",
			        $method->isInternal() ? 'internal' : 'user-defined',
			        $method->isAbstract() ? ' abstract' : '',
			        $method->isFinal() ? ' final' : '',
			        $method->isPublic() ? ' public' : '',
			        $method->isPrivate() ? ' private' : '',
			        $method->isProtected() ? ' protected' : '',
			        $method->isStatic() ? ' static' : '',
			        $method->getName(),
			        $method->isConstructor() ? 'the constructor' : 'a regular method',
			        $method->getFileName(),
			        $method->getStartLine(),
			        $method->getEndline(),
			        $method->getModifiers(),
			        implode(' ', Reflection::getModifierNames($method->getModifiers()))
		);
		ChromePhp::log($data);
	}

	$firephp = FirePHP::getInstance(true);
/* 	
		how to use
		 = array('i'=>10, 'j'=>20);
		->log(, 'Iterators');
		
		fb();
		FB::info(, 'Label');
	*/
	/*firephp declare end*/
    function class_info($instance)
    {
        $data = array();
        $data['class']          = get_class($instance);
        $data['parent_class']   = get_parent_class($instance);
        $data['methods']        = get_class_methods(get_class($instance));
        $data['vars']           = get_object_vars($instance);
        return $data;
    }
	function get_info($instance,$method)
	{
		//$method = new ReflectionMethod(get_class($item), 'getPromotion');
		$method = new ReflectionMethod(get_class($instance), $method);
		$data = sprintf  (
			    "===> The %s%s%s%s%s%s%s method '%s' (which is %s)\n" .
			    "     declared in %s\n" .
			    "     lines %d to %d\n" .
			    "     having the modifiers %d[%s]\n",
			        $method->isInternal() ? 'internal' : 'user-defined',
			        $method->isAbstract() ? ' abstract' : '',
			        $method->isFinal() ? ' final' : '',
			        $method->isPublic() ? ' public' : '',
			        $method->isPrivate() ? ' private' : '',
			        $method->isProtected() ? ' protected' : '',
			        $method->isStatic() ? ' static' : '',
			        $method->getName(),
			        $method->isConstructor() ? 'the constructor' : 'a regular method',
			        $method->getFileName(),
			        $method->getStartLine(),
			        $method->getEndline(),
			        $method->getModifiers(),
			        implode(' ', Reflection::getModifierNames($method->getModifiers()))
			);
		fb($data, FirePHP::TRACE);
	}
	

    // $firephp->trace($data, $item->getPromotion());  // or FB::