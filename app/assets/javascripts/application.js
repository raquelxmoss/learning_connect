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

 $('.remove-link').click(function (e) {
  e.preventDefault();
  var uri = ($(location).attr('href'));
  var match = uri.match(/\/users\/\d+/)[0];

  var li = $(this).parent();
  var id = li.data("id");
  var url = (match + '/skills/' + id);

  $.ajax({
   url: url,
   method:'DELETE',
   success:function(res){
    li.remove();
   },
   error: function(req, errorType, errorMessage){
    alert(req, errorType, errorMessage);
   }
  });
});


   $("#add-learning-objective").click(function(e){
      e.preventDefault();
      console.log('clicked')
     $(".learning-objectives").append($("#new-learning-objectives").html());
   });


$('.add-skill').click(function(e){
    e.preventDefault();
  var form = $(this).closest("form");
  var data = (form.serialize());
  var url=(form.attr("action"));
 console.log()
  $.ajax({
    url:url,
    method:"POST",
    data:data,
    success:function(res){
      form.closest('div').find('ul').append(res);
    },
    error:function(req,errorT,errorM){
     alert(errorM);
    }

  });



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