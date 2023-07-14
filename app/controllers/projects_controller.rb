class ProjectsController < ApplicationController
  def index
    if user_signed_in?
      curr_usr_role = current_user.user_role    # The role of current user.

      if curr_usr_role == "Manager" || curr_usr_role == "Coordinator"
        if curr_usr_role == "Coordinator"
          @projects = Project.all.order(created_at: :asc)
        else
          @projects = Project.projects_confirmed.order(created_at: :asc)
        end

        @users = User.all

        # IF THE SEARCH BOX CONTAINS KEYWORDS
        if params[:search_keyword] && params[:search_keyword] != ""
          # @users = @users.where("user_id like ?", params[:search_by_id])
          # `ilike` is case-insensitive
          @projects = @projects.where('project_id ilike :search OR project_title ilike :search', search: "%#{params[:search_keyword]}%")

          if params[:pending_projects] && params[:confirmed_projects]
            @projects = @projects.where('project_approval_status=\'Pending\' OR project_approval_status=\'Confirmed\'')
          end
          if params[:confirmed_projects] && params[:pending_projects].nil?
            @projects = @projects.where('project_approval_status=\'Confirmed\'')
          end
          if params[:pending_projects] && params[:confirmed_projects].nil?
            @projects = @projects.where('project_approval_status=\'Pending\'')
          end
        end

        # IF THE SEARCH BOX DOES NOT CONTAIN KEYWORDS
        if params[:search_keyword] == ""
          if params[:pending_projects] && params[:confirmed_projects]
            @projects = @projects.where('project_approval_status=\'Pending\' OR project_approval_status=\'Confirmed\'')
          end
          if params[:confirmed_projects] && params[:pending_projects].nil?
            @projects = @projects.where('project_approval_status=\'Confirmed\'')
          end
          if params[:pending_projects] && params[:confirmed_projects].nil?
            @projects = @projects.where('project_approval_status=\'Pending\'')
          end
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

        # Pass the Project ID for project placement module.
        $project_id_pass = @project.project_id

        @created_at = @project.created_at.strftime('%d/%m/%Y %H:%M')
        if @project.created_at != @project.updated_at
          @last_updated = "(Updated at: " + @project.updated_at.strftime('%d/%m/%Y %H:%M') + ")"
        else
          @last_updated = ""
        end

        # ------ Co-supervisor's Name------
        if @project.co_supervisor_id.nil? || @project.co_supervisor_id == "-"
          @co_supervisor = "-"
        else
          @co_supervisor = User.find(@project.co_supervisor_id).user_name
        end


        # ------ Approval's Name ------
        if @project.reviewed_by.nil?
          @reviewed_by = "-"
        else
          @reviewed_by = User.find(@project.reviewed_by).user_name
        end

        # ------ List out other specialisations ------
        if @project.project_other_specialisations.nil?
          @other_specialisation = "-"
        else
          @other_specialisation = @project.project_other_specialisations
        end


        # ------ Student/Manager Info from `placement_id` ------
        proj_placement = @project.placement_id
        if proj_placement.nil? || proj_placement == "" || proj_placement == "-"
          @student_one_user_name = "-"
          @student_one_subtitle = "-"
          @student_one_work_distribution = "-"
          @student_two_user_name = "-"
          @student_two_subtitle = "-"
          @student_two_work_distribution = "-"
          @moderator = "-"
        else
          placement_stud_raw = User.where(placement_id: proj_placement)
          placement_stud_name = placement_stud_raw.pluck(:user_name)
          placement_stud_uid = placement_stud_raw.pluck(:user_id)

          if placement_stud_raw[0].nil? || placement_stud_raw[0] == "" || placement_stud_raw[0] == "-"
            @student_one_user_name = "-"
          else
            @student_one_user_name = placement_stud_name[0] + " (" + placement_stud_uid[0] + ")"
          end


          if placement_stud_raw[1].nil? || placement_stud_raw[1] == "" || placement_stud_raw[1] == "-"
            @student_two_user_name = "-"
          else
            @student_two_user_name = placement_stud_name[1] + " (" + placement_stud_uid[1] + ")"
          end

          @student_one_subtitle = check_empty_value(@project.student_one_subtitle)
          @student_one_work_distribution = check_empty_value(@project.student_one_work_distribution)
          @student_two_subtitle = check_empty_value(@project.student_two_subtitle)
          @student_two_work_distribution = check_empty_value(@project.student_two_work_distribution)

          moderator_raw = ProjectPlacement.find_by_placement_id(proj_placement).moderator_id
          if moderator_raw.nil? || moderator_raw == "-" || moderator_raw == ""
            @moderator = "-"
          else
            @moderator = User.find_by_user_id(moderator_raw).user_name
          end

          @placement_stat = ProjectPlacement.find_by_placement_id(proj_placement).placement_status
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
        @current_uid = current_user.user_id
        @button_text = "Create"
      end
    end
  end

  def create
    if user_signed_in?
      curr_usr_role = current_user.user_role
      if curr_usr_role == "Manager" || curr_usr_role == "Coordinator"
        @project = Project.new(project_params)

        @passed_project_id = @project.project_id.to_s
        @passed_batch_id = @project.batch_id.to_s
        @project.placement_id = @passed_project_id

        @project_placement = ProjectPlacement.new(
          :placement_id => @passed_project_id, :project_id => @passed_project_id,
          :placement_batch => @passed_batch_id, :placement_status => "Inactive",
          :moderator_id => "-", :presentation_id => "-"
        )

        if @project.save && @project_placement.save
          redirect_to @project
        else
          @project.errors.each {|err| puts err }
          puts "[DEBUG] Error is #{@project.errors.to_s}"
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  def edit
    @project = Project.find(params[:project_id])
  end

  def update
    if user_signed_in?
      curr_usr_role = current_user.user_role
      if curr_usr_role == "Manager" || curr_usr_role == "Coordinator"
        @project = Project.find(params[:project_id])

        if @project.update(project_params)
          redirect_to @project
        else
          render :edit, status: :unprocessable_entity
        end
      end
    end
  end

  def edit_review
    @project = Project.find(params[:project_id])
  end

  def edit_personnel
    @project = Project.find(params[:project_id])
  end

  def edit_details
    @project = Project.find(params[:project_id])
  end

  def edit_industry_collab
    @project = Project.find(params[:project_id])
  end

  # Return dash if column is empty (only applicable for direct data retrieval)
  private
  def check_empty_value(target)
    if target == "" || target.nil? || target == "-"
      "-"
    else
      target
    end
  end

  private
  def project_params
    params.require(:project).permit(
      :project_title, :project_id, :project_title, :project_approval_status, :project_proposal_party,    #5
      :project_type, :project_category, :project_focus, :project_date, :project_other_specialisations,     #5
      :project_description, :project_objective, :project_scope, :project_status, :project_specialisation,     #5
      :project_background, :project_outcomes, :project_doc_id, :supervisor_id, :co_supervisor_id, :moderator_id,    #6
      :reviewed_by, :student_one_user_id, :student_one_subtitle, :student_one_work_distribution, :student_two_user_id,    #5
      :student_two_subtitle, :student_two_work_distribution, :is_industry_collab, :industry_collab_company,    #4
      :batch_id, :remarks_project, :remarks_supervisor, :industry_collab_contact_name, :industry_collab_contact_number,    #5
      :placement_id, :passed_project_id
    )
  end

end
