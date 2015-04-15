express = require('express')

module.exports = 
  index: (req, res) ->
    res.render 'index', 
      title: 'My Coffeepress Blog' 
      posts: []
      
  newPost: (req, res) ->
  #do nothing
