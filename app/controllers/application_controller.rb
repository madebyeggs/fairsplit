class ApplicationController < ActionController::Base
  protect_from_forgery
  
  require 'bitly'
  
  def bring_in_models
    @works = Work.order("latest DESC, created_at DESC")
    @artists = Artist.order("latest DESC, name ASC")
    @sounds = Sound.order("latest DESC, id DESC")
    @abouts = About.all
    @combined_sorted = (Announcement.all + Work.where(:homepage => 1) + Artist.where(:homepage => 1) + Sound.where(:homepage => 1)).sort {|a,b| b.created_at <=> a.created_at}
  end
  
end