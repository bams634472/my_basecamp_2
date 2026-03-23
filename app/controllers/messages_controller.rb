class MessagesController < ApplicationController
  before_action :set_project_thread
  before_action -> { require_project_member!(@project_thread.project) }
  before_action :set_message, only: [:edit, :update, :destroy]

  def create
    @message = @project_thread.messages.build(message_params.merge(user: current_user))
    if @message.save
      redirect_to project_project_thread_path(@project_thread.project, @project_thread), notice: "Message posted."
    else
      redirect_to project_project_thread_path(@project_thread.project, @project_thread), alert: "Message cannot be blank."
    end
  end

  def edit
    authorize_user!
  end

  def update
    authorize_user!
    if @message.update(message_params)
      redirect_to project_project_thread_path(@project_thread.project, @project_thread), notice: "Message updated."
    else
      render :edit
    end
  end

  def destroy
    authorize_user!
    @message.destroy
    redirect_to project_project_thread_path(@project_thread.project, @project_thread), notice: "Message removed."
  end

  private

  def set_project_thread
    @project_thread = ProjectThread.find(params[:project_thread_id])
  end

  def set_message
    @message = @project_thread.messages.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body)
  end

  def authorize_user!
    unless @message.user == current_user || current_user.admin_of?(@project_thread.project)
      redirect_to project_project_thread_path(@project_thread.project, @project_thread), alert: "Unauthorized"
    end
  end
end