class Api::V1::MessageController < Api::V1::ApplicationController

  def index
  end

  def create
    @message = Message.new(message: params[:message], user: @user)
    @message.sequential_id = @user.messages.length
    @message.matching_id = @user.matching.id
    @message.save!
    # @user.matched_user.push_notify(@message.message)
  end
end
