$ ->
  dispatcher = new WebSocketRails 'ws://websocket.kerweb.ru/websocket'

  channel = dispatcher.subscribe 'channel'

  console.log 'start listening...'

  operators = $('#q_operator_id').children()

  channel.bind 'trigger', ->
    alert 'trigger'
    console.log 'triggered'
    return

  return
