class ArtistsController < ApplicationController
  before_filter :authenticate_user!
  
    def new
      @artist = Artist.new
    end

    def create
      @artist = Artist.create(params[:artist])
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

    def show
      @artist = Artist.find(params[:id])
    end

    def index
      @artist = Artist.all
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end
    
    def edit
      @artist = Artist.find(params[:id])
    end

    def update   
      @artist = Artist.find(params[:id])
      if @artist.update_attributes(params[:artist])
        respond_to do |format|
         format.html { redirect_to cms_path }
        end
      else
        render :action => 'edit'
      end
    end

    def destroy
      @artist = Artist.find(params[:id])
      @artist.destroy
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

end