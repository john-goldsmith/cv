"use strict"

# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# If you want to recursively match all subfolders, use:
# 'test/spec/**/*.js'

# Order needed:
# Compile Jade into HTML (and dump into .tmp)
# Compile Coffee into JS (and dump into .tmp/scripts)
# Compile SASS into CSS (and dump into .tmp/styles)
# Minify HTML
# Minify and concat CSS
# Minify and concat JS
# <vendor libs>
# Copy HTML from .tmp to dist
# Copy CSS from .tmp/styles to dist/styles
# Copy JS from .tmp/scripts to dist/scripts
# Copy dist to root for GitHub pages

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
        files: ["<%= config.app %>/scripts/{,*/}*.{coffee,litcoffee,coffee.md}"]
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
          ".tmp/{,*/}*.html"
          ".tmp/styles/{,*/}*.css"
          ".tmp/styles/{,*/}*.js"
          "<%= config.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg,ico}"
        ]

    # Compiles CoffeeScript to JavaScript
    coffee:
      options:
        sourceMap: true
        sourceRoot: ""
      dist:
        files: [
          expand: true
          cwd: "<%= config.app %>/scripts"
          src: "{,*/}*.coffee"
          dest: ".tmp/scripts"
          ext: ".js"
        ]
      test:
        files: [
          expand: true
          cwd: "test/spec"
          src: "{,*/}*.coffee"
          dest: ".tmp/spec"
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
              connect.static(".tmp")
              connect().use("/bower_components", connect.static("./bower_components"))
              connect.static(config.app)
            ]
      test:
        options:
          open: false
          port: 9001
          middleware: (connect) ->
            [
              connect.static(".tmp")
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
            ".tmp"
            "<%= config.dist %>/*"
            "!<%= config.dist %>/.git*"
          ]
        ]
      server: ".tmp"
      githubpages: [
        "fonts"
        "images"
        "scripts"
        "styles"
        "index.html"
        "favicon.ico"
        "robots.txt"
      ]

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
        sourcemap: true
        loadPath: "bower_components"
      dist:
        files: [
          expand: true
          cwd: "<%= config.app %>/styles"
          src: ["*.{scss,sass}"]
          dest: ".tmp/styles"
          ext: ".css"
        ]
      server:
        files: [
          expand: true
          cwd: "<%= config.app %>/styles"
          src: ["*.{scss,sass}"]
          dest: ".tmp/styles"
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
          cwd: ".tmp/styles/"
          src: "{,*/}*.css"
          dest: ".tmp/styles/"
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
      html: ".tmp/index.html"

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
          cwd: "<%= config.dist %>"
          src: "{,*/}*.html"
          dest: "<%= config.dist %>"
        ]

    # By default, your `index.html`'s <!-- Usemin block --> will take care
    # of minification. These next options are pre-configured if you do not
    # wish to use the Usemin blocks.
    # cssmin:
    #   dist:
    #     files:
    #       "<%= config.dist %>/styles/main.css": [
    #         ".tmp/styles/{,*/}*.css"
    #         "<%= config.app %>/styles/{,*/}*.css"
    #       ]

    # uglify:
    #   dist:
    #     files:
    #       "<%= config.dist %>/scripts/scripts.js": ["<%= config.dist %>/scripts/scripts.js"]

    # concat:
    #   dist: {}

    # Copies remaining files to places other tasks can use
    copy:
      dist:
        files: [
          {
            expand: true
            dot: true
            cwd: "<%= config.app %>"
            dest: "<%= config.dist %>"
            src: ["*.{ico,txt}"]
          }
          {
            # 'images/{,*/}*.webp',
            # '{,*/}*.html',
            # 'fonts/{,*/}*.{eot,svg,ttf,woff,woff2,otf}'
            cwd: ".tmp"
            expand: true
            src: ["index.html"]
            dest: "<%= config.dist %>"
          }
          {
            # {
            #   src: 'node_modules/apache-server-configs/dist/.htaccess',
            #   dest: '<%= config.dist %>/.htaccess'
            # },
            expand: true
            dot: true
            cwd: "./bower_components/fontawesome/fonts/"
            src: "*.{eot,svg,ttf,woff,woff2,otf}"
            dest: "<%= config.dist %>/fonts"
          }
          {
            expand: true
            dot: true
            cwd: "./bower_components/fontawesome/css/"
            src: "font-awesome.min.css"
            dest: ".tmp/styles/"
          }
          {
            expand: true
            cwd: "./bower_components/jquery/dist/"
            src: [
              "jquery.min.js"
              "jquery.min.map"
            ]
            dest: ".tmp/scripts/vendor/"
          }
          {
            expand: true
            cwd: "./bower_components/underscore/"
            src: [
              "underscore-min.js"
              "underscore-min.map"
            ]
            dest: ".tmp/scripts/vendor/"
          }
          {
            expand: true
            cwd: "./bower_components/bootstrap-sass-official/assets/javascripts/bootstrap/"
            src: [
              "transition.js"
              "dropdown.js"
            ]
            dest: ".tmp/scripts/vendor/"
          }
        ]

      styles:
        expand: true
        dot: true
        # cwd: '<%= config.app %>/styles',
        cwd: ".tmp/styles"
        dest: "<%= config.dist %>/styles"
        src: "{,*/}*.{css,map}"

      scripts:
        expand: true
        dot: true
        # cwd: '<%= config.app %>/scripts',
        cwd: ".tmp/scripts"
        dest: "<%= config.dist %>/scripts"
        src: ["{,*/}*.{js,map}"]

      fonts:
        expand: true
        dot: true
        # cwd: '<%= config.app %>/styles',
        cwd: "<%= config.app %>/fonts"
        dest: ".tmp/fonts/"
        src: "{,*/}*.{eot,svg,ttf,woff,woff2,otf}"

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
          dest: ".tmp"
          src: "**/*.jade"
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
    "clean:dist"
    "clean:githubpages"
    "jade"
    "coffee:dist"
    "wiredep"
    "useminPrepare"
    "concurrent:dist"
    # "autoprefixer"
    # "concat",
    # "cssmin",
    # "uglify"
    "copy:dist"
    "copy:styles"
    "copy:scripts"
    "modernizr"
    # 'rev',
    "usemin"
    "htmlmin"
    "copy:githubpages"
  ]

  grunt.registerTask "default", [
    "newer:jshint"
    "test"
    "build"
  ]

  return