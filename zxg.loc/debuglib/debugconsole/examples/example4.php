<?php
/**
 * debugConsole demonstration
 * 
 * This script demonstrates the timer clock
 *
 * @author Andreas Demmer <info@debugconsole.de>
 * @see <http://www.debugconsole.de>
 * @version 1.0.0
 * @package debugConsole_1.3.0
 */

echo '<h1>debugConsole Demonstration</h1>';

/* load debugConsole functionality */
require_once '../debugConsole.php';

/* test timer clocks */
$timer1 = dc_start_timer('first timer:');
$timer2 = dc_start_timer('second timer:');

sleep(1);
dc_stop_timer($timer1);

sleep(1);
dc_stop_timer($timer2);


echo '<p>Testdrive completed!</p>';
?>