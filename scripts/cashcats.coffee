# Description: Cashcat. Just like pug bombing, but with flava
#
# Commands:
#   hubot cashcat

igKey = process.env.INSTAGRAM_KEY

module.exports = (robot) ->
  robot.hear /cashcat/i, (msg) ->
    robot.http('https://api.instagram.com/v1/users/52333855/media/recent/?access_token=#{igKey}')
      .get() (err, res, body) ->
        jsonBody = JSON.parse(body)
        msg.send msg.random(jsonBody.data).images.standard_resolution.url
