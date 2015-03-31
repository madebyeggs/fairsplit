class HomeController < ApplicationController
  
  def index
    bring_in_models
    bring_in_paginated_announcements
  end
  
end