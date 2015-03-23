args = require 'commander'

args
	.version('1.0.0')
	.option('-n, --name [name]', 'The name of your project', 'project')
	.option('-a, --api [api]', 'The port used by the api', '3000')
	.option('-p, --proxy [proxy]', 'The port used by the proxy', '3001')
	.option('-l, --location [location]', 'The project folder will be placed here. The default is the current location.', pwd())
	.parse(process.argv)

base = args['rawArgs'][1]
args.base = "#{base.slice 0, base.lastIndexOf '\\'}"
args.source = "#{args.base}\\src"
args.target = "#{args.location}\\#{args.name}"

module.exports = args