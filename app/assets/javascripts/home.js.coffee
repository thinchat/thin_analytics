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

  fetchUserCountLongHistory = ->
    history = []
    $.ajax('/analytics/users/longhistory',
      async: false
      dataType: 'json'
      success: (data) ->
        history = data.history
    )
    history

  fetchRoomCountLongHistory = ->
    history = []
    $.ajax('/analytics/users/longhistory',
      async: false
      dataType: 'json'
      success: (data) ->
        history = data.history
    )
    history

  agents_history = fetchUserCountHistory()
  guests_history = fetchUserCountHistory()
  active_history = fetchRoomCountHistory()
  pending_history = fetchRoomCountHistory()

  agents_long_history = fetchUserCountLongHistory()
  guests_long_history = fetchUserCountLongHistory()
  active_long_history = fetchRoomCountLongHistory()
  pending_long_history = fetchRoomCountLongHistory()

  ten_second_users_graph = new Graph("Users by Type (10 seconds)", "users_10_seconds", "guests", "square", "#ff8400", "agents", "diamond", "#5837e6", 100, guests_history, agents_history, updateAgentCount, updateGuestCount)
  ten_second_rooms_graph = new Graph("Rooms by Status (10 seconds)", "rooms_10_seconds", "active", "square", "#309e00", "pending", "diamond", "#f7e800", 100, active_history, pending_history, updateActiveCount, updatePendingCount)
  sixty_second_users_graph = new Graph("Users by Type (1 minute)", "users_1_minute", "guests", "square", "#ff8400", "agents", "diamond", "#5837e6", 100, guests_long_history, agents_long_history, updateAgentCount, updateGuestCount)
  sixty_second_rooms_graph = new Graph("Rooms by Status (1 minute)", "rooms_1_minute", "active", "square", "#309e00", "pending", "diamond", "#f7e800", 100, active_long_history, pending_long_history, updateActiveCount, updatePendingCount)

  ten_second_users_graph.draw()
  ten_second_rooms_graph.draw()
  sixty_second_users_graph.draw()
  sixty_second_rooms_graph.draw()
