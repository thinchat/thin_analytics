class UsersController < ApplicationController
  def index
    render json: {count: Analytics.current_user_count }
  end
end
