# HTTP server
server = require('http').createServer (req, res) ->
  winston.info "#{res.statusCode} #{req.method.toUpperCase()} #{req.url}"
  res.end "hello node!"
server.on 'error', (err) ->
  winston.error "Address is already in use\n" if err.code == 'EADDRINUSE'

# logger
winston = require 'winston'
winston.add winston.transports.File, filename: 'logs/app.log', level: 'silly'


port = process.argv[2] || 8000
module.exports = 
  start: ->
    server.listen port, ->
      winston.info "Server listening on port #{port}\n"
