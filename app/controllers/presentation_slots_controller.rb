class PresentationSlotsController < ApplicationController

  # ------ TEMP ------
  # before_action :pres_params_dropdown
  #
  def index
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager" || curr_usr_role == "Coordinator"
      @pres_slots = PresentationSlot.all.order(presentation_id: :desc)
    end
  end

  def show
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager" || curr_usr_role == "Coordinator"
      @pres_slot = PresentationSlot.find(params[:presentation_id])
      # @pres_param_venues = @pres_param.presentation_venue.tr('[]\" ', '').split(/,+/)
      # @pres_param_slots = @pres_param.presentation_time_slots.tr('[]\"', '').split(/,+/)

      @project = Project.find_by_project_id(ProjectPlacement.find_by_placement_id(@pres_slot.placement_id).project_id)
      @project_id = @project.project_id
      @project_title = @project.project_title
      # @project_title = Project.find_by_project_id(@pres_slot.project_id).project_title
      # @stud1_name = User.find_by_user_id(@pres_slot.student_one_id).user_name

      # STUDENT 2 NAME
      # ctrl_std_two = User.find_by_user_id(@pres_slot.student_two_id)
      # if ctrl_std_two == "-" || ctrl_std_two == nil
      #   @stud2_name = "-"
      # else
      #   @stud2_name = ctrl_std_two.user_name
      # end

      placement_stud_raw = User.where(placement_id: @pres_slot.placement_id)
      placement_stud_name = placement_stud_raw.pluck(:user_name)
      placement_stud_uid = placement_stud_raw.pluck(:user_id)
      stud1_name = placement_stud_name[0]
      stud1_id = placement_stud_uid[0]
      @stud1_info = stud1_name + " (" + stud1_id + ")"
      if placement_stud_raw[1].nil? || placement_stud_raw[1] == ""
        @stud2_info = "-"
      else
        stud2_name = placement_stud_name[1]
        stud2_id = placement_stud_uid[1]
        @stud2_info = stud2_name + " (" + stud2_id + ")"
      end

      # # SUPERVISOR NAME
      # ctrl_pres_spvsr = User.find_by_user_id(@pres_slot.supervisor_id)
      ctrl_pres_spvsr = User.find_by_user_id(@project.supervisor_id)
      if ctrl_pres_spvsr == "-" || ctrl_pres_spvsr == nil
        @supervisor_name = "-"
      else
        @supervisor_name = ctrl_pres_spvsr.user_name
      end

      # CO-SUPERVISOR NAME
      ctrl_pres_co_spvsr = User.find_by_user_id(@project.co_supervisor_id)
      if ctrl_pres_co_spvsr == "-" || ctrl_pres_co_spvsr == nil
        @co_supervisor_name = "-"
      else
        @co_supervisor_name = ctrl_pres_co_spvsr.user_name
      end

      # MODERATOR NAME
      ctrl_pres_moderator = User.find_by_user_id(ProjectPlacement.find(@pres_slot.placement_id).moderator_id)
      if ctrl_pres_moderator == "-" || ctrl_pres_moderator == nil
        @moderator_name = "-"
      else
        @moderator_name = ctrl_pres_moderator.user_name
      end

      ctrl_pres_other_attd = @pres_slot.other_attendees
      if ctrl_pres_other_attd == "" || ctrl_pres_other_attd == nil
        @pres_other_attendees = "-"
      else
        @pres_other_attendees = ctrl_pres_other_attd
      end

      ctrl_pres_remarks = @pres_slot.presentation_remarks
      if ctrl_pres_remarks == "" || ctrl_pres_remarks == nil
        @pres_remarks = "-"
      else
        @pres_remarks = ctrl_pres_remarks
      end
    end
  end

  def new
    @pres_slot = PresentationSlot.new

    # ------ TEMP ------
    # @presparams = PresentationParam.all
    # @presparams_timeslots = @presparam&.presentation_time_slots || []
  end

  def create
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager"
      @pres_slot = PresentationSlot.new(pres_slot_params)

      @proj_placement = ProjectPlacement.find_by_placement_id(pres_slot_params[:placement_id])
      @proj_placement.update(:presentation_id => pres_slot_params[:presentation_id])

      if @pres_slot.save
        redirect_to @pres_slot
      else
        @pres_slot.errors.each {|err| puts err }
        puts "[DEBUG] Error is #{@pres_slot.errors.full_messages}"
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    @pres_slot = PresentationSlot.find(params[:presentation_id])
  end

  def update
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager"
      @pres_slot = PresentationSlot.find(params[:presentation_id])

      if @pres_slot.update(pres_slot_params)
        redirect_to @pres_slot
      else
        @pres_slot.errors.each {|err| puts err }
        puts "[DEBUG] Error is #{@pres_slot.errors.full_messages}"
        render :edit, status: :unprocessable_entity
      end
    end
  end

  private
  def pres_slot_params
    params.require(:presentation_slot).permit(
      :presentation_id, :presentation_location, :supervisor_id, :co_supervisor_id, :moderator_id, :project_id, :other_attendees, :presentation_remarks, :presentation_score, :presentation_date, :presentation_time, :student_one_id, :student_two_id, :placement_id
    )
  end

  # ------ TEMP ------
  # private
  # def pres_params_dropdown
  #   @presparam = PresentationParam.find_by(param_id: params[:param_name].presence)
  #   @presparams_timeslots = PresentationParam.find_by(param_id: params[:presentation_time_slots].presence)
  # end
end
