responses = ['? Why did you change it?', '? What the heck is that?!', '... so boring...', '? Your not interesting']

module.exports = (robot) ->
  robot.topic (msg) ->
    msg.send "#{msg.message.text}" + msg.random(responses)
