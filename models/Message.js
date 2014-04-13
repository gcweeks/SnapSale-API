var mongoose = require('mongoose');

var messageSchema = new mongoose.Schema({
  text: String,
  user: String, // Twitter ID
  timestamp: Date
});

module.exports = mongoose.model('Message', messageSchema);
