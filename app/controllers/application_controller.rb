class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def bring_in_models
    @works = Work.order("id DESC")
    @newest = Work.last
    @artists = Artist.order("latest DESC, name ASC")
    @announcements = Announcement.order("latest DESC, id DESC")
    @sounds = Sound.order("latest DESC")
  end
  
end