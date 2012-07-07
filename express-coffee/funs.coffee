get_unix_timestamp = ->
	Math.round new Date().getTime() / 1000

get_date_from_unix_timestamp = (unix_timestamp)->
	new Date unix_timestamp * 1000