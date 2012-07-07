#node time https://github.com/TooTallNate/node-time
process.env.TZ = 'PRC'
offset  = new Date().getTimezoneOffset()
moment = require 'moment'
now = moment()
console.log 'now',now
console.log 'offset',offset
console.log 'new Date()',new Date().toLocaleTimeString() 


time = require 'time'
now  = new time.Date()
now.setTimezone "PRC",true
console.log now.toString()
console.log 'now',now

d = new Date();
time.extend(d);
d.setTimezone("PRC");
console.log 'd.toString()',d.toString()
console.log 'time.time()',time.time()
console.log 'time_str',d.toLocaleString()
console.log 'new Date',new Date(d.toString()).toJSON()



mongo = require 'mongodb'
t = new mongo.Timestamp()
console.log 't',t
console.log 't.toJSON',t.toString()