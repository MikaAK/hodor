# Cashcatme. Just like pug bombing, but with flava
#
# cashcat me - Receive a cashcat
# cashcat bomb N - get N cashcats

module.exports = (robot) ->
  robot.respond /cashcat me/i, (msg) ->
    msg.http("http://cashcatme.heroku.com/bomb?count=1")
      .get() (err, res, body) ->
        msg.send JSON.parse(body).cats

  robot.respond /cashcat bomb( (\d+|π))?/i, (msg) ->
    count = msg.match[2] || 5
    count = 3 if count == "π"
    msg.http("http://cashcatme.heroku.com/bomb?count=" + count)
      .get() (err, res, body) ->
        msg.send cat for cat in JSON.parse(body).cats
