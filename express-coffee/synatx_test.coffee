list = (where=null,pageNumber=1, page_size = 10 ,error_code=null,error_message=null) ->
  skip_num 	 = (pageNumber-1)*page_size
	data 		= news.find(where).skip(skip_num).limit(page_size)
	count  	= data.length ? 0
	total 	= news.count(where) ? 0
	if count > 0
		status = 1
	else
		status = 0
	json_data = 
		'count'  : count
		'data' 	 : data
		'error_code':error_code
		'error_message':error_message
		'page' 	 : page
		'page_size' : page_size
		'status': status
		'total' : total
		'where'	: where