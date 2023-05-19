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
      @pres_param_venues = @pres_param.presentation_venue.tr('[]\" ', '').split(/,+/)
      @pres_param_slots = @pres_param.presentation_time_slots.tr('[]\"', '').split(/,+/)
    end
  end

  def new
    @pres_param = PresentationParam.new
    @button_text = "Create"
  end

  def create
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager"
      @pres_param = PresentationParam.new(pres_param_params)

      if @pres_param.save
        redirect_to @pres_param
      else
        @pres_param.errors.each {|err| puts err }
        puts "[DEBUG] Error is #{@pres_param.errors.full_messages}"
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    @pres_param = PresentationParam.find(params[:param_id])
  end

  def update
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager"
      @pres_param = PresentationParam.find(params[:param_id])

      if @pres_param.update(pres_param_params)
        redirect_to @pres_param
      else
        @pres_param.errors.each {|err| puts err }
        puts "[DEBUG] Error is #{@pres_param.errors.full_messages}"
        render :new, status: :unprocessable_entity
      end
    end
  end

  private
  def pres_param_params
    params.require(:presentation_param).permit(
      :param_id, :param_name, :param_status, :batch_id, :presentation_type,
      :presentation_date_start, :presentation_date_end,
      presentation_venue: [], presentation_time_slots: []
    )
  end
end
