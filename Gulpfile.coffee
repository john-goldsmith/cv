# Order needed (clean, compile, minify/uglify, concat, copy):
# [X] Clean .tmp, dist, fonts, images, scripts, styles, favicon.ico, index.html and robots.txt
# [X] Compile Jade into HTML, place in .tmp
# [X] Compile Coffee into JS, place in .tmp/scripts
# [X] Compile SASS into CSS, place in .tmp/styles
# [X] Minify index.html
# [X] Minify application.css
# [ ] Uglify application.js
# [ ] Copy jQuery, Underscore, Modernizr, Font Awesome, dropdown.js, and transition.js to .tmp
# [ ] Concat CSS into application.css
# [X] Auto-prefix application.css
# [ ] Concat JS (including vendor libs) into application.js
# [ ] Copy index.html from .tmp to dist
# [ ] Copy application.css from .tmp/styles to dist/styles
# [ ] Copy application.js from .tmp/scripts to dist/scripts
# [ ] Copy dist to root for GitHub pages

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

config =
  paths:
    fonts: "app/fonts/**/*.{eot,svg,ttf,woff,woff2}"
    images: "app/images/**/*.{jpg,png,gif}"
    coffee: "app/scripts/**/*.coffee"
    scripts: [
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/transition.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/dropdown.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/scrollspy.js"
      "bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/collapse.js"
      "bower_components/jquery/dist/jquery.js"
      "bower_components/jquery.easing/jquery.easing.js"
      "bower_components/jquery.scrollTo/jquery.scrollTo.js"
      "bower_components/modernizr/modernizr.js"
      "bower_components/underscore/underscore.js"
    ]
    styles: "app/styles/application.sass" # Assumption that application.sass includes all other required partials
    views: "app/views/index.jade" # Assumption that index.jade includes all other required partials

# Compile Jade to HTML
gulp.task "views", ->
  gulp.src config.paths.views
    .pipe jade()
    .pipe htmlmin()
    .pipe gulp.dest "dist"

# Compile CoffeeScript to JavaScript
gulp.task "coffee", ->
  coffee = gulp.src config.paths.coffee
    .pipe coffee()
  return coffee

# Concatenate, minify, and rename JavaScript
gulp.task "scripts", ["coffee"], ->
  gulp.src config.paths.scripts
    .pipe concat "application.js"
    # .pipe uglify()
    .pipe rename suffix: ".min"
    .pipe gulp.dest "dist/scripts"
    # .pipe gulp.dest "."

# Compile Sass to CSS and minify
gulp.task "styles", ->
  gulp.src config.paths.styles
    .pipe sass "sourcemap=none": true # See https://github.com/sindresorhus/gulp-ruby-sass/issues/156
    .pipe autoprefixer()
    .pipe minifycss keepSpecialComments: 0
    .pipe rename suffix: ".min"
    .pipe gulp.dest "dist/styles"
    # .pipe gulp.dest "."

#
gulp.task "images", ->
  gulp.src config.paths.images

#
gulp.task "fonts", ->
  gulp.src config.paths.fonts

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

# Default task
gulp.task "default", ["clean", "views", "styles", "scripts"], ->