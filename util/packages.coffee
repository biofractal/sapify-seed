require 'shelljs/global'
args = require './arguments'
print = require './print'


syncCount=0
installPackageModules=(pm, template, next)->
	syncCount++
	print.line "Installing #{pm} modules ..."
	child = exec "#{pm} install", {async:true}
	child.stderr.on 'data', (data)-> console.log 'stderr', data
	child.on 'close', (code) ->
		if code is 0
				print.installed pm, template
			syncCount--
			if syncCount is 0
				print.finished args, args.target if syncCount is 0
				next()

module.exports=

	install:(next)->
		cd "#{args.target}\\api"
		installPackageModules 'npm', 'api', next

		cd "#{args.target}\\client"
		installPackageModules 'npm', 'client', next
		installPackageModules 'bower', 'client', next
