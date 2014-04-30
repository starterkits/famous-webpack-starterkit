Config = require('config').public.aviary
View = require 'famous/core/View'
Surface = require 'famous/core/Surface'


class ImageEditView extends View
  src: 'http://images.aviary.com/imagesv5/feather_default.jpg'
  theme: 'dark' # light

  constructor: (model, options) ->
    super options
    @model = model
    @initEditor()
    @build()

  # Build view
  build: ->
    @surface = new Surface
      content: "
        <div id='injection_site'></div>
        <img id='image1' src='#{@src}'>
      "
      size: [undefined, undefined]
    @surface.on 'click', =>
      @launchEditor 'image1', @src

    @add @surface

  launchEditor: (id, src) ->
    @aviary.launch
      image: id
      url: src

  initEditor: ->
    @aviary = new Aviary.Feather
      apiKey: Config.apiKey
      apiVersion: 3
      theme: 'light'
      tools: 'all'
      appendTo: ''
      onSave: @onSave
      onError: @onError

  onSave: (imageID, newURL) =>
    debugger
    img = document.getElementById(imageID)
    img.src = newURL

  onError: (errorObj) =>
    debugger

module.exports = ImageEditView

