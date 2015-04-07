class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def bring_in_models
    @works = Work.order("id DESC")
    @newest = Work.last
    @artists = Artist.order("latest DESC, name ASC")
    @artist = Artist.find(1)
    @home = Home.first
    @homes = Home.all
    @sounds = Sound.order("latest DESC")
  end
  
  def bring_in_paginated_announcements
    @announcements = Announcement.paginate(:page => params[:page], :per_page => 200).order("created_at DESC")
    respond_to do |format|
      format.html
      format.js
    end
  end
  
end