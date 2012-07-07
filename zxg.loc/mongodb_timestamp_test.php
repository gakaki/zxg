<?php
		var_dump(123123123);die;
		ini_set('display_errors',1);
		
		$time = time();
		$date = date();
		$mongo_date = new MongoDate();

		var_dump($time,$date,$mongo_date);die;