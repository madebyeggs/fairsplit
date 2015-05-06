class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def bring_in_models
    @works = Work.order("latest DESC, id DESC")
    @newest = Work.last
    @artists = Artist.order("latest DESC, name ASC")
    @artist = Artist.first
    @announcements = Announcement.order("latest DESC, id DESC")
    time_range = (2.month.ago.beginning_of_month..Time.now)
    @combined_sorted = (Announcement.all + Artist.where(:created_at => time_range) + Work.where(:created_at => time_range) + Sound.where(:created_at => time_range)).sort{|a,b| a.created_at <=> b.created_at }
    @sounds = Sound.order("latest DESC, id DESC")
  end
  
end