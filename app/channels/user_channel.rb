class UserChannel < ApplicationCable::Channel
  def subscribed
    user = User.find(params[:user_id])
    stream_from "user_#{user.id}"   
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
