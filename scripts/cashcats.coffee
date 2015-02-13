# Description: Cashcat. Just like pug bombing, but with flava
#
# Dependencies:
#   "lodash": "^3.2.0"

# Commands:
#   hubot cashcat

module.exports = (robot) ->
  robot.hear /cashcat/i, (msg) ->
    robot.http('https://api.instagram.com/v1/users/52333855/media/recent/?access_token=1703351146.1677ed0.3f7033c15ff24daf86304fc5badeb903')
      .get() (err, res, body) ->
        jsonBody = JSON.parse(body)
        msg.send require('lodash').sample(jsonBody.data).images.standard_resolution.url
