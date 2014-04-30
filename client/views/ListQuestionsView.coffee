require 'styles/views/questions'

View = require 'famous/core/View'
Modifier  = require 'famous/core/Modifier'
Transform = require 'famous/core/Transform'
Surface = require 'famous/core/Surface'
ContainerSurface = require 'famous/surfaces/ContainerSurface'
Scrollview = require 'famous/views/Scrollview'

class ListQuestionsView extends View

  constructor: (collection, options) ->
    super options
    @questions = collection
    @build()

  build: ->
    container = new ContainerSurface(
      size: [400, undefined]
      properties:
        overflow: "hidden"
    )

    surfaces = []
    scrollview = new Scrollview
    scrollview.sequenceFrom surfaces

    #debugger
    @questions.each (question) =>
      #link = question.get 'link'
      title = question.get 'title'
      content = "
        <h2>#{title}</h2>
      "

      temp = new Surface
        size: [undefined, 50]
        content: content
        classes: ['question']

      temp.pipe scrollview
      surfaces.push temp

    container.add scrollview
    @add scrollview



module.exports = ListQuestionsView
