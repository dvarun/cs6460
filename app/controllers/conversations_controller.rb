class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = current_user.mailbox.conversations
  end

  def show
    begin
      @conversation = current_user.mailbox.conversations.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to conversations_path, notice: "No content found"
    end
  end

  def new
    @recipients = User.all - [current_user]
  end

  def create
    recipient = User.find(params[:user_id])
    reciept = current_user.send_message(recipient, params[:body], params[:subject])
    redirect_to conversation_path(reciept.conversation)
  end
end