$(document).ready(function(){

  $(".rating-button").click(function(e){
     e.preventDefault();
    var url =$(this).parent().parent().attr("action");
    var data = $(this).parent().parent().serializeArray();
    $.ajax({
     url:url,
     method:"POST",
     data:data,
     success:function(res){
      $("#lesson-rating-form").remove();
      $("#ratings").append(res);
     },
     error:function(){
      alert("Could not create rating")
     }
    });
  });


 $("#add-learning-objective").click(function(e){
        e.preventDefault();
       $(".learning-objectives").append($("#new-learning-objectives").html());
     });

});