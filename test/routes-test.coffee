chai     = require 'chai'
expect   = chai.expect
routes = require "../routes/index"

describe "routes", ->
  req = {}
  res = {}
  describe "index", ->
    it "should display index with posts", ->
      res.render = (view, vars) ->
          expect(view).equal "index"
          expect(vars.title).equal "My Coffeepress Blog"
          expect(vars.posts).deep.equal []
      routes.index(req, res)
      
  describe "new post", ->
    it "should display the add post page", ->
        res.render = (view, vars) ->
            expect(view).equal "add_post"
            expect(vars.title).equal "Write New Post"
      
        routes.newPost(req, res)