class ApplicationController < ActionController::Base
  protect_from_forgery
  
  require 'bitly'
  
  def bring_in_models
    @announcements = Announcement.order("id DESC")
    @works = Work.order("latest DESC, created_at DESC")
    @artists = Artist.order("latest DESC, name ASC")
    @sounds = Sound.order("latest DESC, id DESC")
    @abouts = About.all
    @combined_sorted = (Announcement.all + Work.where(:homepage => true) + Artist.where(:homepage => true) + Sound.where(:homepage => true)).sort {|a,b| b.created_at <=> a.created_at}
    @users = User.all
  end
  
end