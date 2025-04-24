class ApplicationController < ActionController::API
  before_action :authorize_request

  def encode_token(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end

  def decoded_token
    auth_header = request.headers['Authorization']
    return unless auth_header
    token = auth_header.split(' ').last
    JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
  rescue
    nil
  end

  def current_user
    @current_user ||= User.find_by(id: decoded_token['user_id']) if decoded_token
  end

  def authorize_request
    render json: { error: 'Unauthorized' }, status: :unauthorized unless current_user
  end
end
