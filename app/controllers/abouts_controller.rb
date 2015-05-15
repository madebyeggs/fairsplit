class AboutsController < ApplicationController
  before_filter :authenticate_user!
  
    def new
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
      @about = About.all
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

    def edit
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

end