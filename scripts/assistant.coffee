path = require('path')
_ = require('lodash')
AI = require('apiai')

opts = {
  lang: 'en',
  timezone: 'America/Vancouver'
}

if (process.env.NODE_ENV == 'development')
  require('dotenv').load({path: path.resolve(__dirname, '../.env')})

bot = AI(process.env.AI_AUTH_KEY, process.env.AI_SUB_KEY)

module.exports = (robot) ->
  makeQuery = (query, msg) ->
    request = bot.textRequest(query.trim())
    request.on 'response', (res) ->
      console.log(res.result)
      msg.send(res.result.fulfillment.speech)
    request.on 'error', (err) -> msg.send('There was an error!', err)
    request.end()

  robot.respond /check/i, (msg) ->
    makeQuery(msg.message.text, msg)

