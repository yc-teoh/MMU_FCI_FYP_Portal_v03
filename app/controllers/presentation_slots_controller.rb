class PresentationSlotsController < ApplicationController
  def index
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager"
      @pres_slots = PresentationSlot.all.order(presentation_id: :desc)
    end
  end
end
