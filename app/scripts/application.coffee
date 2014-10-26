class App

  SCROLL_TO_DURATION = 800
  SCROLL_TO_OPTIONS = easing: "easeOutCubic"

  constructor: ->
    $(document).on "click", ".nav li a, #more", @bindNavScrollTo

  bindNavScrollTo: (event) ->
    event.preventDefault()
    $.scrollTo $(event.target).attr("href"), SCROLL_TO_DURATION, SCROLL_TO_OPTIONS

$(document).ready =>
  @app ?= {}
  @app.app = new App