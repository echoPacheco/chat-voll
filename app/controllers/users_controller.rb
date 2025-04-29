class UsersController < ApplicationController
  before_action :authorize_request

  def index
    users = User.all
    render json: users.as_json(only: [:id, :name, :last_active_at])
  end

  def me
    if current_user
      render json: current_user.as_json(only: [:id, :name, :email])
    else
      render json: { error: 'User not found.' }, status: :unauthorized
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user.as_json(only: [:id, :name])
    else
      render json: { error: 'User not found.' }, status: :not_found
    end
  end
end
