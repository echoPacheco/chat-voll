class MessagesController < ApplicationController
def index
  if params[:sender_id] && params[:receiver_id]
    messages = Message
      .where(
        "(sender_id = :current_user_id AND receiver_id = :other_user_id) OR
         (sender_id = :other_user_id AND receiver_id = :current_user_id)",
        current_user_id: current_user.id,
        other_user_id: params[:receiver_id]
      )
      .order(created_at: :desc)
      .page(params[:page])
      .per(20)
  else
    messages = Message
      .where('sender_id = ? OR receiver_id = ?', current_user.id, current_user.id)
      .order(created_at: :desc)
      .page(params[:page])
      .per(20)
  end

 render json: {
  messages: messages.as_json(include: [:sender, :receiver], methods: [:file_url]),
  total_count: messages.total_count
}

end


  def create
    message = Message.new(message_params.merge(sender_id: current_user.id))
    if message.save
      message.file.attach(params[:file]) if params[:file]
      message.reload
      ActionCable.server.broadcast "user_#{message.receiver_id}", message.as_json(methods: [:file_url])
      render json: message.as_json(methods: [:file_url]), status: :created
    else
      render json: message.errors, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.permit(:content, :receiver_id, :file)
  end
end
