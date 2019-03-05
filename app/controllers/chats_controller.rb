class ChatsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_project_and_owner

  def index
    @chats = policy_scope(Chat).where(project: @project)
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.project = @project
    @chat.user = current_user
    authorize @chat
    respond_to do |format|
      if @chat.save
        # format.html { redirect_to @chat, notice: 'Message was successfully posted.' }
        format.json { render :show, status: :created }
      else
        # format.html { render :new }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:identifier, :message)
  end

  def set_project_and_owner
    @project = Project.find(params[:project_id])
    @user = User.find(params[:user_id])
  end
end
