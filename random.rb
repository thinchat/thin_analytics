require 'redis'

REDIS = Redis.new(:host => 'localhost', :port => 6379)

while true do
  REDIS.set('agent_count', rand(10))
  REDIS.set('guest_count', rand(10))

  REDIS.set('active_room_count', rand(100))
  REDIS.set('pending_room_count', rand(100))
  sleep 2
end
