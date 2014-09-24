"use strict"

# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# If you want to recursively match all subfolders, use:
# 'test/spec/**/*.js'

module.exports = (grunt) ->

  grunt.loadNpmTasks "grunt-contrib-jade"
  grunt.loadNpmTasks "grunt-wiredep"

  # Time how long tasks take. Can help when optimizing build times
  require("time-grunt") grunt

  # Load grunt tasks automatically
  require("load-grunt-tasks") grunt

  # Configurable paths
  config =
    app: "app"
    dist: "dist"
    tmp: ".tmp"


  # Define the configuration for all the tasks
  grunt.initConfig

    # Project settings
    config: config

    # Watches files for changes and runs tasks based on the changed files
    watch:

      bower:
        files: ["bower.json"]
        tasks: ["wiredep"]

      coffee:
        files: ["<%= config.app %>/scripts/{,*/}*.coffee"]
        tasks: [
          "newer:coffee:dist"
          "wiredep"
        ]

      js:
        files: ["<%= config.app %>/scripts/{,*/}*.js"]
        tasks: ["jshint"]
        options:
          livereload: true

      jstest:
        files: ["test/spec/{,*/}*.js"]
        tasks: ["test:watch"]

      # compass:
      #   files: ['<%= config.app %>/styles/{,*/}*.{scss,sass}']
      #   tasks: [
      #     'compass:server'
      #     'autoprefixer'
      #     'wiredep'
      #   ]

      gruntfile:
        files: ["Gruntfile.coffee"]

      sass:
        files: ["<%= config.app %>/styles/{,*/}*.{scss,sass}"]
        tasks: [
          "sass:server"
          "autoprefixer"
        ]

      # styles:
      #   files: ['<%= config.app %>/styles/{,*/}*.css']
      #   tasks: [
      #     'newer:copy:styles'
      #     'autoprefixer'
      #   ]

      jade:
        # files: ['<%= config.app %>/{,*/}*.jade'],
        files: ["<%= config.app %>/**/*.jade"]
        tasks: [
          "jade"
          "wiredep"
        ]

      livereload:
        options:
          livereload: "<%= connect.options.livereload %>"
        files: [
          # '<%= config.app %>/{,*/}*.html',
          "<%= config.tmp %>/{,*/}*.html"
          "<%= config.tmp %>/styles/{,*/}*.css"
          "<%= config.tmp %>/styles/{,*/}*.js"
          "<%= config.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg,ico}"
        ]

    # Compiles CoffeeScript to JavaScript
    coffee:
      options:
        sourceMap: false
        sourceRoot: ""
      dist:
        files: [
          expand: true
          cwd: "<%= config.app %>/scripts"
          src: "{,*/}*.coffee"
          dest: "<%= config.tmp %>/scripts"
          ext: ".js"
        ]
      test:
        files: [
          expand: true
          cwd: "test/spec"
          src: "{,*/}*.coffee"
          dest: "<%= config.tmp %>/spec"
          ext: ".js"
        ]

    # The actual grunt server settings
    connect:
      options:
        port: 9000
        open: true
        livereload: 35729
        hostname: "0.0.0.0" # Change this to '0.0.0.0' to access the server from outside
      livereload:
        options:
          middleware: (connect) ->
            [
              connect.static("<%= config.tmp %>")
              connect().use("/bower_components", connect.static("./bower_components"))
              connect.static(config.app)
            ]
      test:
        options:
          open: false
          port: 9001
          middleware: (connect) ->
            [
              connect.static("<%= config.tmp %>")
              connect.static("test")
              connect().use("/bower_components", connect.static("./bower_components"))
              connect.static(config.app)
            ]
      dist:
        options:
          base: "<%= config.dist %>"
          livereload: false

    # Empties folders to start fresh
    clean:
      dist:
        files: [
          dot: true
          src: [
            "<%= config.tmp %>"
            "<%= config.dist %>/*"
            "!<%= config.dist %>/.git*"
            "./fonts"
            "./images"
            "./application.min.js"
            "./application.min.css"
            "./index.html"
            "./*.ico"
            "./*.png"
            "./browserconfig.xml"
            "./robots.txt"
          ]
        ]
      server: "<%= config.tmp %>"

    # Make sure code styles are up to par and there are no obvious mistakes
    jshint:
      options:
        jshintrc: ".jshintrc"
        reporter: require("jshint-stylish")
      all: [
        "Gruntfile.coffee"
        "<%= config.app %>/scripts/{,*/}*.js"
        "!<%= config.app %>/scripts/vendor/*"
        "test/spec/{,*/}*.js"
      ]

    # Mocha testing framework configuration options
    mocha:
      all:
        options:
          run: true
          urls: ["http://<%= connect.test.options.hostname %>:<%= connect.test.options.port %>/index.html"]

    # Compiles Sass to CSS and generates necessary files if requested
    sass:
      options:
        # sourcemap: false
        loadPath: "bower_components"
      dist:
        files: [
          expand: true
          cwd: "<%= config.app %>/styles"
          src: "*.{scss,sass}"
          dest: "<%= config.tmp %>/styles"
          ext: ".css"
        ]
      server:
        files: [
          expand: true
          cwd: "<%= config.app %>/styles"
          src: "*.{scss,sass}"
          dest: "<%= config.tmp %>/styles"
          ext: ".css"
        ]

    # Add vendor prefixed styles
    autoprefixer:
      options:
        browsers: [
          "> 1%"
          "last 2 versions"
          "Firefox ESR"
          "Opera 12.1"
        ]
      dist:
        files: [
          expand: true
          cwd: "<%= config.tmp %>/styles/"
          src: "{,*/}*.css"
          dest: "<%= config.tmp %>/styles/"
        ]

    # Automatically inject Bower components into the HTML file
    wiredep:
      app:
        ignorePath: /^\/|\.\.\//
        src: ["<%= config.app %>/index.html"]
        exclude: ["bower_components/bootstrap-sass-official/assets/javascripts/bootstrap.js"]
      sass:
        src: ["<%= config.app %>/styles/{,*/}*.{scss,sass}"]
        ignorePath: /(\.\.\/){1,2}bower_components\//

    # Renames files for browser caching purposes
    rev:
      dist:
        files:
          src: [
            "<%= config.dist %>/scripts/{,*/}*.js"
            "<%= config.dist %>/styles/{,*/}*.css"
            "<%= config.dist %>/images/{,*/}*.*"
            "<%= config.dist %>/fonts/{,*/}*.*"
            "<%= config.dist %>/*.{ico,png,jpg,jpeg,gif}"
          ]

    # Reads HTML for usemin blocks to enable smart builds that automatically
    # concat, minify and revision files. Creates configurations in memory so
    # additional tasks can operate on them
    useminPrepare:
      options:
        dest: "<%= config.dist %>"
      html: "<%= config.tmp %>/index.html"

    # Performs rewrites based on rev and the useminPrepare configuration
    usemin:
      options:
        assetsDirs: [
          "<%= config.dist %>"
          "<%= config.dist %>/images"
        ]
      html: ["<%= config.dist %>/{,*/}*.html"]
      css: ["<%= config.dist %>/styles/{,*/}*.css"]

    # The following *-min tasks produce minified files in the dist folder
    imagemin:
      dist:
        files: [
          expand: true
          cwd: "<%= config.app %>/images"
          src: "{,*/}*.{gif,jpeg,jpg,png}"
          dest: "<%= config.dist %>/images"
        ]

    svgmin:
      dist:
        files: [
          expand: true
          cwd: "<%= config.app %>/images"
          src: "{,*/}*.svg"
          dest: "<%= config.dist %>/images"
        ]

    htmlmin:
      dist:
        options:
          collapseBooleanAttributes: true
          collapseWhitespace: true
          conservativeCollapse: true
          removeAttributeQuotes: false
          removeCommentsFromCDATA: true
          removeEmptyAttributes: true
          removeOptionalTags: true
          removeRedundantAttributes: true
          useShortDoctype: true
        files: [
          expand: true
          cwd: "<%= config.tmp %>"
          src: "{,*/}*.html"
          dest: "<%= config.tmp %>"
        ]

    # By default, your `index.html`'s <!-- Usemin block --> will take care
    # of minification. These next options are pre-configured if you do not
    # wish to use the Usemin blocks.
    cssmin:
      dist:
        files: [
          expand: true
          cwd: "<%= config.tmp %>/styles/"
          src: "application.css"
          dest: "<%= config.tmp %>/styles/"
          ext: ".min.css"
        ]

    uglify:
      dist:
        files: [
          expand: true
          cwd: "<%= config.tmp %>/scripts/"
          src: "application.js"
          dest: "<%= config.tmp %>/scripts/"
          ext: ".min.js"
        ]

    concat:
      dist:
        files:
          "<%= config.tmp %>/scripts/application.js": [
            "<%= config.tmp %>/scripts/modernizr.js"
            "<%= config.tmp %>/scripts/jquery.min.js"
            "<%= config.tmp %>/scripts/underscore-min.js"
            "<%= config.tmp %>/scripts/*.js"
            # "<%= config.tmp %>/scripts/transition.js"
            # "<%= config.tmp %>/scripts/skills.js"
          ]
          "<%= config.tmp %>/styles/application.css": "<%= config.tmp %>/styles/*.css"

    # Copies remaining files to places other tasks can use
    copy:
      images:
        files: [
          {
            expand: true
            cwd: "<%= config.app %>/images/"
            src: "{,*/}*.{jpg,jpeg,png,gif}"
            dest: "<%= config.tmp %>/images/"
          }
        ]
      fonts:
        files: [
          {
            expand: true
            cwd: "<%= config.app %>/fonts/"
            src: "{,*/}*.{eot,svg,ttf,woff,woff2,otf}"
            dest: "<%= config.tmp %>/fonts/"
          }
        ]
      vendor:
        files: [
          {
            expand: true
            cwd: "./bower_components/fontawesome/fonts/"
            src: "*.{eot,svg,ttf,woff,woff2,otf}"
            dest: "<%= config.tmp %>/fonts"
          }
          {
            expand: true
            dot: true
            cwd: "./bower_components/fontawesome/css/"
            src: "font-awesome.min.css"
            dest: "<%= config.tmp %>/styles/"
          }
          {
            expand: true
            cwd: "./bower_components/jquery/dist/"
            src: [
              "jquery.min.js"
              # "jquery.min.map"
            ]
            dest: "<%= config.tmp %>/scripts"
          }
          {
            expand: true
            cwd: "./bower_components/underscore/"
            src: [
              "underscore-min.js"
              # "underscore-min.map"
            ]
            dest: "<%= config.tmp %>/scripts"
          }
          {
            expand: true
            cwd: "./bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/"
            src: [
              "transition.js"
              "dropdown.js"
            ]
            dest: "<%= config.tmp %>/scripts/"
          }
          # {
          #   expand: true
          #   cwd: "./bower_components/bootstrap-sass-official/assets/fonts/bootstrap/"
          #   src: *.{eot,svg,ttf,woff,woff2,otf}
          #   dest: "<%= config.tmp %>/fonts/"
          # }
          {
            expand: true
            cwd: "./bower_components/modernizr/"
            src: "modernizr.js"
            dest: "<%= config.tmp %>/scripts/"
          }
        ]
      dist:
        files: [
          {
            expand: true
            cwd: "<%= config.app %>/"
            src: "*.{ico,txt,xml,png}" # favicon.ico, robots.txt
            dest: "<%= config.dist %>/"
          }
          {
            expand: true
            cwd: "<%= config.tmp %>/"
            src: "index.html"
            dest: "<%= config.dist %>/"
          }
          {
            expand: true
            cwd: "<%= config.tmp %>/fonts/"
            src: "{,*/}*.{eot,svg,ttf,woff,woff2,otf}"
            dest: "<%= config.dist %>/fonts/"
          }
          {
            expand: true
            cwd: "<%= config.tmp %>/scripts/"
            src: "application.min.js"
            dest: "<%= config.dist %>/scripts/"
          }
          {
            expand: true
            cwd: "<%= config.tmp %>/styles/"
            src: "application.min.css"
            dest: "<%= config.dist %>/styles/"
          }
          {
            expand: true
            cwd: "<%= config.tmp %>/images/"
            src: "{,*/}*.{jpg,jpeg,png,gif}"
            dest: "<%= config.dist %>/images/"
          }
        ]
      githubpages:
        expand: true
        cwd: "<%= config.dist %>"
        dest: "."
        src: "**/*"

    # Generates a custom Modernizr build that includes only the tests you
    # reference in your app
    modernizr:
      dist:
        devFile: "bower_components/modernizr/modernizr.js"
        outputFile: "<%= config.dist %>/scripts/vendor/modernizr.js"
        files:
          src: [
            "<%= config.dist %>/scripts/{,*/}*.js"
            "<%= config.dist %>/styles/{,*/}*.css"
            "!<%= config.dist %>/scripts/vendor/*"
          ]
        uglify: true

    # Run some tasks in parallel to speed up build process
    concurrent:
      server: [
        "sass:server"
        # 'compass:server',
        "copy:styles"
        "copy:scripts"
        "coffee:dist"
      ]
      test: [
        "copy:styles"
        "copy:scripts"
      ]
      dist: [
        "sass"
        "coffee:dist"
        "copy:styles"
        "copy:scripts"
        "imagemin"
        "svgmin"
      ]

    jade:
      dist:
        options:
          pretty: true
        files: [
          expand: true
          cwd: "<%= config.app %>"
          dest: "<%= config.tmp %>"
          src: "index.jade"
          ext: ".html"
        ]

  grunt.registerTask "serve", "start the server and preview your app, --allow-remote for remote access", (target) ->
    grunt.config.set "connect.options.hostname", "0.0.0.0"  if grunt.option("allow-remote")
    if target is "dist"
      return grunt.task.run([
        "build"
        "connect:dist:keepalive"
      ])
    grunt.task.run [
      "clean:server"
      "jade"
      "wiredep"
      "copy:fonts"
      "concurrent:server"
      "autoprefixer"
      "connect:livereload"
      "watch"
    ]
    return

  grunt.registerTask "server", (target) ->
    grunt.log.warn "The `server` task has been deprecated. Use `grunt serve` to start a server."
    grunt.task.run [(if target then ("serve:" + target) else "serve")]
    return

  grunt.registerTask "test", (target) ->
    if target isnt "watch"
      grunt.task.run [
        "clean:server"
        "concurrent:test"
        "autoprefixer"
      ]
    grunt.task.run [
      "connect:test"
      "mocha"
    ]
    return

  grunt.registerTask "build", [
    # Order needed (clean, compile, minify, concat, copy):
    # [X] Clean .tmp, dist, fonts, images, scripts, styles, favicon.ico, index.html and robots.txt
    # [X] Compile Jade into HTML, place in .tmp
    # [X] Compile Coffee into JS, place in .tmp/scripts
    # [X] Compile SASS into CSS, place in .tmp/styles
    # [X] Minify index.html
    # [X] Copy jQuery, Underscore, Modernizr, Font Awesome, dropdown.js, and transition.js to .tmp
    # [-] Concat CSS into application.css
    # [X] Auto-prefix application.css
    # [X] Concat JS (including vendor libs) into application.js
    # [X] Minify application.css
    # [X] Uglify application.js
    # [X] Copy index.html from .tmp to dist
    # [X] Copy application.css from .tmp/styles to dist/styles
    # [X] Copy application.js from .tmp/scripts to dist/scripts
    # [X] Copy dist to root for GitHub pages
    "clean:dist"
    "jade:dist"
    "coffee:dist"
    "sass:dist"
    "copy:fonts"
    "copy:images"
    "copy:vendor"
    "htmlmin:dist"
    "autoprefixer:dist"
    "concat:dist" # This only does JS because only one CSS file, application.css, exists
    "cssmin:dist"
    "uglify:dist"
    "copy:dist"
    "copy:githubpages"
    # "wiredep"
    # "useminPrepare"
    # "concurrent:dist"
    # "copy:styles"
    # "copy:scripts"
    # "modernizr"
    # "rev"
    # "usemin"
  ]

  grunt.registerTask "default", [
    "newer:jshint"
    "test"
    "build"
  ]

  return