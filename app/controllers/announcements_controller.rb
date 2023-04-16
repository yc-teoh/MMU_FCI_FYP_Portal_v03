class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.all
  end

  def show
    @announcement = Announcement.find(params[:announcement_id])
    @user = User.find(@announcement.author_id)
  end
end
