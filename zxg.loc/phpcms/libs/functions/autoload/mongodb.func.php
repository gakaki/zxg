<?php  


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