class UsersController < ApplicationController
  def index
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager" || curr_usr_role == "Coordinator"
      @users = User.all

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
end
