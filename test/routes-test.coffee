chai     = require 'chai'
expect   = chai.expect
routes = require "../routes/index"

describe "routes", ->
  req = {}
  res = {}
  describe "index", ->
    it "should display index with posts", ->
      ...

  describe "new post", ->
    it "should display the add post page", (done)->
      res.render = (view, vars) ->
          expect(view).equal "add_post"
          expect(vars.title).equal "Write New Post"
          done()
    
      routes.newPost(req, res)
