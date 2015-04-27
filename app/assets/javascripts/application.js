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
function initialize() {
  var mapOptions = {
    center: { lat: -41.299, lng: 174.777},
    zoom: 8
  };
  var map = new google.maps.Map(document.getElementById('map-canvas'),
    mapOptions);
}
google.maps.event.addDomListener(window, 'load', initialize);
var wellington= new google.maps.LatLng(-41.299, 174.777);
var zoo = new google.maps.LatLng(-41.32, 174.78);
var marker;
var map;

var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};

function success(pos) {
  var crd = pos.coords;

  console.log('Your current position is:');
  console.log('Latitude : ' + crd.latitude);
  console.log('Longitude: ' + crd.longitude);
  console.log('More or less ' + crd.accuracy + ' meters.');
};

function error(err) {
  console.warn('ERROR(' + err.code + '): ' + err.message);
};


function initialize() {
  var mapOptions = {
    zoom: 13,
    center: wellington
  };

  map = new google.maps.Map(document.getElementById('map-canvas'),
          mapOptions);

  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(success, error, options);
  }

  marker = new google.maps.Marker({
    map:map,
    draggable:true,
    animation: google.maps.Animation.DROP,
    position: zoo
  });
  google.maps.event.addListener(marker, 'click', toggleBounce);
}

function toggleBounce() {

  if (marker.getAnimation() != null) {
    marker.setAnimation(null);
  } else {
    marker.setAnimation(google.maps.Animation.BOUNCE);
  }
}

google.maps.event.addDomListener(window, 'load', initialize);

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

   function loadmap(){
    var script = document.createElement("script");
    script.src ="http://googleapis.com/maps/apis/js?callback=initialize";
    document.body.appendChild(script);
   }



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

   //trying to get google map show on the profile page
  $('form').on("submit" , function(e){
   e.preventDefault();
   var data = $(this).serialize();
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