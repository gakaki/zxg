<?php
/**
 * debugConsole demonstration
 * 
 * This script demonstrates variable debugging
 *
 * @author Andreas Demmer <info@debugconsole.de>
 * @see <http://www.debugconsole.de>
 * @version 1.0.0
 * @package debugConsole_1.3.0
 */

echo '<h1>debugConsole Demonstration</h1>';

/* load debugConsole functionality */
require_once '../debugConsole.php';

/* test variable debugging */
$foo = 'Hello World!';
dc_dump($foo, '$foo wants to say something:');

/* test variable debugging again */
$bar = 42.0;
dc_dump($bar, '$bar tells us the meaning of life:');

/* test array debugging */
$foobar = array (
	'foo' => $foo,
	'bar' => $bar
);

dc_dump($foobar, '$foobar is a neat array!');

echo '<p>Testdrive completed!</p>';
?>