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
  hourly_users_graph = new Graph("Users", "hourly_users", 100, data, updateUserCount)
  hourly_rooms_graph = new Graph("Rooms", "hourly_rooms", 100, data, updateRoomCount)
  hourly_response_time_graph = new Graph("Response Time", "hourly_response_time", 100, data, updateRoomCount)

  daily_users_graph = new Graph("Users", "daily_users", 100, data, updateUserCount)
  daily_rooms_graph = new Graph("Rooms", "daily_rooms", 100, data, updateRoomCount)
  daily_response_time_graph = new Graph("Response Time", "daily_response_time", 100, data, updateRoomCount)

  hourly_users_graph.draw()
  hourly_rooms_graph.draw()
  hourly_response_time_graph.draw()

  daily_users_graph.draw()
  daily_rooms_graph.draw()
  daily_response_time_graph.draw()
