
mongo = require 'mongoskin'
db	  = mongo.db 'localhost:27017/zxg'
news  = db.collection 'news'


(data = 2) ->
	console.log 'data',data



#t = new mongo.Timestamp
#console.log 't',t,t.toJSON(),t.toInt(),t.toNumber(),t.toString()



[1..5].map (i)->
	row = 
		title:"title#{i}", 
		content:"content#{i}", 
		created_at:new Date(), 
		updated_at:new Date(),
		#addtime:new mongo.Timestamp()
		addtime:funs.get_unix_timestamp()
	news.insert row

'''
start = new Date(2012,5,1)
end = new Date(2012,6,1)
where =  "created_at": "$gte": start, "$lt": end

news.find(where).toArray (err, items) ->
	console.log 'items range',items
'''

end = funs.get_date_from_unix_timestamp(1338532555)
where =  "created_at": $lte: end
console.log 'where',where
news.find(where).toArray (err, items) ->
	console.log 'items lte',items
	console.log JSON.stringify items

'''
test_date.find().toArray (err, items) ->
	items.map ( item ) ->
		data_id = item['_id']
		timestamp = data_id.toString().substring(0,8)
		date = new Date( parseInt( timestamp, 16 ) * 1000 )
		
		console.log 'timestamp',timestamp,'date',date,'item',item
		
		current_timestamp = Date.parse(new Date());
		console.log 'current_timestamp',current_timestamp
'''
	

