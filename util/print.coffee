require 'shelljs/global'
safeExit = require 'exit'

module.exports =

	finished:(target)->
		args = require './arguments'
		console.log ""
		console.log "Name  : #{args.projectName}"
		console.log "DB    : mongodb://localhost:27017/#{args.projectName}"
		console.log ""
		console.log "rest api"
		console.log "  port: #{args.apiPort}"
		console.log "  path: #{args.target}\\api"
		console.log ""
		console.log "angular client & node proxy"
		console.log "  port: #{args.proxyPort}"
		console.log "  path: #{args.target}\\client"
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
