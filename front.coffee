# HTTP server
server = require('http').createServer (req, res) ->
  res.end "hello node!"
server.on 'error', (err) ->
  console.log "Address is already in use\n" if err.code == 'EADDRINUSE'


port = process.argv[2] || 8000
module.exports = 
  start: ->
    server.listen port
