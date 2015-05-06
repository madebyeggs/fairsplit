class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def bring_in_models
    @works = Work.order("latest DESC, id DESC")
    @newest = Work.last
    @artists = Artist.order("latest DESC, name ASC")
    @artist = Artist.first
    @announcements = Announcement.order("latest DESC, id DESC")
    @combined_sorted = (Announcement.all + Artist.where("latest = ?", true)).sort{|a,b| a.created_at <=> b.created_at }
    @sounds = Sound.order("latest DESC")
  end
  
end