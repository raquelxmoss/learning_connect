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
//= require_tree .
var ulat;
var ulng;
var user;
var zoo = new google.maps.LatLng(-41.32, 174.78);
var map;
$(document).ready(function(){
  function initialize() {
    var mapOptions = {
      center: { lat: -41.299, lng: 174.777},
      zoom: 13
    };
    map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(success, error, options);

    }
    addmarker(zoo);
  }
  var wellington = new google.maps.LatLng(-41.299, 174.777);

  google.maps.event.addDomListener(window, 'load', initialize);
});

 function toggleBounce() {
    if (marker.getAnimation() != null) {
      marker.setAnimation(null);
    } else {
      marker.setAnimation(google.maps.Animation.BOUNCE);
    }
  }

function addmarker(LatLng){
  var marker = new google.maps.Marker({
    map:map,
    draggable:true,
    animation: google.maps.Animation.DROP,
    position: LatLng
  });
  google.maps.event.addListener(marker, 'click', toggleBounce);

}

  var options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
  };

  function success(pos) {
    var crd = pos.coords;
    user = new google.maps.LatLng(crd.latitude,crd.longitude)
    console.log('Your current position is:');
    console.log('Latitude : ' + crd.latitude);
    console.log('Longitude: ' + crd.longitude);
    console.log('More or less ' + crd.accuracy + ' meters.');
    addmarker(user);
  };

  function error(err) {
    console.warn('ERROR(' + err.code + '): ' + err.message);
  };

$("#add-learning-objective").click(function(e){
  e.preventDefault();
  console.log('clicked')
 $(".learning-objectives").append($("#new-learning-objectives").html());
});
   //trying to get google map show on the profile page



