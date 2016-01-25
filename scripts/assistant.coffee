path = require('path')
_ = require('lodash')
AI = require('apiai')

CANT_FIND_RESPONSE = [
  "Sorry I can't understand what you asked, can you try rephrasing it?",
  "Sorry I don't quite get what you mean.",
  "I'm not able to do that sorry"
]

opts = {
  lang: 'en',
  timezone: 'America/Vancouver'
}

if (process.env.NODE_ENV == 'development')
  require('dotenv').load({path: path.resolve(__dirname, '../.env')})

bot = AI(process.env.AI_AUTH_KEY, process.env.AI_SUB_KEY)

module.exports = (robot) ->
  makeQuery = (query, msg) ->
    request = bot.textRequest(query.trim(), opts)
    request.on 'response', (res) ->
      result = res.result

      if (result.fulfillment.speech)
        msg.send(result.fulfillment.speech)
      else
        msg.send(_.sample(CANT_FIND_RESPONSE))

    request.on 'error', (err) -> msg.send('There was an error!', err)
    request.end()

  robot.respond /(check|what|search|lookup|define|how|who|what)/i, (msg) ->
    makeQuery(msg.message.text, msg)

