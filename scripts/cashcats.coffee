# Cashcatme. Just like pug bombing, but with flava
#
# cashcat - Receive a cashcat

module.exports = (robot) ->
  robot.respond /cashcat/i, (msg) ->
    msg.http('https://api.instagram.com/v1/users/52333855/media/recent/?access_token=1703351146.1677ed0.3f7033c15ff24daf86304fc5badeb903')
      .get() (err, res, body) ->
        jsonBody = JSON.parse(body).data
        msg.send "NOOB"
        msg.send _.sample
        msg.send jsonBody
        msg.send _.sample(data.images.standard_resolution.url)
