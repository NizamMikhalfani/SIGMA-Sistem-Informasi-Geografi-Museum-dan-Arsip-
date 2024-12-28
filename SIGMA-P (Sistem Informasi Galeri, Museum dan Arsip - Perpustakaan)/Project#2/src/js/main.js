class SigmaApp {
    constructor() {
        this.map = null;
        this.markers = [];
        this.data = {
            museums: [],
            archives: []
        };
    }

    initMap() {
        this.map = L.map('map').setView([-6.200000, 106.816666], 6);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(this.map);
    }

    async fetchLocations() {
        try {
            const response = await fetch('/api/locations');
            const data = await response.json();
            this.data = data;
            this.displayMarkers();
        } catch (error) {
            console.error('Error fetching locations:', error);
        }
    }

    displayMarkers() {
        this.data.museums.forEach(museum => {
            const marker = L.marker([museum.lat, museum.lng])
                .bindPopup(`
                    <h3>${museum.name}</h3>
                    <p>${museum.description}</p>
                `);
            this.markers.push(marker);
            marker.addTo(this.map);
        });
    }
}
