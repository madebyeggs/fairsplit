class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def bring_in_models
    @works = Work.order("id DESC")
    @artists = Artist.order("id DESC")
    @artist = Artist.find(1)
  end
  
  def bring_in_paginated_announcements
    @announcements = Announcement.paginate(:page => params[:page], :per_page => 200).order("created_at DESC")
    respond_to do |format|
      format.html
      format.js
    end
  end
  
end