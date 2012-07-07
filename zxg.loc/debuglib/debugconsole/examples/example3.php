<?php
/**
 * debugConsole demonstration
 * 
 * This script demonstrates the errorhandler capabilities
 *
 * @author Andreas Demmer <info@debugconsole.de>
 * @see <http://www.debugconsole.de>
 * @version 1.0.0
 * @package debugConsole_1.3.0
 */

echo '<h1>debugConsole Demonstration</h1>';

/* load debugConsole functionality */
require_once '../debugConsole.php';

/* debugConsole must be open to take over errorhandling */
dc_here('Now we catch some PHP error-events:');

/* test errorhandling notics */
echo $notSet;

/* test errorhandling warnings */
fopen('not existing!', 'r');

echo '<p>Testdrive completed!</p>';
?>