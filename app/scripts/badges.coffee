@Skill = class Skill extends @Site

  SKILLS_CONTAINER = $("#skills")

  # Having view markup in here isn"t ideal, but it'll have to do for now
  SKILL_TEMPLATE = _.template(
    '<div class="col-md-2 col-sm-3 col-xs-6">
      <div class="skill-container" style="border-color: <%= borderColor %>;">
        <div class="skill">
          <div class="skill-front">
            <img src="images/skills/<%= icon %>" alt="<%= name %>" />
          </div>
          <div class="skill-back" style="color: <%= textColor %>; background-color: <%= borderColor %>;">
            <%= name %>
          </div>
        </div>
      </div>
    </div>')
  SKILLS = [
    {
      name: "ruby"
      order: 1
      borderColor: "#c11000"
      textColor: "#fff"
      icon: "ruby.png"
      proficiency: 85
      tags: [
        "programming"
        "languages"
        "ruby"
        "backend"
      ]
    }
    {
      name: "rails"
      order: 3
      borderColor: "#a02c2e"
      textColor: "#fff"
      icon: "ruby.png" #rails.png
      proficiency: 85
      tags: [
        "programming"
        "frameworks"
        "ruby"
        "backend"
      ]
    }
    {
      name: "html"
      order: 5
      borderColor: "orange"
      textColor: "#fff"
      icon: "ruby.png" #html.png
      proficiency: 100
      tags: [
        "programming"
        "languages"
        "frontend"
      ]
    }
    {
      name: "css"
      order: 6
      borderColor: "yellow"
      textColor: "#fff"
      icon: "ruby.png" #css.png
      proficiency: 100
      tags: [
        "programming"
        "languages"
        "frontend"
      ]
    }
    {
      name: "javascript"
      order: 4
      borderColor: "blue"
      textColor: "#fff"
      icon: "ruby.png" #javascript.png
      proficiency: 100
      tags: [
        "programming"
        "languages"
        "frontend"
      ]
    }
    {
      name: "php"
      order: 2
      borderColor: "purple"
      textColor: "#fff"
      icon: "ruby.png" #php.png
      proficiency: 100
      tags: [
        "programming"
        "languages"
        "backend"
      ]
    }
  ]

  constructor: ->
    @generateSkills()
    $(document).on "touchstart", ".skill-container", @bindTouchStartEvent

  generateSkills: =>
    orderedSkills = _.sortBy(SKILLS, "order")
    _.each orderedSkills, (element, index) ->
      SKILLS_CONTAINER.append SKILL_TEMPLATE(orderedSkills[index])

  bindTouchStartEvent: ->
    $(".skill-container").removeClass("hover")
    $(@).toggleClass("hover")

$(document).ready =>
  @app ?= {}
  @app.skill = new Skill