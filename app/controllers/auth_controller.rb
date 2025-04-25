class AuthController < ApplicationController
skip_before_action :authorize_request, only: [:login]

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      access_token = encode_token({ user_id: user.id })
      user.update(last_active_at: Time.current)
      render json: { access_token:, user_id: user.id }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
