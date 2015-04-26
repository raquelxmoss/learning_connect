$(document).ready(function(){
	$('.container').on('click','.remove-link',function (e) {
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

	$('.add-skill').click(function(e){
	  e.preventDefault();
	  // var input = $(this);
	  var form = $(this).closest("form");
	  var data = (form.serialize());
	  var url=(form.attr("action"));
	  $.ajax({
	    url:url,
	    method:"POST",
	    data:data,
	    success:function(res){
	     form.closest('div').find('ul').append(res);
	     form.find("input[type='text']").val('');
	    },
	    error:function(req,errorT,errorM){
	     alert(errorM);
	    }

	  });
	});
});