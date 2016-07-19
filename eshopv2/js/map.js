      function initialize() {
          var mapCanvas = document.getElementById('map');
          var mapOptions = {
              center: new google.maps.LatLng(45.3810852, 20.3917569),
              zoom: 15,
              mapTypeId: google.maps.MapTypeId.ROADMAP
          }
          var map = new google.maps.Map(mapCanvas, mapOptions)
          var place = new google.maps.Marker({
              position: new google.maps.LatLng(45.380945, 20.393792),
              map: map
          })
      }
google.maps.event.addDomListener(window, 'load', initialize);