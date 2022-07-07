<script>
    var watchID = null;
    $(document).ready(function() {
        var optn = {
            enableHighAccuracy: true,
            timeout: Infinity,
            maximumAge: 0
        };
        if (navigator.geolocation)
            navigator.geolocation.watchPosition(success, fail, optn);
        else
            $("p").html("HTML5 Not Supported");
        $("button").click(function() {

            if (watchID)
                navigator.geolocation.clearWatch(watchID);

            watchID = null;
            return false;
        });

    });

    function success(position) {
        var googleLatLng = new google.maps.LatLng(position.coords.latitude,
            position.coords.longitude);
        var mapOtn = {
            zoom: 10,
            center: googleLatLng,
            mapTypeId: google.maps.MapTypeId.ROAD
        };

        var Pmap = document.getElementById("map");

        var map = new google.maps.Map(Pmap, mapOtn);
        addMarker(map, googleLatLng);
    }

    function addMarker(map, googleLatLng, title, content) {
        var markerOptn = {
            position: googleLatLng,
            map: map,
            title: title,
            animation: google.maps.Animation.DROP
        };

        var marker = new google.maps.Marker(markerOptn);

        var infoWindow = new google.maps.InfoWindow({
            content: content,
            position: googleLatLng
        });
        google.maps.event.addListener(marker, "click", function() {
            infoWindow.open(map);
        });
    }
</script>
