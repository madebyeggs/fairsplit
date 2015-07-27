class SoundsController < ApplicationController
  before_filter :authenticate_user!
  
    def new
      bring_in_models
      @sound = Sound.new
    end

    def create
      @sound = Sound.create(params[:sound])
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
      @sound = Sound.all
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

    def edit
      bring_in_models
      @sound = Sound.find(params[:id])
    end

    def update   
      @sound = Sound.find(params[:id])
      if @sound.update_attributes(params[:sound])
        respond_to do |format|
         format.html { redirect_to cms_path }
        end
      else
        render :action => 'edit'
      end
    end

    def destroy
      @sound = Sound.find(params[:id])
      @sound.destroy
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end
    
    def create_links
      @sound = Sound.find(params[:id])
      bitly = Bitly.new(ENV['BITLY_USER'],ENV['BITLY_PASS'])
		  id_url = bitly.shorten("http://www.fairsplitmusic.com/#filter=.playlists/" + "playlist" + "#" + "#{@sound.id}")
		  uid_url = bitly.shorten("http://www.fairsplitmusic.com/#filter=.playlists/" + "playlist" + "#" + "#{@sound.uid}")
		  short_id_url = id_url.short_url
		  short_uid_url = uid_url.short_url
      if @sound.short_id_url == '' || @sound.short_id_url.blank?
			  @sound.short_id_url = short_id_url
			end
			if @sound.short_uid_url == '' || @sound.short_uid_url.blank?
			  @sound.short_uid_url = short_uid_url
			end
		  @sound.update_attributes(params[:sound])
			respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

end