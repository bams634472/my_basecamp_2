class ProjectThreadsController < ApplicationController
  before_action :set_project
  before_action -> { require_project_member!(@project) }
  before_action -> { require_project_admin!(@project) }, except: [:show]
  before_action :set_thread, only: [:show, :edit, :update, :destroy]

  def show
    @messages = @thread.messages.order(created_at: :asc)
    @new_message = @thread.messages.build
  end

  def new
    @thread = @project.project_threads.build
  end

  def create
    @thread = @project.project_threads.build(thread_params.merge(user: current_user))
    if @thread.save
      redirect_to project_project_thread_path(@project, @thread), notice: "Thread created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @thread.update(thread_params)
      redirect_to project_project_thread_path(@project, @thread), notice: "Thread updated."
    else
      render :edit
    end
  end

  def destroy
    @thread.destroy
    redirect_to @project, notice: "Thread deleted."
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_thread
    @thread = @project.project_threads.find(params[:id])
  end

  def thread_params
    params.require(:project_thread).permit(:title, :body)
  end
end