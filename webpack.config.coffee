# See webpack.config.js for more examples:
# https://github.com/webpack/webpack-with-common-libs/blob/master/webpack.config.js
# https://github.com/webpack/example-app/blob/master/webpack.config.js

webpack = require 'webpack'
path = require 'path'

# webpack-dev-server options used in gulpfile
# https://github.com/webpack/webpack-dev-server

module.exports =

  contentBase: "#{__dirname}/client/"

  cache: true

  entry:
    bundle: './client/app'

  output:
    path: path.join(__dirname, 'dist')
    publicPath: 'dist/'
    filename: 'bundle.js'
    sourceMapFilename: '[file].map'
    # chunkFilename: '[hash]/js/[id].js'
    # hotUpdateMainFilename: "[hash]/update.json",
    # hotUpdateChunkFilename: "[hash]/js/[id].update.js"

  recordsOutputPath: path.join(__dirname, "records.json"),

  module:
    loaders: [
      {
        test: /\.coffee$/
        loader: 'coffee-loader'
      }
      {
        test: /\.scss$/
        loader: "style-loader!sass-loader?outputStyle=expanded&includePaths[]=./bower_components/"
      }
      {
        # required to write 'require('./style.css')'
        test: /\.css$/
        loader: 'style-loader!css-loader'
      }
      # {
      #   test: /\.woff$/
      #   loader: 'url-loader?prefix=font/&limit=5000&minetype=application/font-woff'
      # }
      # {
      #   test: /\.ttf$/
      #   loader: 'file-loader?prefix=font/'
      # }
      # {
      #   test: /\.eot$/
      #   loader: 'file-loader?prefix=font/'
      # }
      # {
      #   test: /\.svg$/
      #   loader: 'file-loader?prefix=font/'
      # }
      # {
      #   # Add to package.json: "jade-loader": "~0.6",
      #   test: /\.jade$/
      #   loader: 'jade-loader?self'
      # }
    ]


  resolve:
    extensions: ['', '.webpack.js', '.web.js', '.coffee', '.js', '.scss']
    modulesDirectories: ['client', 'lib', 'bower_components', 'node_modules']

  plugins: [
    new webpack.optimize.OccurenceOrderPlugin(true)
  ]
