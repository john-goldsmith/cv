class Skill

  SKILLS_CONTAINER = $("#skills")

  # Having view markup in here isn't ideal, but it'll have to do for now
  SKILL_TEMPLATE = _.template(
    '<div class="col-md-3 col-sm-4 col-xs-6">
      <div class="skill-container center-block <%= cssClass %>" style="border-color: <%= borderColor %>;">
        <div class="skill">
          <div class="skill-front">
            <img src="images/skills/<%= icon %>" alt="<%= name %>" />
          </div>
          <div class="skill-back" style="color: <%= textColor %>; background-color: <%= borderColor %>;">
            <div class="skill-name">
              <%= name %>
            </div>
            <div class="skill-proficiency"></div>
          </div>
        </div>
      </div>
    </div>') # style="height: <%= proficiency %>%;"

  SKILLS = [
    {
      name: "Ruby"
      order: 1
      borderColor: "#c11000"
      textColor: "#fff"
      icon: "ruby.png"
      proficiency: 85
      visible: true
      tags: [
        "development"
        "languages"
        "ruby"
        "backend"
      ]
    }
    {
      name: "Rails"
      order: 2
      borderColor: "#a02c2e"
      textColor: "#fff"
      icon: "rails.png"
      proficiency: 85
      visible: true
      tags: [
        "development"
        "frameworks"
        "ruby"
        "backend"
      ]
    }
    {
      name: "PHP"
      order: 3
      borderColor: "#5967a8"
      textColor: "#fff"
      icon: "php.png"
      proficiency: 100
      visible: true
      tags: [
        "development"
        "languages"
        "backend"
        "php"
      ]
    }
    {
      name: "MySQL"
      order: 4
      borderColor: "#007d7e"
      textColor: "#fff"
      icon: "mysql.png"
      proficiency: 100
      visible: true
      tags: [
        "development"
        "languages"
        "backend"
      ]
    }
    {
      name: "HTML5"
      order: 5
      borderColor: "#e64c17"
      textColor: "#fff"
      icon: "html5.png"
      proficiency: 100
      visible: true
      tags: [
        "development"
        "languages"
        "frontend"
      ]
    }
    {
      name: "CSS3"
      order: 6
      borderColor: "#006ebd"
      textColor: "#fff"
      icon: "css3.png" #php.png
      proficiency: 100
      visible: true
      tags: [
        "development"
        "languages"
        "frontend"
      ]
    }
    {
      name: "Bower"
      order: 7
      borderColor: "#553728"
      textColor: "#fff"
      icon: "bower.png"
      proficiency: 100
      visible: true
      tags: [
        "package_manager"
        "javascript"
      ]
    }
    {
      name: "Grunt"
      order: 8
      borderColor: "#2f0c00"
      textColor: "#fff"
      icon: "grunt.png"
      proficiency: 100
      visible: true
      tags: [
        "automation"
        "javascript"
      ]
    }
    {
      name: "CodeIgniter"
      order: 9
      borderColor: "#ff4400"
      textColor: "#fff"
      icon: "codeigniter.png"
      proficiency: 100
      visible: true
      tags: [
        "development"
        "frameworks"
        "backend"
        "frontend"
        "php"
      ]
    }
    {
      name: "jQuery"
      order: 10
      borderColor: "#000004"
      textColor: "#fff"
      icon: "jquery.png"
      proficiency: 100
      visible: true
      tags: [
        "development"
        "frameworks"
        "frontend"
        "javascript"
      ]
    }
    {
      name: "Photoshop"
      order: 11
      borderColor: "#2b2841"
      textColor: "#fff"
      icon: "photoshop.png"
      proficiency: 100
      visible: true
      tags: [
        "design"
      ]
    }
    {
      name: "Illustrator"
      order: 12
      borderColor: "#6b5945"
      textColor: "#fff"
      icon: "illustrator.png"
      proficiency: 100
      visible: true
      tags: [
        "design"
      ]
    }
    {
      name: "Angular"
      order: 13
      borderColor: "#c8464b"
      textColor: "#fff"
      icon: "angular.png"
      proficiency: 100
      visible: true
      tags: [
        "development"
        "frameworks"
        "frontend"
        "javascript"
      ]
    }
    {
      name: "Git"
      order: 14
      borderColor: "#000000"
      textColor: "#fff"
      icon: "git.png"
      proficiency: 100
      visible: true
      tags: [
        "version_control"
        "development"
      ]
    }
    {
      name: "NodeJS"
      order: 15
      borderColor: "#3b3d33"
      textColor: "#fff"
      icon: "nodejs.png"
      proficiency: 100
      visible: true
      tags: [
        "development"
        "frameworks"
        "backend"
        "javascript"
      ]
    }
    {
      name: "Drupal"
      order: 16
      borderColor: "#005890"
      textColor: "#fff"
      icon: "drupal.png"
      proficiency: 100
      visible: true
      tags: [
        "development"
        "frameworks"
        "frontend"
        "backend"
        "php"
      ]
    }
    {
      name: "Sinatra"
      order: 17
      borderColor: "#c4bca7"
      textColor: "#000"
      icon: "sinatra.png"
      proficiency: 100
      visible: true
      tags: [
        "development"
        "backend"
        "ruby"
      ]
    }
    {
      name: "WordPress"
      order: 18
      borderColor: "#464646"
      textColor: "#fff"
      icon: "wordpress.png"
      proficiency: 100
      visible: true
      tags: [
        "development"
        "frameworks"
        "frontend"
        "backend"
        "php"
      ]
    }
    {
      name: "Zend Framework"
      order: 19
      borderColor: "#65b800"
      textColor: "#fff"
      icon: "zendframework.png"
      proficiency: 100
      visible: true
      tags: [
        "development"
        "frameworks"
        "frontend"
        "backend"
        "php"
      ]
    }
    {
      name: "3ds Max"
      order: 20
      borderColor: "#0a4f50"
      textColor: "#fff"
      icon: "3dsmax.png"
      proficiency: 100
      visible: true
      tags: [
        "hobbies"
        "design"
      ]
    }
    {
      name: "Maya"
      order: 21
      borderColor: "#0c4b4b"
      textColor: "#fff"
      icon: "maya.png"
      proficiency: 100
      visible: true
      tags: [
        "hobbies"
        "design"
      ]
    }
    {
      name: "Guitar"
      order: 22
      borderColor: "#b15301"
      textColor: "#fff"
      icon: "guitar.png"
      proficiency: 100
      visible: true
      tags: [
        "hobbies"
      ]
    }
    {
      name: "CoffeeScript"
      order: 23
      borderColor: "#28334c"
      textColor: "#fff"
      icon: "coffeescript.png"
      proficiency: 100
      visible: true
      tags: [
        "development"
        "languages"
        "frontend"
        "javascript"
      ]
    }
    {
      name: "Joomla"
      order: 24
      borderColor: "#5fa920"
      textColor: "#fff"
      icon: "joomla.png"
      proficiency: 100
      visible: true
      tags: [
        "development"
        "frameworks"
        "php"
      ]
    }
    {
      name: "Jekyll"
      order: 25
      borderColor: "#b80000"
      textColor: "#fff"
      icon: "jekyll.png"
      proficiency: 100
      visible: true
      tags: [
        "frameworks"
      ]
    }
    {
      name: "Bootstrap"
      order: 2
      borderColor: "#31153e"
      textColor: "#fff"
      icon: "bootstrap.png"
      proficiency: 100
      visible: true
      tags: [
        "development"
        "frameworks"
        "frontend"
      ]
    }
    {
      name: "Mac"
      order: 26
      borderColor: "#1d77f6"
      textColor: "#fff"
      icon: "mac.png"
      proficiency: 100
      visible: true
      tags: [
        "os"
      ]
    }
    {
      name: "Windows"
      order: 2
      borderColor: "#0eb9f5"
      textColor: "#fff"
      icon: "windows.png"
      proficiency: 100
      visible: true
      tags: [
        "os"
      ]
    }
    {
      name: "Linux"
      order: 27
      borderColor: "#000000"
      textColor: "#fff"
      icon: "linux.png"
      proficiency: 100
      visible: true
      tags: [
        "os"
      ]
    }
    {
      name: "Raspberry Pi"
      order: 28
      borderColor: "#be0940"
      textColor: "#fff"
      icon: "raspberrypi.png"
      proficiency: 100
      visible: true
      tags: [
        "hobbies"
      ]
    }
  ]

  constructor: ->
    @filterSkills()
    $(document).on "touchstart", ".skill-container", @bindTouchStartEvent
    $(document).on "click", "#skill-filter ul li a", @filterSkills
    $(document).on "mouseover touchstart", ".skill-container", @styleThisSkill
    $(document).on "mouseout", ".skill-container", @resetSkillStyles
    # $(document).on "touchstart mouseover", ".skill-container", @applyProficiencyHeight
    # $(document).on "touchend mouseout", ".skill-container", @removeProficiencyHeight

  generateSkills: (skills) ->
    SKILLS_CONTAINER.empty()
    visibleSkills = _.where(skills, visible: true)
    sortedVisibleSkills = _.sortBy(visibleSkills, "order")
    _.each sortedVisibleSkills, (skill, index) ->
      SKILLS_CONTAINER.append SKILL_TEMPLATE(sortedVisibleSkills[index])

  bindTouchStartEvent: ->
    $(".skill-container").removeClass("hover")
    $(@).toggleClass("hover")

  filterSkills: (event) =>
    event.preventDefault() if event # There's no event object on initial page load
    filter = if event then $(event.target)[0].hash.substring(1) else false
    filteredSkills = []
    _.each SKILLS, (skill, index) ->
      if !_.contains(skill.tags, filter) and filter
        skill.cssClass = "filtered"  # Dynamic properties -- this feels hacky
        # skill.order = skill['order'] # Reset to the original order
      else
        skill.cssClass = ""
        # skill.order = 0 if filter # Force it to the top
      filteredSkills.push(skill)
    @generateSkills(filteredSkills)
    @setFilterLabel $(event.target).text() if event # filteredSkills.length

  styleThisSkill: ->
    $(".skill-container").css opacity: 0.1, transform: "scale(0.9, 0.9)"
    $(@).css opacity: 1

  resetSkillStyles: ->
    $(".skill-container").css opacity: "", transform: ""

  setFilterLabel: (skillLabel) -> # skillCount
    $("#skill-filter .dropdown-toggle").html "#{skillLabel}<i class='fa fa-caret-down'></i>" # (#{skillCount})

  # applyProficiencyHeight: ->
  #   $(@).find('.skill-proficiency').css "max-height": "100%"

  # removeProficiencyHeight: ->
  #   $(@).find('.skill-proficiency').css "max-height": "0%"

$(document).ready =>
  @app ?= {}
  @app.skill = new Skill