require 'eventmachine'

desc "Start the Redis listener"
task :listen => :environment do
  room = 'thinchat'

  puts "Listener online, subscribed to '#{room}'"
  EM.run do
    REDIS.subscribe(room) do |on|
      on.message do |channel, msg|
        Resque.enqueue(Counter, msg)
      end
    end
  end
end 
