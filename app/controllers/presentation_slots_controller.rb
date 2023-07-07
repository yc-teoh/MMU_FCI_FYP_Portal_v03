class PresentationSlotsController < ApplicationController
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

      @project_title = Project.find_by_project_id(@pres_slot.project_id).project_title
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
      @stud1_name = placement_stud_name[0]
      if placement_stud_raw[1].nil? || placement_stud_raw[1] == ""
        @stud2_name = "-"
      else
        @stud2_name = placement_stud_name[1]
      end

      # SUPERVISOR NAME
      # ctrl_pres_spvsr = User.find_by_user_id(@pres_slot.supervisor_id)
      ctrl_pres_spvsr = User.find_by_user_id(Project.find(@pres_slot.project_id).supervisor_id)
      if ctrl_pres_spvsr == "-" || ctrl_pres_spvsr == nil
        @supervisor_name = "-"
      else
        @supervisor_name = ctrl_pres_spvsr.user_name
      end

      # CO-SUPERVISOR NAME
      ctrl_pres_co_spvsr = User.find_by_user_id(Project.find(@pres_slot.project_id).co_supervisor_id)
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
  end

  def create
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager"
      @pres_slot = PresentationSlot.new(pres_slot_params)

      if @pres_slot.save
        redirect_to @pres_slot
      else
        @pres_slot.errors.each {|err| puts err }
        puts "[DEBUG] Error is #{@pres_slot.errors.full_messages}"
        render :new, status: :unprocessable_entity
      end
    end
  end

  def pres_slot_params
    params.require(:presentation_slot).permit(
      :presentation_id, :user_id, :presentation_location, :supervisor_id, :co_supervisor_id, :moderator_id, :project_id, :other_attendees, :presentation_remarks, :presentation_score, :presentation_time
    )
  end
end
