
// $('div#map-canvas').append("<%= escape_javascript(render 'map') %>"

var ulat;
var ulng;
var user;
var map;

 $(document).ready(function(){
     var wellington = new google.maps.LatLng(-41.299, 174.777);
  $('.map').click(function (e) {
      e.preventDefault();
      // var li = $(this).parent();
      var id = $(this).data("id");

      var url = ('/map/'+ id);
      console.log(url);
      $.ajax({
        url: url,
        method:'GET',
        success:function(res){
          console.log(res);
          addmarker(new google.maps.LatLng(res['lat'],res['long']));
        },
        error: function(req, errorType, errorMessage){
          alert(req, errorType, errorMessage);
        }
      });
   });
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
    currentLocation = new google.maps.LatLng(crd.latitude,crd.longitude)
    addmarker(currentLocation);
  };

  function error(err) {
    console.warn('ERROR(' + err.code + '): ' + err.message);
  };

 function initialize() {
  if(!$('#map-canvas').length){ return }
    var mapOptions = {
      center: {lat: -41.299, lng: 174.777},
      zoom: 8
    };
    map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(success, error, options);

    }
    //showUserMarker();
  }

google.maps.event.addDomListener(window, 'load', initialize);

// $('div#map-canvas').append("<%= escape_javascript(render 'map') %>")
//ajaxify viewmap link in profile page.
//get json back use to position
