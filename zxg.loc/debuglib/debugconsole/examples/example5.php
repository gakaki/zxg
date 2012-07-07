<?php
/**
 * debugConsole demonstration
 * 
 * This script demonstrates the variable watches
 * WARNING: Will crash on Windows-Systems
 *
 * @author Andreas Demmer <info@debugconsole.de>
 * @see <http://www.debugconsole.de>
 * @version 1.0.0
 * @package debugConsole_1.3.0
 */

echo '<h1>debugConsole Demonstration</h1>';

/* load debugConsole functionality */
require_once '../debugConsole.php';

/* test watches */
dc_watch('foo');
dc_watch('bar');

declare (ticks = 1) {
	$foo = '1';
	$foo++;
	
	$bar = $foo;
	$bar += 3;

	$foo --;
}

echo '<p>Testdrive completed!</p>';
?>