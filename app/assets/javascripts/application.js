// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){

$("#add-learning-objective").click(function(e){
  e.preventDefault();
  console.log('clicked')
 $(".learning-objectives").append($("#new-learning-objectives").html());
 });

var users = $('.all-users').children();
  for(var i=0; i < users.length; i++){
    if (i%3 == 2) {
      var children = $(users[i]).children()
      for(var j=0; j < children.length; j++){
        $(children[j]).after("<div class='row'>");
      }
    }
}

 // $('.map').click(function (e) {
 //    e.preventDefault();

 //    // var li = $(this).parent();
 //    //var id = li.data("id");
 //    var url = ('/map/' + 5);
 //    $.ajax({
 //      url: url,
 //      method:'GET',
 //      success:function(res){
 //      addMarker(res.lat,res.long);
 //      },
 //      error: function(req, errorType, errorMessage){
 //        alert(req, errorType, errorMessage);
 //      }
 //    });


 });

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .











