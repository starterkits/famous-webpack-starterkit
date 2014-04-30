# CSS
require 'styles/app'
require 'famous/core/famous.css'

# JS
require 'famous-polyfills/functionPrototypeBind'
require 'famous-polyfills/classList'
require 'famous-polyfills/requestAnimationFrame'


Engine = require 'famous/core/Engine'
Utility = require 'famous/utilities/Utility'
Surface = require 'famous/core/Surface'
ScrollView = require 'famous/views/Scrollview'
HeaderFooterLayout = require 'famous/views/HeaderFooterLayout'

# Views
HeaderView = require 'views/HeaderView'
FpsMeter = require 'widgets/FpsMeter'

# create the main context
mainContext = Engine.createContext()

# Build main view
content = new ScrollView
  direction: Utility.Direction.Y

content.sequenceFrom [
  #editQuestion
  #imageUpload
  # listQuestions
  imageEdit
]

# Build layout
layout = new HeaderFooterLayout
  headerSize: 60
  footerSize: 50
header = new HeaderView
footer = new Surface
  content: 'Famous StarterKit'
  classes: ['footer']

layout.header.add header
layout.content.add content
layout.footer.add footer

# Add views to context
mainContext.add layout

# mainContext.add new Mascot
mainContext.add new FpsMeter

