// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

main = function(){
  checkPasswordMatch();
}

checkPasswordMatch = function() {
  var pass1 = $("#pass1");
  var pass2 = $("#pass2");
  var btn = $("#submit");
  btn.attr("disabled", "disabled");

  pass1.keyup(function(){
    if(pass1.val() == pass2.val()){
      btn.removeAttr("disabled");
    } else{
      btn.attr("disabled", "disabled");
    }
  });
  pass2.keyup(function(){
    if(pass1.val() == pass2.val()){
      btn.removeAttr("disabled");
    } else{
      btn.attr("disabled", "disabled");
    }
  });
}

$(document).on("turbolinks:load", main());
