# See example gulpfile.js for file system development build:
# https://github.com/webpack/webpack-with-common-libs/blob/master/gulpfile.js

gulp = require 'gulp'
gutil = require 'gulp-util'
webpack = require 'webpack'
WebpackDevServer = require 'webpack-dev-server'
webpackConfig = require './webpack.config.coffee'


# Default task
gulp.task 'default', ['webpack-dev-server'], ->


conf = Object.create webpackConfig
conf.devtool = 'source-map'


############################################################
# Development build
############################################################
gulp.task 'webpack-dev-server', (callback) ->
  conf.debug = true

  # Start a webpack-dev-server
  new WebpackDevServer webpack(conf),
    contentBase: conf.contentBase
    # hot: true
    quiet: false
    noInfo: false
    # lazy: false
    watchDelay: 300
    stats:
      colors: true
  .listen 8080, 'localhost', (err) ->
    throw new gutil.PluginError('webpack-dev-server', err) if err
    gutil.log '[webpack-dev-server]', 'http://localhost:8080/webpack-dev-server/index.html'


############################################################
# Production build
############################################################
gulp.task 'build', ['webpack:build'], ->
gulp.task 'webpack:build', (callback) ->
  conf.plugins = conf.plugins.concat(
    new webpack.DefinePlugin 'process.env': { NODE_ENV: JSON.stringify('production') }
    new webpack.optimize.DedupePlugin()
    new webpack.optimize.UglifyJsPlugin()
  )

  # run webpack
  webpack conf, (err, stats) ->
    throw new gutil.PluginError('webpack:build', err) if err
    gutil.log '[webpack:build]', stats.toString colors: true
    callback()
