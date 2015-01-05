class ArtistsController < ApplicationController
  before_filter :authenticate_user!, except: [:artist_show_via_ajax_call]
  
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
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

    def index
      @artist = Artist.all
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end
    
    def artist_show_via_ajax_call
      @artist = Artist.find(params[:id])
      render :json => @artist
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