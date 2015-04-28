
// $('div#map-canvas').append("<%= escape_javascript(render 'map') %>"

var ulat;
var ulng;
var user;
var zoo = new google.maps.LatLng(-41.32, 174.78);
var map;

 $(document).ready(function(){
  var wellington = new google.maps.LatLng(-41.299, 174.777);
  alert ("Got here...");

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

google.maps.event.addDomListener(window, 'load', initialize);

// $('div#map-canvas').append("<%= escape_javascript(render 'map') %>")
//ajaxify viewmap link in profile page.
//get json back use to position
