var map;
var markers = [];

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 37.329732, lng: -121.90178200000001},
    zoom: 13
  });

  var largeInfoWindow = new google.maps.InfoWindow();
  var bounds = new google.maps.LatLngBounds();

  function addMarker(lat, lng) {
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(lat, lng),
      map: map,
      name: name,
      animation: google.maps.Animation.DROP
    });
  }

  markers.push(marker);
  bounds.extend(marker.position);

  marker.addListener('click', function() {
    populateInfoWindow(this, largeInfoWindow);
  });
  map.fitBounds(bounds);

  function populateInfoWindow(marker, infowindow) {
    if (infowindow.marker != marker) {
      infowindow.marker = marker;
      infowindow.setContent('<div>' + marker.name + '</div>');
      infowindow.open(map, marker);
      infowindow.addListener('closeclick', function() {
        infowindow.setMarker(null);
      });
    }
  }
}
