MapSave.openMap = (elId, centerLat, centerLong, zoom) ->
  $("##{elId}").css('height', $(window).innerHeight())
  $("##{elId}").css('width', $(window).innerWidth())

  zoom ||= 5
  #mapLayer = MQ.mapLayer()

  mapLayer = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',
    attribution: '© OpenStreetMap contributors'
    detectRetina: true
  )

  map = L.map(elId,
    layers: mapLayer
    center: [centerLat, centerLong]
    zoom: zoom
    keyboard: false
  )

  # L.control.layers(
  #   'Map': mapLayer
  #   'Satellite': MQ.satelliteLayer()
  #   'Hybrid': MQ.hybridLayer()
  # ).addTo(map)

# set map's height to window height
$( ->
  $.get(MapSave.Routes.API_LOCATION, null, (data) ->
    if data && data.latitude && data.longitude
      MapSave.openMap('main-leaflet-map', data.latitude, data.longitude)
    else
      MapSave.openMap('main-leaflet-map', 46.1545114, 15.8374613) # central EU
  )
)

#