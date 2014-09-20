(function() {
  var Skill,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Skill = (function() {
    var SKILLS, SKILLS_CONTAINER, SKILL_TEMPLATE;

    SKILLS_CONTAINER = $("#skills");

    SKILL_TEMPLATE = _.template('<div class="col-md-3 col-sm-4 col-xs-6"> <div class="skill-container center-block <%= cssClass %>" style="border-color: <%= borderColor %>;"> <div class="skill"> <div class="skill-front"> <img src="images/skills/<%= icon %>" alt="<%= name %>" /> </div> <div class="skill-back" style="color: <%= textColor %>; background-color: <%= borderColor %>;"> <div class="skill-name"> <%= name %> </div> <div class="skill-proficiency"></div> </div> </div> </div> </div>');

    SKILLS = [
      {
        name: "Ruby",
        order: 1,
        borderColor: "#c11000",
        textColor: "#fff",
        icon: "ruby.png",
        proficiency: 85,
        visible: true,
        tags: ["development", "languages", "ruby", "backend"]
      }, {
        name: "Rails",
        order: 3,
        borderColor: "#a02c2e",
        textColor: "#fff",
        icon: "rails.png",
        proficiency: 85,
        visible: true,
        tags: ["development", "frameworks", "ruby", "backend"]
      }, {
        name: "PHP",
        order: 5,
        borderColor: "#5967a8",
        textColor: "#fff",
        icon: "php.png",
        proficiency: 100,
        visible: true,
        tags: ["development", "languages", "backend", "php"]
      }, {
        name: "MySQL",
        order: 6,
        borderColor: "#007d7e",
        textColor: "#fff",
        icon: "mysql.png",
        proficiency: 100,
        visible: true,
        tags: ["development", "languages", "backend"]
      }, {
        name: "HTML5",
        order: 4,
        borderColor: "#e64c17",
        textColor: "#fff",
        icon: "html5.png",
        proficiency: 100,
        visible: true,
        tags: ["development", "languages", "frontend"]
      }, {
        name: "CSS3",
        order: 2,
        borderColor: "#006ebd",
        textColor: "#fff",
        icon: "css3.png",
        proficiency: 100,
        visible: true,
        tags: ["development", "languages", "frontend"]
      }, {
        name: "Bower",
        order: 2,
        borderColor: "#553728",
        textColor: "#fff",
        icon: "bower.png",
        proficiency: 100,
        visible: true,
        tags: ["package_manager", "javascript"]
      }, {
        name: "Grunt",
        order: 2,
        borderColor: "#2f0c00",
        textColor: "#fff",
        icon: "grunt.png",
        proficiency: 100,
        visible: true,
        tags: ["automation", "javascript"]
      }, {
        name: "CodeIgniter",
        order: 2,
        borderColor: "#ff4400",
        textColor: "#fff",
        icon: "codeigniter.png",
        proficiency: 100,
        visible: true,
        tags: ["development", "frameworks", "backend", "frontend", "php"]
      }, {
        name: "jQuery",
        order: 2,
        borderColor: "#000004",
        textColor: "#fff",
        icon: "jquery.png",
        proficiency: 100,
        visible: true,
        tags: ["development", "frameworks", "frontend", "javascript"]
      }, {
        name: "Photoshop",
        order: 2,
        borderColor: "#2b2841",
        textColor: "#fff",
        icon: "photoshop.png",
        proficiency: 100,
        visible: true,
        tags: ["design"]
      }, {
        name: "Illustrator",
        order: 2,
        borderColor: "#6b5945",
        textColor: "#fff",
        icon: "illustrator.png",
        proficiency: 100,
        visible: true,
        tags: ["design"]
      }, {
        name: "Angular",
        order: 2,
        borderColor: "#c8464b",
        textColor: "#fff",
        icon: "angular.png",
        proficiency: 100,
        visible: true,
        tags: ["development", "frameworks", "frontend", "javascript"]
      }, {
        name: "Git",
        order: 2,
        borderColor: "#000000",
        textColor: "#fff",
        icon: "git.png",
        proficiency: 100,
        visible: true,
        tags: ["version_control", "development"]
      }, {
        name: "NodeJS",
        order: 2,
        borderColor: "#3b3d33",
        textColor: "#fff",
        icon: "nodejs.png",
        proficiency: 100,
        visible: true,
        tags: ["development", "frameworks", "backend", "javascript"]
      }, {
        name: "Drupal",
        order: 2,
        borderColor: "#005890",
        textColor: "#fff",
        icon: "drupal.png",
        proficiency: 100,
        visible: true,
        tags: ["development", "frameworks", "frontend", "backend", "php"]
      }, {
        name: "Sinatra",
        order: 2,
        borderColor: "#c4bca7",
        textColor: "#000",
        icon: "sinatra.png",
        proficiency: 100,
        visible: true,
        tags: ["development", "backend", "ruby"]
      }, {
        name: "WordPress",
        order: 2,
        borderColor: "#464646",
        textColor: "#fff",
        icon: "wordpress.png",
        proficiency: 100,
        visible: true,
        tags: ["development", "frameworks", "frontend", "backend", "php"]
      }, {
        name: "Zend Framework",
        order: 2,
        borderColor: "#65b800",
        textColor: "#fff",
        icon: "zendframework.png",
        proficiency: 100,
        visible: true,
        tags: ["development", "frameworks", "frontend", "backend", "php"]
      }, {
        name: "3ds Max",
        order: 2,
        borderColor: "#0a4f50",
        textColor: "#fff",
        icon: "3dsmax.png",
        proficiency: 100,
        visible: true,
        tags: ["hobbies", "design"]
      }, {
        name: "Maya",
        order: 2,
        borderColor: "#0c4b4b",
        textColor: "#fff",
        icon: "maya.png",
        proficiency: 100,
        visible: true,
        tags: ["hobbies", "design"]
      }, {
        name: "Guitar",
        order: 2,
        borderColor: "#b15301",
        textColor: "#fff",
        icon: "guitar.png",
        proficiency: 100,
        visible: true,
        tags: ["hobbies"]
      }, {
        name: "CoffeeScript",
        order: 2,
        borderColor: "#28334c",
        textColor: "#fff",
        icon: "coffeescript.png",
        proficiency: 100,
        visible: true,
        tags: ["development", "languages", "frontend", "javascript"]
      }, {
        name: "Joomla",
        order: 2,
        borderColor: "#5fa920",
        textColor: "#fff",
        icon: "joomla.png",
        proficiency: 100,
        visible: true,
        tags: ["development", "frameworks", "php"]
      }, {
        name: "Jekyll",
        order: 2,
        borderColor: "#b80000",
        textColor: "#fff",
        icon: "jekyll.png",
        proficiency: 100,
        visible: true,
        tags: ["frameworks"]
      }, {
        name: "Bootstrap",
        order: 2,
        borderColor: "#31153e",
        textColor: "#fff",
        icon: "bootstrap.png",
        proficiency: 100,
        visible: true,
        tags: ["development", "frameworks", "frontend"]
      }, {
        name: "Mac",
        order: 2,
        borderColor: "#1d77f6",
        textColor: "#fff",
        icon: "mac.png",
        proficiency: 100,
        visible: true,
        tags: ["os"]
      }, {
        name: "Windows",
        order: 2,
        borderColor: "#0eb9f5",
        textColor: "#fff",
        icon: "windows.png",
        proficiency: 100,
        visible: true,
        tags: ["os"]
      }, {
        name: "Linux",
        order: 2,
        borderColor: "#000000",
        textColor: "#fff",
        icon: "linux.png",
        proficiency: 100,
        visible: true,
        tags: ["os"]
      }, {
        name: "Raspberry Pi",
        order: 2,
        borderColor: "#be0940",
        textColor: "#fff",
        icon: "raspberrypi.png",
        proficiency: 100,
        visible: true,
        tags: ["hobbies"]
      }
    ];

    function Skill() {
      this.filterSkills = __bind(this.filterSkills, this);
      this.filterSkills();
      $(document).on("touchstart", ".skill-container", this.bindTouchStartEvent);
      $(document).on("click", "#skill-filter ul li a", this.filterSkills);
      $(document).on("mouseover touchstart", ".skill-container", this.styleThisSkill);
      $(document).on("mouseout", ".skill-container", this.resetSkillStyles);
    }

    Skill.prototype.generateSkills = function(skills) {
      var sortedVisibleSkills, visibleSkills;
      SKILLS_CONTAINER.empty();
      visibleSkills = _.where(skills, {
        visible: true
      });
      sortedVisibleSkills = _.sortBy(visibleSkills, "order");
      return _.each(sortedVisibleSkills, function(skill, index) {
        return SKILLS_CONTAINER.append(SKILL_TEMPLATE(sortedVisibleSkills[index]));
      });
    };

    Skill.prototype.bindTouchStartEvent = function() {
      $(".skill-container").removeClass("hover");
      return $(this).toggleClass("hover");
    };

    Skill.prototype.filterSkills = function(event) {
      var filter, filteredSkills;
      if (event) {
        event.preventDefault();
      }
      if (event) {
        filter = $(event.target)[0].hash.substring(1);
      }
      filteredSkills = [];
      _.each(SKILLS, function(skill, index) {
        if (!_.contains(skill.tags, filter) && filter) {
          skill.cssClass = "filtered";
        } else {
          skill.cssClass = "";
        }
        return filteredSkills.push(skill);
      });
      this.generateSkills(filteredSkills);
      if (event) {
        return this.setFilterLabel($(event.target).text());
      }
    };

    Skill.prototype.styleThisSkill = function() {
      $(".skill-container").css({
        opacity: 0.1,
        transform: "scale(0.9, 0.9)"
      });
      return $(this).css({
        opacity: 1
      });
    };

    Skill.prototype.resetSkillStyles = function() {
      return $(".skill-container").css({
        opacity: "",
        transform: ""
      });
    };

    Skill.prototype.setFilterLabel = function(skillLabel) {
      return $("#skill-filter .dropdown-toggle").html("" + skillLabel + "<i class='fa fa-caret-down'></i>");
    };

    return Skill;

  })();

  $(document).ready((function(_this) {
    return function() {
      if (_this.app == null) {
        _this.app = {};
      }
      return _this.app.skill = new Skill;
    };
  })(this));

}).call(this);

//# sourceMappingURL=skills.js.map
