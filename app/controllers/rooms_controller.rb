class RoomsController < ApplicationController
  def total
    render json: { count: Analytics.room_count }
  end

  def active
    render json: { count: Analytics.active_room_count }
  end

  def pending
    render json: { count: Analytics.pending_room_count }
  end

  def history
    render json: {
      history: [
        { x: (Time.now.to_f * 1000).to_i - 10000, y: rand(50) },
        { x: (Time.now.to_f * 1000).to_i - 8000, y: rand(50) },
        { x: (Time.now.to_f * 1000).to_i - 6000, y: rand(50) },
        { x: (Time.now.to_f * 1000).to_i - 4000, y: rand(50) },
        { x: (Time.now.to_f * 1000).to_i - 2000, y: rand(50) }
      ]
    }
  end
end
