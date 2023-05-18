class PresentationParamsController < ApplicationController
  def index
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager"
      @pres_params = PresentationParam.all.order(param_id: :desc)
    end
  end

  def show
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager"
      @pres_param = PresentationParam.find(params[:param_id])
    end
  end
end
