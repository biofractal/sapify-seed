require 'shelljs/global'
args = require 'commander'

args
	.version('0.0.1')
	.option('-n, --name [name]', 'The name of your project', 'project')
	.option('-a, --api [api]', 'The port used by the api', '3000')
	.option('-p, --proxy [proxy]', 'The port used by the proxy', '3001')
	.option('-l, --location [location]', 'The project folder will be placed here. The default is the current location.', pwd())
	.parse(process.argv)

if args.location.indexOf('Development\\make') > -1
	console.log 'Fatal Error: You are about to try and make a project inside the "make" folder. This can lead to a recursive folder hierarchy'
	exit 0

target = "#{args.location}\\#{args.name}"
source = "X:\\Development\\make\\files"

if test '-d', target
	console.log "Fatal Error: The folder: '#{target}' already exists. Please delete or move it and try again."
	exit 0

console.log "-------------------"
console.log "Name: #{args.name}"
console.log "API:"
console.log "   port: #{args.api}"
console.log "   path: #{target}\\api"
console.log "Client:"
console.log "   port: #{args.proxy}"
console.log "   path: #{target}\\client"
console.log "-------------------"
console.log ""
console.log "copying files to: #{target}"
mkdir '-p', target
cp '-r',"#{source}\\*", target

console.log "replacing name and ports in project files"
files = find(target).filter (file)->
	file.match(/\.env$/) or
	file.match(/\.coffee$/) or
	file.match(/\.jade$/) or
	file.match(/\.json$/) or
	file.match(/\.md$/)

for file in files
	sed '-i', '@@project', args.name, file
	sed '-i', '@@proxy', args.proxy, file
	sed '-i', '@@api', args.api, file
console.log "-------------------"

cd target

installModules=(pm, target)->
	console.log find and "Installing #{pm} modules ..."
	child = exec "#{pm} install", {async:true}
	child.stderr.on 'data', (data)-> console.log 'stderr', data
	child.on 'close', (code) ->
		if code is 0
			console.log "----------------------------------------"
			console.log "#{target} #{pm} modules successfully installed!"
			console.log "----------------------------------------"


cd 'api'
installModules 'npm', 'API'
cd '..'

cd 'client'
installModules 'npm', 'Client'
installModules 'bower', 'Client'
cd '..'

exec "sublime_text .", {async:true}