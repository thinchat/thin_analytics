//= require highcharts
//= require highcharts/themes/grid

$(document).ready ->
  updateAgentCount = ->
    count = 0
    $.ajax('/analytics/users/agents',
      async: false
      dataType: 'json'
      success: (data) ->
        count = data.count
    )
    count

  updateGuestCount = ->
    count = 0
    $.ajax('/analytics/users/guests',
      async: false
      dataType: 'json'
      success: (data) ->
        count = data.count
    )
    count

  updateActiveCount = ->
    count = 0
    $.ajax('/analytics/rooms/active',
      async: false
      dataType: 'json'
      success: (data) ->
        count = data.count
    )
    count

  updatePendingCount = ->
    count = 0
    $.ajax('/analytics/rooms/pending',
      async: false
      dataType: 'json'
      success: (data) ->
        count = data.count
    )
    count

  updateRoomCount = ->
    count = 0
    $.ajax('/analytics/rooms/total',
      async: false
      dataType: 'json'
      success: (data) ->
        count = data.count
    )
    count

  fetchUserCountHistory = ->
    history = []
    $.ajax('/analytics/users/history',
      async: false
      dataType: 'json'
      success: (data) ->
        history = data.history
    )
    history

  fetchRoomCountHistory = ->
    history = []
    $.ajax('/analytics/users/history',
      async: false
      dataType: 'json'
      success: (data) ->
        history = data.history
    )
    history

  time = new Date().getTime()
  agents = fetchUserCountHistory()
  guests = fetchUserCountHistory()
  active = fetchRoomCountHistory()
  pending = fetchRoomCountHistory()

  hourly_users_graph = new Graph("Users", "hourly_users", "guests", "square", "#ff8400", "agents", "diamond", "#5837e6", 100, guests, agents, updateAgentCount, updateGuestCount)
  hourly_rooms_graph = new Graph("Rooms", "hourly_rooms", "active", "square", "#309e00", "pending", "diamond", "#f7e800", 100, active, pending, updateActiveCount, updatePendingCount)
  # hourly_response_time_graph = new Graph("Response Time", "hourly_response_time", 100, users, agents, updateRoomCount)

  # daily_users_graph = new Graph("Users", "daily_users", 100, users, agents, updateUserCount)
  # daily_rooms_graph = new Graph("Rooms", "daily_rooms", 100, users, agents, updateRoomCount)
  # daily_response_time_graph = new Graph("Response Time", "daily_response_time", 100, users, agents, updateRoomCount)

  hourly_users_graph.draw()
  hourly_rooms_graph.draw()
  # hourly_response_time_graph.draw()

  # daily_users_graph.draw()
  # daily_rooms_graph.draw()
  # daily_response_time_graph.draw()
