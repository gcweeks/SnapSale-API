_ = require("underscore")
async = require("async")
Area = require("../models/Area")
Comment = require("../models/Comment")
Listing = require("../models/Listing")
Mobile = require("../models/Message")
User = require("../models/User")

###
POST /
Reset
###
exports.postReset = (req, res) ->
  Listing.remove {}, (err) ->
    if err
      res.json return: 0
    res.json return: 1
  res.json return: 0

###
GET /
Areas
###
exports.getAreas = (req, res) ->
  arr = {"UCLA"}
  res.json areas: arr

###
GET /
Listings
###
exports.getListings = (req, res) ->
  Listing.find {}, (err, listings) ->
    res.json listings: listings

###
POST /
Listing
###
exports.postListing = (req, res) ->
  User.findById req.body.uid, (err, user) ->
    if err
      res.json return: 0
    listing = new Listing(
      uid: req.body.uid
      uname: user.profile.name
      title: req.body.title
      description: req.body.description
      picture: ""
      messages: []
      bought: false
    )
    listing.save (err) ->
      if err
        res.json return: 0
      res.json return: 1

###
POST /
Buy
###
exports.postBuy = (req, res) ->
  Listing.findById req.body.id, (err, listing) ->
    listing.bought = true
    listing.save (err) ->
      if err
        res.json return: 0
      res.json return: 1

###
POST /
Relist
###
exports.postRelist = (req, res) ->
  Listing.findById req.body.id, (err, listing) ->
    return next(err)  if err
    listing.bought = false
    listing.save (err) ->
      if err
        res.json return: 0
      res.json return: 1

###
POST /
Message
###
exports.postMessage = (req, res) ->
  Listing.findById req.body.id, (err, listing) ->
    return next(err)  if err
    message = new Message(
      text: req.body.text,
      user: req.body.user, # Twitter ID
      timestamp: new Date()
    )
    message.save (err) ->
      if err
        res.json return: 0
      messages = listing.messages
      messages.push message
      listing.set
        messages: req.body.one
      listing.save (err) ->
        if err
          res.json return: 0
        res.json return: 1

###
POST /
Comment
###
exports.postComment = (req, res) ->
  # listing = find Listing

  # comment = new Comment(
  #   one: req.body.one
  #   two: req.body.two
  # )
  # comment.save (err) ->
  #   if err
  #     res.json return: 0
  #   res.json return: 1

  #   listing.set
  #     one: req.body.one
  #     two: req.body.two
  #   listing.save (err) ->
  #     if err
  #       res.json return: 0
  #     res.json return: 1
