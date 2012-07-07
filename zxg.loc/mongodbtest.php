<?php
//error_reporting(E_ALL^E_NOTICE);
$m = new Mongo();
$db = $m->comedy;
$coll = $db->cartoons;
/*
$obj = array( "title" => "Calvin and Hobbes", "author" => "Bill Watterson" );
$coll->insert($obj);
$obj = array( "title" => "XKCD", "online" => true );
$coll->insert($obj);
*/

function to_a($cursor)
{
	$res = iterator_to_array($cursor);
	if (!empty($res)) {
		echo '----------'."<br/>";
		foreach ($res as $obj) {
		    echo $obj["title"] . "\n";
		    echo $obj["_id"] . "\n";
		}
	}
	return $res;
}
function mongodb_ids_to_a( $db_ids = array() ){
		
		$in_values = array();
		foreach ($db_ids as $dbid) {
			$in_values[] = new mongoId($dbid);
		}
		if (empty($in_values)) {
			return $db_ids;
		}
		return $in_values;
}

$cursor = $coll->find(
	array(
		'title'=>array(
			'$in'=>array('Calvin and Hobbes','XKCD')
		)
	)
);
//to_a($cursor);


$mongoids = mongodb_ids_to_a(array('4fadd961cdfd395818000001','4fadd961cdfd395818000002'));
$cursor = $coll->find(
	array(
		'_id'=>array(
			'$in'=>$mongoids
		)
	)
);
$res = to_a($cursor);
die(var_dump( '$res',$res ));