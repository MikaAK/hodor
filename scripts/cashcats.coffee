# Cashcatme. Just like pug bombing, but with flava
#
# cashcat me - Receive a cashcat
# cashcat bomb N - get N cashcats

module.exports = (robot) ->
  robot.respond /cashcat me/i, (msg) ->
    msg.http("http://cashcats.biz/")
      .get() (err, res, body) ->
        msg.send body
