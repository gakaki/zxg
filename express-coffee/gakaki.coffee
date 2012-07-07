#	use zxg;
# db.news.find({"just_date": {"$gt": new Date(2012, 5, 30)}})
# new Date(2012, 4, 30).get()
# db.news.find({"updated_at": {"$gt": new Date(2012, 4, 30).getTime()}})
# ext mail http://www.mzone.cc/article/584.html
# http://www.mzone.cc/article/584.html
#http://www.yiyou.org/docs/centos_extmail_01/

process.env.TZ = 'PRC'
#sudo npm install -g mongodb express mongodb-dust form mongoskin
express 	= require 'express'
params 		= require 'express-params'
mongo 		= require 'mongodb'
assets 	  = require 'connect-assets'
Sequelize = require "sequelize"
sequelize = new Sequelize 'shopex', 'root'
# time 			= require 'time'

date_now = ->
	d= new Date()
	'''
	localTime = d.getTime()
	localOffset =d.getTimezoneOffset()*60000
	utc = localTime + localOffset
	offset = 8
	china = utc + (3600000*offset)
	nd = new Date(china)
	'''
	d.setHours(d.getHours() + 8)
	d

get_unix_timestamp = ->
	Math.round new Date().getTime() / 1000

get_date_from_unix_timestamp = (unix_timestamp)->
	new Date unix_timestamp * 1000

get_unix_timestamp_local = ->
	date = new Date()
	ts = String(Math.round(date.getTime() / 1000) + date.getTimezoneOffset() * 60)



# get_now_str = ->
# 	now  = new time.Date()
# 	now.setTimezone "PRC"
# 	console.log 'now',now
# 	now.toString()

mongoskin 	= require 'mongoskin'
qs = require 'querystring'

db = mongoskin.db(process.env.MONGODB_URL || 'localhost:27017/zxg')
news = db.collection('news')
users = db.collection('users')

app = express.createServer()
params.extend app 
app.set 'view engine', 'eco'
app.use assets()
app.use express.static(__dirname + '/public')
app.use express.bodyParser();

'''
  news.find().toArray (err, news) ->
    console.log 'news',news
		(Number) '1'
		
'''

printNews = (where,page=1, page_size=10) ->
  skip_num 	 = (page-1)*page_size
  console.log "Page is: ",page
  console.log "where is:",where
  news.find(where).skip(skip_num).limit(page_size)

current_version = 2.3
app_store_url = "http://itunes.apple.com/us/app//id481942451?l=zh&ls=1&mt=8"
app_force_update = 0
is_need_update = (version) ->
	version_compare = parseFloat(version) < current_version ? true:false

list = (data,page=1, page_size = 10 ,error_code=null,error_message=null) ->
	count  	= data.length ? 0
	if count > 0  
		status = 1
	else
	  status = 0
	
	json_data = 
		count  : count
		data 	 : data
		error_code:error_code
		error_message:error_message
		page 	 : page
		page_size : page_size
		status: status
		#'total' : total

app.get '/update', (req, res) ->
	final_res = 
		status : 'success' 
		msg : "目前已经有新的版本#{current_version},请下载更新"
		force_update:app_force_update
		url:app_store_url
		version:current_version
	cv = req.query.client_version
	console.log 'cv',cv
	unless cv
		final_res['msg'] = '请提供客户端版本号'
		final_res['status'] = 0
	
	if is_need_update cv
		final_res['needupdate'] = 1 
	else 
	  final_res['needupdate']	= 0
	res.send final_res

app.post '/user', (req, res) ->
	post_data = req.body
	
	data =
		name:post_data.user_name
		pwd:post_data.pwd
		udid:post_data.udid
		mobile:post_data.mobile
		created_at:new Date()
		updated_at:new Date()
	
	console.log 'data',data
	
	users.insert(data)
	res.send data

app.post '/user/verify', (req, res) ->
	post_data = req.body

	data =
		name:post_data.user_name
		pwd:post_data.pwd
		mobile:post_data.mobile
	console.log 'data',data

	where = 
		$or:[
			{name : data.name
			pwd:data.pwd},
			{mobile:data.mobile
			pwd:data.pwd}
		]

	users.find(where).toArray (err, user_data) ->
		console.log 'user_data',user_data,where
		find_result = 
			status : 'success'
		unless user_data
			find_result['status'] = 'fail'
		find_result['data'] = user_data
		res.send find_result
		

app.get '/test/insert_data', (req, res) ->
	news.drop()
	[1..30].map (i) -> 
		type = 'gakaki'
		if i > 22
			type = 'amanda'
		else if i > 15
			type = 'bb'
		else if i > 7
			type = 'guy'
		else if i > 3
			type = 'mary'
			
		row = 
			title:"title#{i}"
			content : "content#{i}"
			type:type
			created_at:date_now()
			updated_at:date_now()

		news.insert row
		 
	news.find().toArray (err, items) ->
		res.send items #or res.send JSON.stringify items they are all same

app.get '/news/list/:data?', (req, res) ->
	query = req.query
	unless query.type
		where  = null
	else
		where  = type:	query.type
	
	cursor	 = printNews where,query.page,10
	cursor.toArray (err, news) ->
		res.send list news,query.page,10

app.post '/news/list/:data?', (req, res) ->
	console.log 'req.body',req.body
	console.log 'req.params',req.params
	res.send req.body

app.get '/product/add', (request, response) ->
  if request.param 'brand'
    db.product.find({"brand":request.param 'brand'}).toArray (err, products) =>
      response.render 'product/add', {products: products}
  else
    db.product.find().toArray (err, products) =>
      response.render 'product/add', {products: products}


app.get '/shopex/brand/insert_data', (req, res) ->
	

app.listen 3000

