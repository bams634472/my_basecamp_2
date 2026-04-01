class ApplicationController < ActionController::Base
  before_action :require_login

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    redirect_to login_path, alert: "Please log in" unless logged_in?
  end

  def require_project_member!(project)
    return if current_user && current_user.member_of?(project)

    redirect_to projects_path, alert: "Unauthorized"
  end

  def require_project_admin!(project)
    return if current_user && current_user.admin_of?(project)

    redirect_to project_path(project), alert: "Admin access required"
  end
end
