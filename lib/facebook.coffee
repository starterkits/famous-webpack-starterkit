# fb-root must be present on page
# https://developers.facebook.com/docs/javascript/quickstart

Parse = require 'parse'
Config = require('config').public.facebook

load = (d, s, id) ->
  fjs = d.getElementsByTagName(s)[0]
  return if d.getElementById(id)
  js = d.createElement(s)
  js.id = id
  js.src = '//connect.facebook.net/en_US/all.js'
  fjs.parentNode.insertBefore(js, fjs)

window.fbAsyncInit = ->
  Parse.FacebookUtils.init
    appId      : Config.appId
    cookie     : true
    xfbml      : true

load document, 'script', 'facebook-jssdk'
