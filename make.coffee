require 'shelljs/global'
args = require './util/arguments'
print = require './util/print'
files = require './util/files'
packages = require './util/packages'

#check project location is valid
if args.location is args.base
	print.error 'You are trying to make a project inside the socket-sauce-seed source folder.'
else if  test '-d', args.target
	print.error "The folder: '#{args.target}' already exists. Please delete or move it and try again."
else
	#generate the mongodb and some test user data
	exec("mongo localhost:27017/#{args.name} #{args.base}\\util\\mongodb.js", {async:true})
	.on 'close', (code)->
		if code isnt 0
			print.error "Mongo test data could not be generated. Please make sure you have mgod listening on localhost:27017"
		else
			#copy all the source files and do token replacements
			files.copySource()
			files.replaceTokens()
			#install npm and bower packages
			packages.install ->
				#open sublime
				cd args.target
				exec "sublime_text .", {async:true}
				#build and run project components
				cd "#{args.target}\\api\\"
				require "#{args.target}\\api\\build"
				cd "#{args.target}\\client\\"
				require "#{args.target}\\client\\build"


