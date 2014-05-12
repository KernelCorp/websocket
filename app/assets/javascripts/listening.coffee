$ ->
  dispatcher = new WebSocketRails 'localhost:3000/websocket'

  channel = dispatcher.subscribe 'channel'

  console.log 'start listening...'

  operators = $('#q_operator_id').children()

  channel.bind 'trigger', ->
    alert 'trigger'
    console.log 'triggered'
    return

  return
