# Description: Top change speak
#
# Dependencies:
#   "lodash": "^3.2.0"

responses = ['? Why did you change it?', '? What the heck is that?!', '... so boring...', '? Your not interesting']

module.exports = (robot) ->
  robot.topic (msg) ->
    msg.send "#{msg.message.text}" + require('lodash').sample(responses)
