args = require 'commander'

#gather commandline arguments
args
	.option('-n, --project-name <name>', 'The name of your project [socket-sauce-test]', 'socket-sauce-test')
	.option('-l, --project-location <folder>', 'The top-level project folder will go here [current location].', pwd())
	.option('-m, --mongo <url>', 'The mongodb url. [localhost:27017]', 'localhost:27017')
	.option('-a, --api-port <number>', 'The port used by the api [3000]', '3000')
	.option('-p, --proxy-port <number>', 'The port used by the proxy [3001]', '3001')
	.parse(process.argv)

#set paths
base = args['rawArgs'][1]
args.base = "#{base.slice 0, base.lastIndexOf '\\'}"
args.source = "#{args.base}\\src"
args.target = "#{args.projectLocation}\\#{args.projectName}"
args.api = "#{args.target}\\api"
args.client = "#{args.target}\\client"

#check project location is valid
if args.projectLocation is args.base
	print.error 'You cannot make a project inside the socket-sauce-seed source folder. see --help for instructions.'
else if test '-d', args.target
	print.error "The folder: '#{args.target}' already exists. Please delete or move it and try again."

module.exports = args