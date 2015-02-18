location = '49.2830210,-123.1067440'
timeZone = '-480'

module.exports = (robot) ->
  robot.respond /assist/i, (msg) ->
    messageText = msg.message.text.split(' ').filter((word) -> word != 'hodor').join(' ')
    data =
      input:    messageText
      location: location
      timeZone: timeZone

    robot.http('https://jeannie.p.mashape.com/api')
      .get(data) (err, res, body) ->
        console.log 'hi'
        # jsonBody = JSON.parse(body)
        # msg.send jsonBody.output.actions.say.text
