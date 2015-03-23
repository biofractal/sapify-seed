require('dotenv').load()
express = require 'express'
winston = require 'winston'
sockets = require 'socket-sauce-proxy'

#app
app = express()
app.use express.static 'lib/angular'
app.use express.static 'lib/public'
app.use express.static 'bower_components'

#socketed app start
sockets.apiConnect process.env.MICRO_API if !!process.env.MICRO_API
sockets.getServer(app, './lib/proxy/model').listen process.env.NODE_PORT, ->
	winston.info "socketed proxy server listening on port #{process.env.NODE_PORT}"

