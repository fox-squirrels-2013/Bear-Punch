$(document).ready(function() {
  var enhanceSelection

  $("#selection").on("submit", function(e){
    e.preventDefault()
    enhanceSelection = $("#selection select").val()
    fadeOutDeficiencies()
    setTimeout(function(){$("#personality_form").removeClass("offscreen")}, 1000)
    setTimeout(function(){fadeInPersonalityForm()}, 1010)
  })

  $("#evaluate").on("click", function(){
    fadeOutEvaluate()
    setTimeout(function(){$("#evaluate").remove()}, 500)
    $("#scanning_message").text("Scanning...")
    $("#scanning_message").toggleClass("bigger_text")
    setTimeout(displayScanning, 1000)
    setTimeout(displayScanning, 3000)
    setTimeout(displayScanning, 5000)
    setTimeout(function(){$("#scanning_message").text("Completing scan...")}, 7000)
    setTimeout(displayScanning, 7000)
    setTimeout(function(){$("#scanning_message").toggleClass("bigger_text")}, 9000)    
    setTimeout(function(){$("#scanning_message").text("")}, 9000)
    setTimeout(enableEnhanceButton, 9000)
    setTimeout(displayDeficiencies, 9000)
    setTimeout(displayAttrSelector, 9000)
  })

  $("#activate_autopilot").on("click", function(){
    fadeOutPersonalityForm()
    setTimeout(fadeInAutopilotConfirmation, 1000)
    // IMPLEMENTING: set session[:autopilot] = true in a Sinatra post route via AJAX
    // IMPLEMENTING: make 'confirm autopilot' div be displaying instead of anything else at bottom
    // of index.erb on-browser screen if session[:autopilot] = true
  })

  function fadeOutEvaluate() {
    $("#eval_heading").animate({opacity:0}, 500)
    $("#evaluate").animate({opacity:0}, 500)
  }

  function fadeInDeliveredForm() {
    $("#scanning_message").animate({opacity:1})
  }

  function displayScanning() {
    $("#scanning_message").animate({opacity:1}, 500)
    setTimeout(function(){$("#scanning_message").animate({opacity:0}, 500)}, 1000)
  }

  function displayDeficiencies() {
    $("#deficiencies").removeClass("offscreen")
    $("#deficiencies").animate({opacity:1}, 500)
  }

  function fadeOutDeficiencies() {
    $("#deficiencies").animate({opacity:0}, 500)
  }

  function enableEnhanceButton() {
    $("#enhance_button_holder").append("<input id='enhance_button' class='small_button' type='submit' value='Enhance!'>")
    $("#enhance_button_holder").animate({opacity:1}, 500)
  }

  function fadeInPersonalityForm() {
    $("#personality_form").animate({opacity:1}, 500)
  }

  function displayAttrSelector() {
    $("#selection").animate({opacity:1}, 500)
  }

  function fadeOutPersonalityForm() {
    $("#personality_form").animate({opacity:0}, 500)
    setTimeout(function(){$("#personality_form").addClass('offscreen')}, 510)    
  }

  function fadeInAutopilotConfirmation() {
    $("#autopilot_confirm").append("<h2>Autopilot Configured!</h2><button id='disable_autopilot' class='small_button'>Disable Autopilot</button>")
    $("#disable_autopilot").on("click", function(){
      $("#autopilot_confirm").animate({opacity:0}, 500)
      setTimeout(function(){
        $("#autopilot_confirm").html("")
        $("#autopilot_confirm").append("<h2>I'm sorry, I'm afraid I can't do that.</h2>")
        setTimeout(function(){$("#autopilot_confirm").animate({opacity:1}, 500)}, 100)
        // IMPLEMENTING: add user's first name to this h2 (have it be a partial instead?)
      }, 900)
    })
    setTimeout(function(){$("#autopilot_confirm").animate({opacity:1}, 500)}, 10)
  }

  function fadeOutAutopilotConfirmation() {
    $("#autopilot_confirm").animate({opacity:0}, 500)
    // IMPLEMENTING: add their real intel/humor/attract submission and fake others
  }

  // function fadeInNoNo() {
  //   $("#autopilot_confirm").html("")
  //   $("#autopilot_confirm").append("<h2>I'm sorry, I'm afraid I can't do that.</h2>")
  //   setTimeout(function(){$("#autopilot_confirm").animate({opacity:1}, 500)}, 100)
    // IMPLEMENTING: add user's first name to this h2 (have it be a partial instead?)
  // }
  
});




