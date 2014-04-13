var mongoose = require('mongoose');

var listingSchema = new mongoose.Schema({
  title: String,
  description: String,
  picture: String,
  message: Array,
  bought: Boolean
});

module.exports = mongoose.model('Listing', listingSchema);
