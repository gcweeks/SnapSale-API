var mongoose = require('mongoose');

var areaSchema = new mongoose.Schema({
  name: { type: String, unique: true },
  listings: Array
});

module.exports = mongoose.model('Area', areaSchema);
