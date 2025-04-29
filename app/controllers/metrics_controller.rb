class MetricsController < ApplicationController
  def index
    render json: {
      total_messages: Message.count,
      active_users_last_7_days: User.where('last_active_at > ?', 7.days.ago).count
    }
  end
end
