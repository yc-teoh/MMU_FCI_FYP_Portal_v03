class ProjectsController < ApplicationController
  def index
    if user_signed_in?
      curr_usr_role = current_user.user_role    # The role of current user.

      if curr_usr_role == "Manager" || curr_usr_role == "Coordinator"
        @projects = Project.all
        @users = User.all

        if params[:search_keyword] && params[:search_keyword] != ""
          # @users = @users.where("user_id like ?", params[:search_by_id])

          # `ilike` is case-insensitive
          @projects = @projects.where('project_id ilike :search OR project_title ilike :search', search: "%#{params[:search_keyword]}%")
        end
      end
    end
  end

  def show
    if user_signed_in?
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

        if @project.student_one_user_id.nil?
          @student_one_user_name = "-"
          @student_one_user_id = "-"
          @student_one_subtitle = "-"
          @student_one_work_distribution = "-"
        else
          @student_one_user_name = User.find(@project.student_one_user_id).user_name
          @student_one_user_id = @project.student_one_user_id
          @student_one_subtitle = @project.student_one_subtitle
          @student_one_work_distribution = @project.student_one_work_distribution
        end

        if @project.student_two_user_id.nil?
          @student_two_user_name = "-"
          @student_two_user_id = "-"
          @student_two_subtitle = "-"
          @student_two_work_distribution = "-"
        else
          @student_two_user_name = User.find(@project.student_two_user_id).user_name
          @student_two_user_id = @project.student_two_user_id
          @student_two_subtitle = @project.student_two_subtitle
          @student_two_work_distribution = @project.student_two_work_distribution
        end

        if @project.is_industry_collab == "Y"
          @industry_collab_company = @project.industry_collab_company
          @industry_collab_contact_name = @project.industry_collab_contact_name
          @industry_collab_contact_number = @project.industry_collab_contact_number
        else
          @industry_collab_company = "-"
          @industry_collab_contact_name = "-"
          @industry_collab_contact_number = "-"
        end
      end
    end
  end

  def new
    if user_signed_in?
      curr_usr_role = current_user.user_role
      if curr_usr_role == "Manager" || curr_usr_role == "Coordinator"
        @project = Project.new
        @batches = Batch.pluck(:batch_name, :batch_id)
        @supervisors = User.where(:user_role =>  "Coordinator").pluck(:user_name, :user_id)
      end
    end
  end

  def create
    if user_signed_in?
      curr_usr_role = current_user.user_role
      if curr_usr_role == "Manager" || curr_usr_role == "Coordinator"
        @project = Project.new(project_params)

        if @project.save
          redirect_to @project
        else
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  private
  def project_params
    params.require(:project).permit(:project_title, :project_id, :project_type, :supervisor_id, :co_supervisor_id)
  end
end
