# Famous

See Taasky demo code for the best example of how to create forms and integrate with Backbone Model.

Also see Famous/examples on github.

The docs on famo.us are pretty useless. Better to just read the code and comments.



# Install

```bash
git clone https://github.com/starterkits/famous-starterkit.git
cd famous-starterkit
npm install -g gulp webpack-dev-server bower
npm install
```

# Development

```bash
# Run webpack-dev-server
gulp

# Or manually run webpack if needed
webpack -d --colors
```

# Production

NOTE: gulp production build task is WIP.

```bash
# Compile assets for production
gulp build
```


# Development Overview

Gulp is used instead of grunt to manage development tasks.
Gulp is easier to configure and faster due to streaming IO instead of writing files to disk.

Webpack is used instead of browserify to compile assets and manage JavaScript dependencies.
Webpack can handle CSS and other file types besides JavaScript. This allows for views to be
completely self contained with CSS, fonts, and JavaScript dependencies declared at the top
of the view file.

Gulp could be dropped since it's mostly just passing through to webpack. But gulp has a lot
of useful plugins and example tasks that could be useful later on.



# Directory Structure

* **/client**: all code and assets for display and interaction; javascript, html, images, css, etc.
* **/config**: config vars and initializers
* **/lib**: shared code that doesn't obviously belong in client or server


# Dependencies

With webpack, each JavaScript file must explicitly require its dependencies.

By convention, each view should have a corresponding CSS file in of the same name in /styles.
The CSS files should be explicitly required by the view vs assuming the CSS is already loaded.

Any changes to explicity required files will be automatically picked up by webpack and updated
in development. Files @imported in sass will not be automatically recompiled with the current
webpack configuration. Any changes to app.scss or _settings.scss requires a restart of the
development server.


# NPM vs Bower

Use Bower for any dependencies that are only used in the browser. Use npm for everything else.



# Production

The package.json and bower.json files should be updated to use specific versions to ensure
consistency between development and production.

Does npm have the equivalent of Bundler's Gemfile.lock?

## Deploy

```bash
# build production assets
gulp build
```

Rest of deploy details TBD.




