class MessagesController < ApplicationController
  def create
    # Find the chatroom to associate message with, thanks to nested route
    @chatroom = Chatroom.find(params[:chatroom_id])
    # Create instance of message with params
    @message = Message.new(message_params)
    # Associate the chatroom with the message
    @message.chatroom = @chatroom
    # Associate the user with the message
    @message.user = current_user
    if @message.save
      # If message saves, send me back to the chatroom, and also drop me to the latest message on the page so I don't have to scroll
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      # Otherwise, re render the form on the show page
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
