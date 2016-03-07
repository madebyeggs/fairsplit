class CmsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    bring_in_models
  end
  
end