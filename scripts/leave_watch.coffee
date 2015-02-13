enterReplies = ['Hi ', 'Target Acquired, focusing: ', 'Hello ', 'Gotcha ', 'I see you ', 'Welcome ', 'How are you today ']
leaveReplies = ['Are you still there? ', 'Target lost ', 'Searching for ']
getName = (msg) ->
  name = "#{msg.message.user.name}".split " "
  return name[0]


module.exports = (robot) ->
  robot.enter (msg) ->
    name = getName msg
    msg.send msg.random(enterReplies) + name
  robot.leave (msg) ->
    name = getName msg
    msg.send msg.random(leaveReplies) + name
