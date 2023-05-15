class UsersController < ApplicationController
  def index
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager" || curr_usr_role == "Coordinator"
      @users = User.all

      @user_student = User.list_student
      @user_supervisor = User.list_supervisor
      @user_moderator = User.list_moderator

      # # Temporary
      # @users_student = User.where(user_role: "Student")
      # @users_supervisor = User.where(user_role: "Supervisor")
      # @users_moderator = User.where(user_role: "Moderator")

      if params[:search_keyword] && params[:search_keyword] != ""
        # @users = @users.where("user_id like ?", params[:search_by_id])

        # `ilike` is case-insensitive
        @users = @users.where('user_id ilike :search OR user_name ilike :search', search: "%#{params[:search_keyword]}%")
      end

    end
  end

  def show
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager" || curr_usr_role == "Coordinator"
      @user = User.find(params[:user_id])

      if @user.batch_id.nil? || @user.batch_id == "-"
        @batch_name = "-"
        @batch_status = "-"
      else
        @batch_name = Batch.find(@user.batch_id).batch_name
        @batch_status = Batch.find(@user.batch_id).batch_status
      end
    end
  end

  def edit
    @user = User.find(params[:user_id])
  end

  def edit_stud_spec_batch
    @user = User.find(params[:user_id])
  end

  def edit_stud_status
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :email, :user_name, :user_gov_id, :user_gender, :user_role, :user_contact_no, :user_status,
      :student_batch, :student_specialisation, :student_status, :project_progress_id, :batch_id, :user_remarks
    )
  end
end
