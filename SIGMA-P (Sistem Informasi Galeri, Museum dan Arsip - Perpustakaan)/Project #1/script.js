// Initialize the map
var map = L.map('map').setView([-6.2607, 106.7816], 13);

// Add OpenStreetMap tiles
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

// Fetch locations from the server
fetch('locations.php')
    .then(response => response.json())
    .then(locations => {
        locations.forEach(function(location) {
            var marker = L.marker([location.lat, location.lng]).addTo(map);
            marker.bindPopup(location.name);
            marker.on('click', function() {
                document.getElementById('institution-details').innerText = location.info;
                document.getElementById('info').classList.remove('hidden');
            });
        });
    })
    .catch(error => console.error('Error fetching locations:', error));