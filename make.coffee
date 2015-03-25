require 'shelljs/global'
args = require './util/arguments'
files = require './util/files'
mongo = require './util/mongo'
packages = require './util/packages'

#generate the mongodb and some test user data
mongo.generateTestData ->
	#copy all the source files and do token replacements
	files.copySource()
	files.replaceTokens()
	#install npm and bower packages
	packages.install ->
		#open sublime
		files.open args.target
		#build and run project components
		files.build args.api
		files.build args.client