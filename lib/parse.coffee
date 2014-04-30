# Modularize Parse

require('script!node_modules/parse/build/parse-latest')
Config = require('config').public.parse

Parse.initialize Config.appId, Config.jsKey

module.exports = window.Parse
