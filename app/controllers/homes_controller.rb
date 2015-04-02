class HomesController < ApplicationController
  before_filter :authenticate_user!
  
    def new
      @home = Home.new
    end

    def create
      @home = Home.create(params[:home])
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
      @home = Home.all
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

    def edit
      @home = Home.find(params[:id])
    end

    def update   
      @home = Home.find(params[:id])
      if @home.update_attributes(params[:home])
        respond_to do |format|
         format.html { redirect_to cms_path }
        end
      else
        render :action => 'edit'
      end
    end

    def destroy
      @home = Home.find(params[:id])
      @home.destroy
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

end