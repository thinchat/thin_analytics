class UsersController < ApplicationController
  def total
    render json: { count: Analytics.user_count }
  end

  def agents
    render json: { count: Analytics.agent_count }
  end

  def guests
    render json: { count: Analytics.guest_count }
  end

  def history
    render json: {
      history: [
        { x: (Time.now.to_f * 1000).to_i - 10000, y: rand(50) },
        { x: (Time.now.to_f * 1000).to_i - 8000, y: rand(50) },
        { x: (Time.now.to_f * 1000).to_i - 6000, y: rand(50) },
        { x: (Time.now.to_f * 1000).to_i - 4000, y: rand(50) },
        { x: (Time.now.to_f * 1000).to_i - 2000, y: rand(50) },
      ]
    }
  end
end
