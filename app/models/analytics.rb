require 'redis'

module Analytics
  def self.agent_count
    REDIS.get('agent_count').to_i
  end

  def self.guest_count
    REDIS.get('guest_count').to_i
  end

  def self.user_count
    REDIS.get('user_count').to_i
  end

  def self.room_count
    REDIS.get('room_count').to_i
  end

  def self.active_room_count
    REDIS.get('active_room_count').to_i
  end

  def self.pending_room_count
    REDIS.get('pending_room_count').to_i
  end
end
