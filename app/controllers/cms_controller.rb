class CmsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    bring_in_models
    bring_in_paginated_announcements
  end
  
end