class AttachmentsController < ApplicationController
  before_action :set_project
  before_action -> { require_project_member!(@project) }

  def create
    return redirect_to project_path(@project), alert: "Please choose a file." unless params[:attachment]&.dig(:file)

    @attachment = @project.attachments.build(user: current_user, filename: params[:attachment][:file].original_filename, content_type: params[:attachment][:file].content_type)
    @attachment.file.attach(params[:attachment][:file])

    if @attachment.save
      redirect_to @project, notice: "Attachment uploaded."
    else
      redirect_to @project, alert: @attachment.errors.full_messages.to_sentence
    end
  end

  def destroy
    @attachment = @project.attachments.find(params[:id])
    unless @attachment.user == current_user || current_user.admin_of?(@project)
      return redirect_to @project, alert: "Unauthorized"
    end

    @attachment.file.purge
    @attachment.destroy
    redirect_to @project, notice: "Attachment removed."
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end