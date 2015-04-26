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
//= require turbolinks
//= require_tree .

$(document).ready(function(){

  $('#create-lesson').click(function(){
    $('#new-lesson-form').toggle();
  });

  $('#view-all-lessons').click(function(){
    $('#all-lessons').toggle();
  });

  $('.message-submit').click(function(e){
    e.preventDefault();
    var formData = $(this).parent().serializeArray()
    getMessages(formData).done(function(result){
      $('#messages').append(result);
    }).fail(function(result){
      alert(result);
    });
  });

 $('.message-destroy').click(function(e){
  e.preventDefault();
  var $parentDiv = $(this).parent()
  var url = $(this).attr('href')
  $.ajax({
    url: url,
    method: 'DELETE',
    success: function(res){
      $parentDiv.remove();
    },
    error: function(){
      alert("Message could not be deleted");
    }
  })
 });
});

function getMessages (data){
  var promise = $.Deferred();
  var id = data[2].value
  $.ajax({
    url: '/connections/'+id+'/messages',
    method: 'POST',
    data: data,
    success: function(res){
      promise.resolve(res);
    },
    error: function(request){
      promise.reject(request);
    }
  });
  return promise ;
};

$("#search_form").bind("ajax:success", (e,data){
    alert('got success back')
    $("#search_results").append(data.responseText);
});
// $("#search").submit(function(e){
//   alert ("search form submitted");

// });