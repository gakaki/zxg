<?php
/**
 * debugConsole demonstration
 * 
 * This script demonstrates checkpoints
 *
 * @author Andreas Demmer <info@debugconsole.de>
 * @see <http://www.debugconsole.de>
 * @version 1.0.0
 * @package debugConsole_1.3.0
 */

echo '<h1>debugConsole Demonstration</h1>';

/* load debugConsole functionality */
require_once '../debugConsole.php';

/* test checkpoints */
dc_here('Now we check the daytime...');

if (date('H') >= 12) {
    dc_here('It is after noon!');     
} else {
    dc_here('It is before noon!');
}

echo '<p>Testdrive completed!</p>';
?>