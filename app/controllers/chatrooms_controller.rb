class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new

    opentok = OpenTok::OpenTok.new(ENV["VONAGE_API_KEY"], ENV["VONAGE_API_SECRET"])
    @token = opentok.generate_token @chatroom.vonage_session_id, { name: current_user.nickname }

  end
end
