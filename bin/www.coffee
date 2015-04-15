###*
# Module dependencies.
###

app = require('../app')
debug = require('debug')('coffeepress:server')
http = require('http')

###*
# Get port from environment and store in Express.
###

port = normalizePort(process.env.PORT or '3000')

###*
# Normalize a port into a number, string, or false.
###

normalizePort = (val) ->
  lport = parseInt(val, 10)
  if isNaN(lport)
    # named pipe
    return val
  if lport >= 0
    # port number
    return lport
  false

###*
# Event listener for HTTP server "error" event.
###

onError = (error) ->
  if error.syscall != 'listen'
    throw error
  bind = if typeof port == 'string' then 'Pipe ' + port else 'Port ' + port
  # handle specific listen errors with friendly messages
  switch error.code
    when 'EACCES'
      console.error bind + ' requires elevated privileges'
      process.exit 1
    when 'EADDRINUSE'
      console.error bind + ' is already in use'
      process.exit 1
    else
      throw error
  return

###*
# Event listener for HTTP server "listening" event.
###

onListening = ->
  addr = server.address()
  bind = if typeof addr == 'string' then 'pipe ' + addr else 'port ' + addr.port
  debug 'Listening on ' + bind
  return

app.set 'port', port

###*
# Create HTTP server.
###

server = http.createServer(app)

###*
# Listen on provided port, on all network interfaces.
###

server.listen port
server.on 'error', onError
server.on 'listening', onListening
