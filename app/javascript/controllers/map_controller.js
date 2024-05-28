import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
// import { Controller } from "@hotwired/stimulus"
// import mapboxgl from 'mapbox-gl'

// // Connects to data-controller="map"
// export default class extends Controller {
//   static values = {
//     apiKey: String,
//     markers: Array
//   }

//   connect() {
//     console.log("Map controller connected")
//     console.log("API Key:", this.apiKeyValue)
//     console.log("Markers:", this.markersValue)

//     if (!this.apiKeyValue) {
//       console.error("Mapbox API key is missing")
//       return
//     }

//     mapboxgl.accessToken = this.apiKeyValue

//     this.map = new mapboxgl.Map({
//       container: this.element,
//       style: "mapbox://styles/mapbox/streets-v10"
//     })

//     this.map.on('load', () => {
//       console.log("Map loaded")
//       this.#addMarkersToMap()
//       this.#fitMapToMarkers()
//     })
//   }

//   #addMarkersToMap() {
//     console.log("Adding markers to map:", this.markersValue)
//     this.markersValue.forEach((marker) => {
//       const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
//       new mapboxgl.Marker()
//         .setLngLat([ marker.lng, marker.lat ])
//         .setPopup(popup)
//         .addTo(this.map)
//     })
//   }

//   #fitMapToMarkers() {
//     console.log("Fitting map to markers")
//     const bounds = new mapboxgl.LngLatBounds()
//     this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
//     this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
//   }
// }
