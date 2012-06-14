//= require highcharts
//= require highcharts/themes/grid

$(document).ready ->
  updateUserCount = ->
    count = 123
    $.ajax('/analytics/users',
      async: false
      dataType: 'json'
      success: (data) ->
        count = data.count
    )
    count

  updateRoomCount = ->
    count = 123
    $.ajax('/analytics/rooms',
      async: false
      dataType: 'json'
      success: (data) ->
        count = data.count
    )
    count

  time = new Date().getTime()
  data = [
    {x: time - 19000, y: 280}
    {x: time - 18000, y: 320}
    {x: time - 17000, y: 220}
    {x: time - 16000, y: 280}
    {x: time - 15000, y: 320}
    {x: time - 14000, y: 220}
    {x: time - 13000, y: 280}
    {x: time - 12000, y: 320}
    {x: time - 11000, y: 220}
    {x: time - 10000, y: 280}
    {x: time - 9000, y: 320}
    {x: time - 8000, y: 220}
    {x: time - 7000, y: 280}
    {x: time - 6000, y: 320}
    {x: time - 5000, y: 220}
    {x: time - 4000, y: 220}
    {x: time - 3000, y: 220}
    {x: time - 2000, y: 220}
    {x: time - 1000, y: 220}
  ]
  graph = new Graph("Users", "container", 150, data, updateUserCount)
  graph2 = new Graph("Rooms", "container2", 150, data, updateRoomCount)

  graph.draw()
  graph2.draw()
