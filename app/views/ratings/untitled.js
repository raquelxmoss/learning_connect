var map,latLng,marker,infoWindow,ad;function initialize(){
  var myOptions={
    zoom:16,
    panControl:false,
    streetViewControl:true,
    scaleControl:true,
    zoomControl:true,
    zoomControlOptions:{
      style:google.maps.ZoomControlStyle.LARGE,position:google.maps.ControlPosition.LEFT_CENTER},
      scaleControlOptions:{position:google.maps.ControlPosition.BOTTOM_RIGHT},
      mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  map =new google.maps.Map(document.getElementById('googlemaps'),myOptions);
  if(navigator.geolocation) {
    defaultLocation();
    navigator.geolocation.getCurrentPosition(locationFound,defaultLocation);
    console.log(navigator.geolocation.getCurrentPosition(locationFound,defaultLocation));
  }else{
    defaultLocation();
  }
}
