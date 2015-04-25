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
      $('#messages').detach().html(result).prependTo('#message-panel');
    }).fail(function(result){
      console.log(result);
    });
  });
});

function getMessages (data){
  var promise = $.Deferred();
  $.ajax({
    url: '/messages',
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
}

