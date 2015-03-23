request = require 'request'

module.exports =

	getAll:(event, next)->
		request.get "#{process.env.MICRO_API}/user", (err, response, data)->
			next data

	getById:(event, next)->
		request.get "#{process.env.MICRO_API}/user/#{event.params.id}", (err, response, data)->
			next data

	changeAge:(event, next)->
		url = "#{process.env.MICRO_API}/user/#{event.params.id}"
		patch =[
			"op": "test", "path": "/age", "value": event.params.age
		,
			"op": "replace", "path": "/age", "value": event.params.age + event.params.delta
		]
		options = url:url, json:true, body:patch, headers:'socket-id': event.socketId
		request.patch options, (err, response, data)->
			next data
