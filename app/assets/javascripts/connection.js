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
       $('#messages').prepend(result);
       $('#content').val('');
     }).fail(function(result){
       // alert("message cannot be empty");
     });
   });

  $('#messages').on('click','.message-destroy',function(e){
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
