class AboutsController < ApplicationController
  before_filter :authenticate_user!, :except => ["index"]
  
    def new
      bring_in_models
      @about = About.new
    end

    def create
      @about = About.create(params[:about])
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

    def show
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

    def index
      @about = About.first
      set_meta_tags :og => {
        :title    => 'About Fairsplit Music',
        :url      => 'http://fairsplitmusic.com/abouts',
        :image    => ''
      }
    end

    def edit
      bring_in_models
      @about = About.find(params[:id])
    end

    def update   
      @about = About.find(params[:id])
      if @about.update_attributes(params[:about])
        respond_to do |format|
         format.html { redirect_to cms_path }
        end
      else
        render :action => 'edit'
      end
    end

    def destroy
      @about = About.find(params[:id])
      @about.destroy
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end
    
    def show
      @about = About.find(params[:id])
    end

end