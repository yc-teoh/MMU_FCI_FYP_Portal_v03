class HomeController < ApplicationController
  def index
    # Not showing the announcements with status of "INACT".
    @announcement_guests = Announcement.announcement_guests.order(announcement_id: :desc).first(3)

    render
  end
end