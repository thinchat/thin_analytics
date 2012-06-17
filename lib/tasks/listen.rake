require 'heartbeat.rb'

def update_guest_count!
  guests = ThinHeartbeat::Status.new('localhost').get_guests.uniq_by { |guest| guest.user_id }
  guest_count = ThinHeartbeat::Status.new('localhost').get_guests.uniq_by { |guest| guest.user_id }.length
  REDIS.set('guest_count', guest_count)
  puts "Set guest_count to #{guest_count}"
end

def update_agent_count!
  agent_count = ThinHeartbeat::Status.new('localhost').get_agents.uniq_by { |agent| agent.user_id }.length
  REDIS.set('agent_count', agent_count)
  puts "Set agent_count to #{agent_count}"
end

def update_active_room_count!
  active_room_count = ThinHeartbeat::Status.new('localhost').get_agents.map {|agent| agent.location unless invalid_location?(agent.location)}.compact.uniq.length
  REDIS.set('active_room_count', active_room_count)
  puts "Set active_room_count to #{active_room_count}"
end

def update_pending_room_count!
  rooms_with_guests = ThinHeartbeat::Status.new('localhost').get_guests.map {|guest| guest.location unless invalid_location?(guest.location)}.compact.uniq
  rooms_with_agents = ThinHeartbeat::Status.new('localhost').get_agents.map {|agent| agent.location unless invalid_location?(agent.location)}.compact.uniq
  pending_room_count = (rooms_with_guests - rooms_with_agents).length
  REDIS.set('pending_room_count', pending_room_count)
  puts "Set pending_room_count to #{pending_room_count}"
end

def invalid_location?(location)
  %w[NOLOCSET Lobby AgentList Legal Home Search].include? location
end

desc "Start the bean counter"
task :bean => :environment do
  while true
    update_guest_count!
    update_agent_count!
    update_active_room_count!
    update_pending_room_count!
    sleep 2
  end
end
