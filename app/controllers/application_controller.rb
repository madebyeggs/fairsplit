class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def bring_in_models
    @works = Work.order("id DESC")
    @newest = Work.last
    @artists = Artist.order("latest DESC, name ASC")
    @artist = Artist.find(1)
    @announcements = Announcement.order("latest DESC, id DESC")
    @sounds = Sound.order("latest DESC")
  end
  
end