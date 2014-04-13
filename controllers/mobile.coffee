eyes = require("eyes")
###
GET /
Areas
###
exports.getAreas = (req, res) ->
  arr = ["UCLA"]
  res.json areas: arr

###
GET /
Listings
###
exports.getListings = (req, res) ->
  arr = [1, 2, 3]
  res.json listings: arr

###
POST /
Listing
###
exports.postListing = (req, res) ->
  # console.log "Received file:\n" + JSON.stringify(req.body)
  console.log req.files

  res.json return: 1

  # photoDir = __dirname + "/photos/"
  # thumbnailsDir = __dirname + "/photos/thumbnails/"
  # photoName = req.files.source.name
  # fs.rename req.files.source.path, photoDir + photoName, (err) ->
  #   if err?
  #     console.log err
  #     res.send error: "Server Writting No Good"
  #   else
  #     im.resize
  #       srcData: fs.readFileSync(photoDir + photoName, "binary")
  #       width: 256
  #     , (err, stdout, stderr) ->
  #       if err?
  #         console.log "stdout : " + stdout
  #         res.send error: "Resizeing No Good"
  #       else
          
  #         #console.log('ELSE stdout : '+stdout)
  #         fs.writeFileSync thumbnailsDir + "thumb_" + photoName, stdout, "binary"
  #         res.send "Ok"
  #       return

  #   return

  # return


  # listing = new Listing(
  #   title: req.body.title
  #   description: req.body.two
  #   picture: "6o7flufu.jpg"
  #   message: []
  #   bought: false
  # )
  # listing.save (err) ->
  #   if err
  #     res.json return: 0
  #   res.json return: 1

###
POST /
Buy
###
exports.postBuy = (req, res, next) ->
  Listing.findById req.body.id, (err, listing) ->
    return next(err)  if err
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
  return
  # listing = find Listing
  # listing.set
  #   one: req.body.one
  #   two: req.body.two
  # listing.save (err) ->
  #   if err
  #     res.json return: 0
  #   res.json return: 1

###
POST /
Message
###
exports.postMessage = (req, res) ->
  return
  # listing = find Listing

  # message = new Message(
  #   one: req.body.one
  #   two: req.body.two
  # )
  # message.save (err) ->
  #   if err
  #     res.json return: 0

  #   listing.set
  #     one: req.body.one
  #     two: req.body.two
  #   listing.save (err) ->
  #     if err
  #       res.json return: 0
  #     res.json return: 1

###
POST /
Comment
###
exports.postComment = (req, res) ->
  return
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
