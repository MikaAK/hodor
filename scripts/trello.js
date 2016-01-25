module.exports = function(robot) {
  var KEY = process.env.TRELLO_KEY,
      SECRET = process.env.TRELLO_SECRET,
      nTrello = require('node-trello'),
      Trello = new nTrello(KEY, SECRET)

  Trello.post
}
