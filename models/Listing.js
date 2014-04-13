var mongoose = require('mongoose');

var listingSchema = new mongoose.Schema({
  uid: String,
  uname: String,
  title: String,
  description: String,
  picture: String,
  messages: Array,
  bought: Boolean
});

module.exports = mongoose.model('Listing', listingSchema);
