class ProjectsController < ApplicationController
  def index
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager" || curr_usr_role == "Coordinator"
      @projects = Project.all
      @users = User.all
    end
  end

  def show
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager" || curr_usr_role == "Coordinator"
      @project = Project.find(params[:project_id])
      @supervisor = User.find(@project.supervisor_id)

      if @project.co_supervisor_id.nil?
        @co_supervisor = "-"
      else
        @co_supervisor = User.find(@project.co_supervisor_id)
      end

      if @project.project_other_specialisations.nil?
        @other_specialisation = "-"
      else
        @other_specialisation = @project.project_other_specialisations
      end
    end
  end
end
