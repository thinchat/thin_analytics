class RoomsController < ApplicationController
  def index
    render json: { count: Analytics.current_room_count }
  end
end
