class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def bring_in_models
    @works = Work.order("id DESC")
    @announcements = Announcement.order("id DESC")
    @artists = Artist.order("id DESC")
    @artist = Artist.find(1)
  end
  
end