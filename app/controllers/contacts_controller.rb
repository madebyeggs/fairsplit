class ContactsController < ApplicationController
  before_filter :authenticate_user!, :except => ["index"]
  
  def index
    bring_in_models
  end
  
end