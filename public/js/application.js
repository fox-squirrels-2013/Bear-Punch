$(document).ready(function() {
  $("#evaluate").on("click", function(){
    fadeOutEvaluate()
    $("#scanning_message").text("Scanning...")
    $("#scanning_message").toggleClass("bigger_text")
    setTimeout(displayScanning, 1000)
    setTimeout(displayScanning, 3000)
    setTimeout(displayScanning, 5000)
    setTimeout(function(){$("#scanning_message").text("Completing scan...")}, 7000)
    setTimeout(displayScanning, 7000)
    setTimeout(function(){$("#scanning_message").toggleClass("bigger_text")}, 9000)    
    setTimeout(function(){$("#scanning_message").text("")}, 9000)
    setTimeout(displayForm, 9000)
  })

  function fadeOutEvaluate() {
    $("#eval_heading").animate({opacity:0})
    $("#evaluate").animate({opacity:0})
  }

  function fadeInDeliveredForm() {
    $("#scanning_message").animate({opacity:1})
  }

  function displayScanning() {
    $("#scanning_message").animate({opacity:1}, 500)
    setTimeout(function(){$("#scanning_message").animate({opacity:0}, 500)}, 1000)
  }

  function displayForm() {
    $("#personality_form").animate({opacity:1}, 500)
  }
});
