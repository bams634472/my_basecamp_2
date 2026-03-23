class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action -> { require_project_member!(@project) }, only: [:show]

  def index
    @projects = current_user.projects
  end

  def show
    @attachments = @project.attachments.includes(file_attachment: :blob)
    @project_threads = @project.project_threads.order(created_at: :desc)
    @attachment = Attachment.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.owned_projects.build(project_params)
    if @project.save
      @project.project_memberships.create(user: current_user, admin: true)
      redirect_to @project, notice: "Project created."
    else
      render :new
    end
  end

  def edit
    require_project_admin!(@project)
  end

  def update
    require_project_admin!(@project)
    if @project.update(project_params)
      redirect_to @project, notice: "Project updated."
    else
      render :edit
    end
  end

  def destroy
    require_project_admin!(@project)
    @project.destroy
    redirect_to projects_path, notice: "Project removed."
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end