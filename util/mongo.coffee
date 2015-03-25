require 'shelljs/global'
args = require './arguments'
print = require './print'

module.exports=
	generateTestData:(next)->
		exec("mongo #{args.mongo}/#{args.projectName} #{args.base}\\util\\users.js", {async:true})
		.on 'close', (code)->
			if code isnt 0
				print.error "Mongo test data could not be generated. Please make sure you have mgod listening on #{args.mongo}"
			else
				next()