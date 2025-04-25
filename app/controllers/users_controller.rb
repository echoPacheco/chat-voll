class UsersController < ApplicationController
  before_action :authorize_request

  def index
    users = User.all
    render json: users.as_json(only: [:id, :name, :last_active_at])
  end
end
