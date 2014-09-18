window.cv ?= {}

$(document).ready ->

  cv.badges = [
    {
      name: "ruby"
      order: 1
      borderColor: "#c11000"
      textColor: "#fff"
      icon: "ruby.png"
      tags: [
        "programming"
        "languages"
        "ruby"
      ]
    }
    {
      name: "rails"
      order: 2
      borderColor: "#a02c2e"
      textColor: "#fff"
      icon: "rails.png"
      tags: [
        "programming"
        "frameworks"
        "ruby"
      ]
    }
  ]

  badgesContainer = $("#badges")
  badgeTemplate = _.template(
    '<div class="badge" style="border-color: <%= borderColor %>;">
      <div class="badge-front">
        <img src="images/badges/<%= icon %>" alt="<%= name %>" />
      </div>
      <div class="badge-back" style="color: <%= textColor %>; background-color: <%= borderColor %>;">
        <%= name %>
      </div>
    </div>')

  _.each cv.badges, (element, index, list) ->
    badgesContainer.append badgeTemplate(cv.badges[index])