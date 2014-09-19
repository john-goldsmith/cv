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
            <div class="skill-name">
              <%= name %>
            </div>
            <div class="skill-proficiency"></div>
          </div>
        </div>
      </div>
    </div>')
  # style="height: <%= proficiency %>%;"
  SKILLS = [
    {
      name: "Ruby"
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
      name: "Rails"
      order: 3
      borderColor: "#a02c2e"
      textColor: "#fff"
      icon: "rails.png"
      proficiency: 85
      tags: [
        "programming"
        "frameworks"
        "ruby"
        "backend"
      ]
    }
    {
      name: "PHP"
      order: 5
      borderColor: "#5967a8"
      textColor: "#fff"
      icon: "php.png"
      proficiency: 100
      tags: [
        "programming"
        "languages"
        "backend"
        "php"
      ]
    }
    {
      name: "MySQL"
      order: 6
      borderColor: "#007d7e"
      textColor: "#fff"
      icon: "mysql.png"
      proficiency: 100
      tags: [
        "programming"
        "languages"
        "backend"
      ]
    }
    {
      name: "HTML5"
      order: 4
      borderColor: "#e64c17"
      textColor: "#fff"
      icon: "html5.png"
      proficiency: 100
      tags: [
        "programming"
        "languages"
        "frontend"
      ]
    }
    {
      name: "CSS3"
      order: 2
      borderColor: "#006ebd"
      textColor: "#fff"
      icon: "css3.png" #php.png
      proficiency: 100
      tags: [
        "programming"
        "languages"
        "frontend"
      ]
    }
    {
      name: "Bower"
      order: 2
      borderColor: "#553728"
      textColor: "#fff"
      icon: "bower.png"
      proficiency: 100
      tags: [
        "package_manager"
        "javascript"
      ]
    }
    {
      name: "Grunt"
      order: 2
      borderColor: "#2f0c00"
      textColor: "#fff"
      icon: "grunt.png"
      proficiency: 100
      tags: [
        "automation"
        "javascript"
      ]
    }
    {
      name: "CodeIgniter"
      order: 2
      borderColor: "#ff4400"
      textColor: "#fff"
      icon: "codeigniter.png"
      proficiency: 100
      tags: [
        "programming"
        "frameworks"
        "backend"
        "frontend"
        "php"
      ]
    }
    {
      name: "jQuery"
      order: 2
      borderColor: "#000004"
      textColor: "#fff"
      icon: "jquery.png"
      proficiency: 100
      tags: [
        "programming"
        "frameworks"
        "frontend"
        "javascript"
      ]
    }
    {
      name: "Photoshop"
      order: 2
      borderColor: "#2b2841"
      textColor: "#fff"
      icon: "photoshop.png"
      proficiency: 100
      tags: [
        "design"
      ]
    }
    {
      name: "Illustrator"
      order: 2
      borderColor: "#6b5945"
      textColor: "#fff"
      icon: "illustrator.png"
      proficiency: 100
      tags: [
        "design"
      ]
    }
    {
      name: "Angular"
      order: 2
      borderColor: "#c8464b"
      textColor: "#fff"
      icon: "angular.png"
      proficiency: 100
      tags: [
        "programming"
        "frameworks"
        "frontend"
        "javascript"
      ]
    }
    {
      name: "Git"
      order: 2
      borderColor: "#000000"
      textColor: "#fff"
      icon: "git.png"
      proficiency: 100
      tags: [
        "version_control"
        "programming"
      ]
    }
    {
      name: "NodeJS"
      order: 2
      borderColor: "#2b2841"
      textColor: "#fff"
      icon: "nodejs.png"
      proficiency: 100
      tags: [
        "programming"
        "frameworks"
        "backend"
        "javascript"
      ]
    }
    {
      name: "Drupal"
      order: 2
      borderColor: "#005890"
      textColor: "#fff"
      icon: "drupal.png"
      proficiency: 100
      tags: [
        "programming"
        "frameworks"
        "frontend"
        "backend"
        "php"
      ]
    }
    {
      name: "Sinatra"
      order: 2
      borderColor: "#c4bca7"
      textColor: "#fff"
      icon: "sinatra.png"
      proficiency: 100
      tags: [
        "programming"
        "backend"
        "ruby"
      ]
    }
    {
      name: "WordPress"
      order: 2
      borderColor: "#464646"
      textColor: "#fff"
      icon: "wordpress.png"
      proficiency: 100
      tags: [
        "programming"
        "frameworks"
        "frontend"
        "backend"
        "php"
      ]
    }
    {
      name: "Zend Framework"
      order: 2
      borderColor: "#65b800"
      textColor: "#fff"
      icon: "zendframework.png"
      proficiency: 100
      tags: [
        "programming"
        "frameworks"
        "frontend"
        "backend"
        "php"
      ]
    }
    {
      name: "3ds Max"
      order: 2
      borderColor: "#0a4f50"
      textColor: "#fff"
      icon: "3dsmax.png"
      proficiency: 100
      tags: [
        "hobby"
        "design"
      ]
    }
    {
      name: "Maya"
      order: 2
      borderColor: "#0c4b4b"
      textColor: "#fff"
      icon: "maya.png"
      proficiency: 100
      tags: [
        "hobby"
        "design"
      ]
    }
    {
      name: "Guitar"
      order: 2
      borderColor: "#b15301"
      textColor: "#fff"
      icon: "guitar.png"
      proficiency: 100
      tags: [
        "hobby"
      ]
    }
    {
      name: "CoffeeScript"
      order: 2
      borderColor: "#28334c"
      textColor: "#fff"
      icon: "coffeescript.png"
      proficiency: 100
      tags: [
        "programming"
        "languages"
        "frontend"
        "javascript"
      ]
    }
    {
      name: "Joomla"
      order: 2
      borderColor: "#5fa920"
      textColor: "#fff"
      icon: "joomla.png"
      proficiency: 100
      tags: [
        "programming"
        "frameworks"
        "php"
      ]
    }
    {
      name: "Jekyll"
      order: 2
      borderColor: "#b80000"
      textColor: "#fff"
      icon: "jekyll.png"
      proficiency: 100
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
      tags: [
        "programming"
        "frameworks"
        "frontend"
      ]
    }
    {
      name: "Mac"
      order: 2
      borderColor: "#1d77f6"
      textColor: "#fff"
      icon: "mac.png"
      proficiency: 100
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
      tags: [
        "os"
      ]
    }
    {
      name: "Linux"
      order: 2
      borderColor: "#000000"
      textColor: "#fff"
      icon: "linux.png"
      proficiency: 100
      tags: [
        "os"
      ]
    }
  ]

  constructor: ->
    @generateSkills(_.sortBy(SKILLS, "order"))
    $(document).on "touchstart", ".skill-container", @bindTouchStartEvent
    $(document).on "click", ".skill-tag", @filterSkills
    # $(document).on "touchstart mouseover", ".skill-container", @applyProficiencyHeight
    # $(document).on "touchend mouseout", ".skill-container", @removeProficiencyHeight

  generateSkills: (skills) =>
    SKILLS_CONTAINER.empty()
    _.each skills, (element, index) ->
      SKILLS_CONTAINER.append SKILL_TEMPLATE(skills[index])

  bindTouchStartEvent: ->
    $(".skill-container").removeClass("hover")
    $(@).toggleClass("hover")

  filterSkills: ->
    console.log $(@), $(@)[0].hash
    # filter = $(@)[0].hash.substring(1)
    # filteredSkills = SKILLS.where "tags" include filter
    # @generateSkills(filteredSkills)
    # @generateSkills(SKILLS)

  # applyProficiencyHeight: ->
  #   $(@).find('.skill-proficiency').css "max-height": "100%"

  # removeProficiencyHeight: ->
  #   $(@).find('.skill-proficiency').css "max-height": "0%"

$(document).ready =>
  @app ?= {}
  @app.skill = new Skill