var mongoose = require('mongoose');

var commentSchema = new mongoose.Schema({
  text: String,
  user: String, // Twitter ID
  timestamp: Date
});

module.exports = mongoose.model('Comment', commentSchema);
