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
  });
     $("#add-learning-objective").click(function(e){
        e.preventDefault();
        console.log('clicked')
       $(".learning-objectives").append($("#new-learning-objectives").html());
     });
   //trying to get google map show on the profile page



