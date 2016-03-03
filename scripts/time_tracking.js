'use strict'

var schedule = require('node-schedule')
var TIME_TRACKING_URL = process.env.TIME_TRACKING_URL

module.exports = function(robot) {
  schedule.scheduleJob({hour: 11, minute: 50, dayOfWeek: [1, 2, 3, 4, 5]}, function() {
    robot.messageRoom('development', "Don't forget to update your time tracking at: " + TIME_TRACKING_URL)
  })
}
