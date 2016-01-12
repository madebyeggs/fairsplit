class SocialscontsController < ApplicationController
  before_filter :authenticate_user!

  def new
    bring_in_models
    @socialcont = Socialcont.new
  end

  def create
    @socialcont = Socialcont.create(params[:socialcont])
    respond_to do |format|
      format.html { redirect_to cms_path }
    end
  end

  def edit
    bring_in_models
    @socialcont = Sociacontl.find(params[:id])
  end

  def update   
    @socialcont = Socialcont.find(params[:id])
    if @socialcont.update_attributes(params[:socialcont])
      respond_to do |format|
       format.html { redirect_to cms_path }
      end
    else
      render :action => 'edit'
    end
  end

  def destroy
    @socialcont = Socialcont.find(params[:id])
    @socialcont.destroy
    respond_to do |format|
      format.html { redirect_to cms_path }
    end
  end
end
