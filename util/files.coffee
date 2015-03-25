require 'shelljs/global'
args = require './arguments'
print = require './print'

module.exports=

	copySource:->
		print.line "copying files to: #{args.target}"
		mkdir '-p', args.target
		cp '-r',"#{args.source}\\*", args.target

	replaceTokens:->
		print.line "replacing name and ports in project files"
		files = find(args.target).filter (file)->
			file.match(/\.env$/) or
			file.match(/\.coffee$/) or
			file.match(/\.jade$/) or
			file.match(/\.json$/) or
			file.match(/\.md$/)
		for file in files
			sed '-i', '@@project', args.projectName, file
			sed '-i', '@@proxy', args.proxyPort, file
			sed '-i', '@@api', args.apiPort, file

	build:(path)->
		cd path
		require "#{path}\\build"

	open:(path)->
		cd path
		exec "sublime_text .", {async:true}