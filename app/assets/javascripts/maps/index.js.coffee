MapSave.openMap = (elId, centerLat, centerLong, zoom) ->
  $("##{elId}").css('height', $(window).innerHeight())
  $("##{elId}").css('width', $(window).innerWidth())

  mapLayer = MQ.mapLayer()
  zoom ||= 4

  map = L.map(elId,
    layers: mapLayer
    center: [centerLat, centerLong]
    zoom: zoom
  )

  L.control.layers(
    'Map': mapLayer
    'Satellite': MQ.satelliteLayer()
    'Hybrid': MQ.hybridLayer()
  ).addTo(map)

# set map's height to window height
$( ->
  $.get(MapSave.Routes.API_LOCATION, null, (data) ->
    if data && data.latitude && data.longitude
      MapSave.openMap('main-leaflet-map', data.latitude, data.longitude)
    else
      MapSave.openMap('main-leaflet-map', 46.1545114, 15.8374613) # central EU
  )
)

# '© OpenStreetMap contributors'