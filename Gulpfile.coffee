# Steps needed (clean, compile, minify/uglify, concat, copy):
#
# [X] Clean dist, fonts, images, scripts, styles, favicon.ico, browserconfig.xml, index.html and robots.txt
#
# [X] Compile Jade into HTML
# [X] Minify index.html
# [X] Copy to dist
#
# [X] Compile Coffee into JS
# [X] Concat JS with jQuery, Underscore, Modernizr, Font Awesome, and Bootstrap (dropdown, transition, scrollspy, collapse) into application.js
# [X] Uglify and rename to application.min.js
# [X] Copy to dist
#
# [X] Compile SASS into CSS
# [X] Auto-prefix CSS
# [X] Concat CSS with Bootstrap and Font Awesome into application.css
# [X] Minify and rename to application.min.css
# [X] Copy to dist
#
# [ ] Minify images
# [X] Copy to dist
#
# [X] Copy fonts to dist
# [X] Copy misc files to dist
#
# [X] Copy dist to root for GitHub pages

gulp = require "gulp"
coffee = require "gulp-coffee"
uglify = require "gulp-uglify"
del = require "del"
rename = require "gulp-rename"
size = require "gulp-size"
concat = require "gulp-concat"
jade = require "gulp-jade"
sass = require "gulp-ruby-sass"
imagemin = require "gulp-imagemin"
autoprefixer = require "gulp-autoprefixer"
minifycss = require "gulp-minify-css"
htmlmin = require "gulp-htmlmin"
notify = require "gulp-notify"
# es = require "event-stream"
streamqueue = require "streamqueue"
order = require "gulp-order"
connect = require "gulp-connect"
watch = require "gulp-watch"

config =
  paths:
    fonts: [
      "app/fonts/**/*.{eot,svg,otf,ttf,woff,woff2}"
      "bower_components/fontawesome/fonts/*.{eot,svg,otf,ttf,woff,woff2}"
    ]
    images: "app/images/**/*.{jpg,png,gif}"
    coffee: "app/scripts/**/*.coffee"
    scripts: [
      "bower_components/jquery/dist/jquery.js"
      "bower_components/underscore/underscore.js"
      "bower_components/modernizr/modernizr.js"
      "bower_components/jquery.easing/js/jquery.easing.js"
      "bower_components/jquery.scrollTo/jquery.scrollTo.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/transition.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/dropdown.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/scrollspy.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/collapse.js"
    ]
    styles: "app/styles/application.sass" # Assumption that application.sass includes all other required partials
    views: "app/views/index.jade" # Assumption that index.jade includes all other required partials
    misc: "app/*.{xml,png,ico,txt,pdf}"

# Compile Jade to HTML, minify, and output
gulp.task "views", ->
  gulp.src config.paths.views
    .pipe jade()
    .pipe htmlmin()
    .pipe gulp.dest "dist"

# Compile CoffeeScript to JavaScript, concatenate, uglify, rename, and output
gulp.task "scripts", ->
  # appJs = gulp.src config.paths.coffee
  #   .pipe coffee()
  # vendorJs = gulp.src config.paths.scripts

  # See http://stackoverflow.com/questions/26088718/gulp-js-event-stream-merge-order
  streamqueue(
    objectMode: true
  , gulp.src(config.paths.scripts), gulp.src(config.paths.coffee).pipe(coffee())
  )
  .pipe concat "application.js"
  # .pipe uglify()
  .pipe rename suffix: ".min"
  .pipe gulp.dest "dist/scripts"

# Compile Sass to CSS, auto-prefix, minify, rename, and output
gulp.task "styles", ->
  gulp.src config.paths.styles
    .pipe sass "sourcemap=none": true # See https://github.com/sindresorhus/gulp-ruby-sass/issues/156
    .pipe autoprefixer()
    .pipe minifycss keepSpecialComments: 0
    .pipe rename suffix: ".min"
    .pipe gulp.dest "dist/styles"

# Minify and output images
gulp.task "images", ->
  gulp.src config.paths.images
    .pipe gulp.dest "dist/images"

# Copy fonts
gulp.task "fonts", ->
  gulp.src config.paths.fonts
    .pipe gulp.dest "dist/fonts"

# Copy misc files
gulp.task "misc", ->
  gulp.src config.paths.misc
    .pipe gulp.dest "dist"

# Copy contents of dist to root for GitHub Pages
gulp.task "ghpages", ->
  gulp.src "dist/**/*"
    .pipe gulp.dest "./"

# Delete the dist directory
gulp.task "clean", ->
  del "dist"
  del "./fonts"
  del "./images"
  del "./styles"
  del "./scripts"
  del "./index.html"
  del "./*.ico"
  del "./*.png"
  del "./*.pdf"
  del "./browserconfig.xml"
  del "./robots.txt"

# Reload on file changes
gulp.task "livereload", ->
  gulp.src "dist/**/*.{css,js,html}"
    .pipe watch("dist/**/*.{css,js,html}")
    .pipe connect.reload()

# Default task
gulp.task "default", ->
  console.log "Default task not configured."

# Build task
gulp.task "build", ["clean", "views", "scripts", "styles", "images", "fonts", "misc", "ghpages"], ->

# Local development server
gulp.task "webserver", ->
  connect.server
    livereload: true
    root: "dist"

# Watch for file changes
gulp.task "watch", ->
  gulp.watch config.paths.coffee, ["scripts"]
  gulp.watch "app/styles/**/*.{sass,scss}", ["styles"]
  gulp.watch "app/views/**/*.jade", ["views"]

# Start a local live-reload development server
gulp.task "server", ["build", "webserver", "livereload", "watch"], ->