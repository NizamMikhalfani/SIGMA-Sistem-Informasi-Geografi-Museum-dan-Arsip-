import { jest } from '@jest/globals';
import L from 'leaflet';

describe('Map initialization', () => {
  let mapInstance;
  
  beforeEach(() => {
    document.body.innerHTML = '<div id="map"></div>';
    mapInstance = {
      setView: jest.fn().mockReturnThis(),
    };
    L.map = jest.fn().mockReturnValue(mapInstance);
    L.tileLayer = jest.fn().mockReturnValue({
      addTo: jest.fn()
    });
  });

  afterEach(() => {
    jest.clearAllMocks();
    document.body.innerHTML = '';
  });

  test('should initialize map with correct coordinates and zoom level', () => {
    const component = {
      initMap() {
        this.map = L.map('map').setView([-6.200000, 106.816666], 6);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(this.map);
      }
    };

    component.initMap();

    expect(L.map).toHaveBeenCalledWith('map');
    expect(mapInstance.setView).toHaveBeenCalledWith([-6.200000, 106.816666], 6);
  });

  test('should add tile layer with correct URL', () => {
    const component = {
      initMap() {
        this.map = L.map('map').setView([-6.200000, 106.816666], 6);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(this.map);
      }
    };

    component.initMap();

    expect(L.tileLayer).toHaveBeenCalledWith('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png');
    expect(L.tileLayer().addTo).toHaveBeenCalledWith(component.map);
  });

  test('should store map instance in component', () => {
    const component = {
      initMap() {
        this.map = L.map('map').setView([-6.200000, 106.816666], 6);
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(this.map);
      }
    };

    component.initMap();

    expect(component.map).toBeDefined();
    expect(component.map).toBe(mapInstance);
  });
});
