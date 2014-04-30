require 'styles/widgets/fpsmeter'

View = require 'famous/core/View'
Surface = require 'famous/core/Surface'
Modifier = require 'famous/core/Modifier'
Engine = require 'famous/core/Engine'
Timer = require 'famous/utilities/Timer'


class FpsMeter extends View
  currTime: 0
  lastTime: 0
  frameTime: 0
  state: true

  # How much to normalize frame rate readings
  # Bigger number means more normalization
  filterStrength: 10

  # How many milliseconds between updating FPS
  updateFrequency: 100

  constructor: ->
    super
    @initTime()

    @surface = new Surface
      size: [100, 20]
      classes: ['fpsmeter']
      content: ''

    @add new Modifier
      origin: [1, 1]
    .add @surface

    @surface.on 'click', @toggleState

    @start()

  initTime: ->
    perf = window.performance;
    if perf and (perf.now or perf.webkitNow)
      perfNow = if perf.now then 'now' else 'webkitNow'
      @getTime = perf[perfNow].bind(perf)

    @lastTime = @getTime()

  tick: =>
    @currTime = @getTime()
    thisFrameTime = @currTime - @lastTime
    @frameTime += (thisFrameTime - @frameTime) / @filterStrength
    @lastTime = @currTime

  toggleState: =>
    if @state
      @stop()
    else
      @start()
    @state = not @state

  start: ->
    Engine.on 'prerender', @tick
    @interval = Timer.setInterval @update, @updateFrequency

  stop: ->
    Engine.removeListener 'prerender', @tick
    Timer.clear @interval

  update: =>
    @surface.setContent "#{ (1000 / @frameTime).toFixed 1} fps"

  getTime: ->
    +new Date()


module.exports = FpsMeter
