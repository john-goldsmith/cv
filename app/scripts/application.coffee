window.cv ?= {}

badgesContainer = $("#badges")
badgeTemplate = '<li class="badge"></li>'

_.each cv.badges, (key, value, list) ->
  console.log key, value