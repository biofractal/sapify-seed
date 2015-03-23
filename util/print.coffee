require 'shelljs/global'
safeExit = require 'exit'

module.exports =

	finished:(args, target)->
		console.log ""
		console.log "Name  : #{args.name}"
		console.log "DB    : mongodb://localhost:27017/#{args.name}"
		console.log ""
		console.log "api"
		console.log "  port: #{args.api}"
		console.log "  path: #{target}\\api"
		console.log ""
		console.log "client"
		console.log "  port: #{args.proxy}"
		console.log "  path: #{target}\\client"
		console.log ""
		console.log "--------------------------------------"
		console.log "        Finished Successfully!"
		console.log "--------------------------------------"
		console.log ""

	installed:(pm, template)->
		console.log "--------------------------------------"
		console.log "    #{template} #{pm} modules installed"
		console.log "--------------------------------------"

	error:(msg)->
		console.log ""
		console.log " ERROR"
		console.log " -----"
		console.log " #{msg}"
		safeExit 1


	line:(msg)->
		console.log ""
		console.log " #{msg}"
