class AnnouncementsController < ApplicationController

  def index
    @announcements = Announcement.all
  end

  def show
    @announcement = Announcement.find(params[:announcement_id])
    @user = User.find(@announcement.author_id)
  end

  def new
    @announcement = Announcement.new
    @current_user_id = current_user.user_id
    @button_text = "Create"

    # Generate new `announcement_id` for each new post (1/3).
    current_date = Date.today.to_s.gsub('-','')
    latest_anc_id = Announcement.last.announcement_id
    latest_anc_id_date = latest_anc_id[0, 8]
    latest_anc_id_serial = latest_anc_id[8, 12]

    if Announcement.any?
      # If the Announcement table contains at least one (1) announcement.
      if current_date == latest_anc_id_date
        latest_serial_int = latest_anc_id_serial.to_i
        if latest_serial_int > 0
          # There exists at least one (1) announcement on the same day.
          # Increment the serial number to generate new ID.
          latest_serial_int = latest_serial_int + 1
          @new_announcement_id = current_date + latest_serial_int.to_s.rjust(4, '0')
        else
          # There is zero (0) announcement on the same day.
          @new_announcement_id = current_date + "0001"
        end
      else
        # If the `current_date` doesn't match the latest entry in table.
        # Which means there's zero (0) entries of announcements with the same date.
        @new_announcement_id = current_date + "0001"
      end
    else
      # If the Announcement table is empty.
      @new_announcement_id = current_date + "0001"
    end
  end

  def create
    curr_usr_role = current_user.user_role    # The role of current user.

    if curr_usr_role == "Manager" || curr_usr_role == "Coordinator"
      @announcement = Announcement.new(announcement_params)

      if @announcement.save
        redirect_to @announcement
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    @announcement = Announcement.find(params[:announcement_id])

    @new_announcement_id = @announcement.announcement_id
    @current_user_id = @announcement.author_id
    @button_text = "Edit"
  end

  def update
    @announcement = Announcement.find(params[:announcement_id])

    if @announcement.update(announcement_params)
      redirect_to @announcement
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def announcement_params
      params.require(:announcement)
            .permit(:announcement_id, :announcement_title, :announcement_body, :announcement_status, :author_id)
    end
end
