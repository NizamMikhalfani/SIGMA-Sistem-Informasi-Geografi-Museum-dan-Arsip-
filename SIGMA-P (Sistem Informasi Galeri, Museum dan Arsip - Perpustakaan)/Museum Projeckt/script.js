require(["esri/Map", "esri/views/MapView", "esri/Graphic"], function(Map, MapView, Graphic) {
    var map = new Map({
        basemap: "streets-navigation-vector"
    });

    var view = new MapView({
        container: "viewDiv",
        map: map,
        center: [101.5, -0.9], // Koordinat pusat peta (longitude, latitude)
        zoom: 12
    });

    // Data museum
    var museums = [
        {
            name: "Museum A",
            location: [101.5, -0.9],
            hours: "Senin - Jumat: 09:00 - 17:00"
        },
        {
            name: "Museum B",
            location: [101.6, -0.8],
            hours: "Sabtu - Minggu: 10:00 - 18:00"
        }
    ];

    // Menambahkan lokasi museum ke peta
    museums.forEach(function(museum) {
        var point = {
            type: "point",
            longitude: museum.location[0],
            latitude: museum.location[1]
        };

        var simpleMarkerSymbol = {
            type: "simple-marker",
            color: [226, 119, 40],
            outline: {
                color: [255, 255, 255],
                width: 1
            }
        };

        var pointGraphic = new Graphic({
            geometry: point,
            symbol: simpleMarkerSymbol,
            attributes: museum,
            popupTemplate: {
                title: museum.name,
                content: museum.hours
            }
        });

        view.graphics.add(pointGraphic);
    });
});