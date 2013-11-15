$(document).ready(function() {
  $("#evaluate").on("click", function(){
    fadeOutEvaluate()
    $("#delivered_form").text("Scanning...")
    $("#delivered_form").toggleClass("bigger_text")
    setTimeout(displayScanning, 1000)
    setTimeout(displayScanning, 3000)
    setTimeout(displayScanning, 5000)
    setTimeout(function(){$("#delivered_form").text("Completing scan...")}, 7000)
    setTimeout(displayScanning, 7000)
    setTimeout(function(){$("#delivered_form").toggleClass("bigger_text")}, 9000)    
    setTimeout(function(){$("#delivered_form").text("")}, 9000)
    setTimeout(displayForm, 9000)
  })

  function fadeOutEvaluate() {
    $("#eval_heading").animate({opacity:0})
    $("#evaluate").animate({opacity:0})
  }

  function fadeInDeliveredForm() {
    $("#delivered_form").animate({opacity:1})
  }

  function displayScanning() {
    $("#delivered_form").animate({opacity:1}, 500)
    setTimeout(function(){$("#delivered_form").animate({opacity:0}, 500)}, 1000)
  }

  function displayForm() {
    $("#true_delivered_form").animate({opacity:1}, 500)
  }
});
