<?php
/**
 * debugConsole includes
 *
 * @author Andreas Demmer <info@debugconsole.de>
 * @see <http://www.debugconsole.de>
 * @version 1.1.0
 * @package debugConsole_1.3.0
 */

/* PHP5 required */
if (version_compare(PHP_VERSION, '5.0.0') < 0) {
	die('The debugConsole requires PHP 5.x.x or greater.');
}

$path = dirname(__FILE__) . '/';

require_once $path . 'debugConsole.config.php';
require_once $path . 'debugConsole.class.php';
require_once $path . 'debugConsole.functions.php';
?>