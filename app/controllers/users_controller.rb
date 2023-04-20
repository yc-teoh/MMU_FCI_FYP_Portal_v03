class UsersController < ApplicationController
  def index
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager" || curr_usr_role == "Coordinator"
      @users = User.all

      if params[:search_by_id] && params[:search_by_id] != ""
        # @users = @users.where("user_id like ?", params[:search_by_id])
        @users = @users.where('user_id like :search OR user_name like :search', search: "%#{params[:search_by_id]}%")
      end

    end
  end
end
