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
        { x: (Time.now.to_f * 1000).to_i - 10000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 8000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 6000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 4000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 2000, y: 0 },
      ]
    }
  end

  def long_history
    render json: {
      history: [
        { x: (Time.now.to_f * 1000).to_i - 60000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 58000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 56000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 54000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 52000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 50000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 48000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 46000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 44000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 42000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 40000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 38000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 36000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 34000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 32000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 30000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 28000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 26000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 24000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 22000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 20000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 18000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 16000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 14000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 12000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 10000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 8000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 6000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 4000, y: 0 },
        { x: (Time.now.to_f * 1000).to_i - 2000, y: 0 }
      ]
    }
  end
end
