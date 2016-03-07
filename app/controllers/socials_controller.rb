class SocialsController < ApplicationController
  before_action :authenticate_user!
  
    def new
      bring_in_models
      @social = Social.new
    end

    def create
      @social = Social.create(social_params)
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end
    
    def edit
      bring_in_models
      @social = Social.find(params[:id])
    end

    def update   
      @social = Social.find(params[:id])
      if @social.update_attributes(social_params)
        respond_to do |format|
         format.html { redirect_to cms_path }
        end
      else
        render :action => 'edit'
      end
    end

    def destroy
      @social = Social.find(params[:id])
      @social.destroy
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end
    
    def social_params
      params.require(:social).permit(:announcements_image, :works_image, :artists_image, :playlists_image, :abouts_image, :contacts_image)
    end
    
end
