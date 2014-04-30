View = require 'famous/core/View'
Surface = require 'famous/core/Surface'
Modifier  = require 'famous/core/Modifier'
Transform = require 'famous/core/Transform'

class ImageUploadView extends View
  cssPrefix: 'upload'

  constructor: (model, options) ->
    super options
    @model = model
    @build()

  # Build view
  build: ->
    width = window.innerWidth - 50*2

    @form = new Surface
      content: '
      <form>
        <fieldset>
          <input type="file" name="image" onChange=/>
          <input type="submit" value="Upload" />
        </fieldset>
      </form>
      '
      classes: ["#{@cssPrefix}__form"]
      size: [width, 50]

    @form.on 'submit', =>
      alert('image uploaded')

    @form.on 'change', =>
      alert('image picked')

    @add @form


module.exports = ImageUploadView
