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
    
    def create_links
      @artist = Artist.find(params[:id])
      bitly = Bitly.new(ENV['BITLY_USER'],ENV['BITLY_PASS'])
		  id_url = bitly.shorten("https://fairsplitmusic.com/#filter=.artists/" + "artist" + "#{@artist.id}")
		  uid_url = bitly.shorten("https://fairsplitmusic.com/#filter=.artists/" + "artist" + "#{@artist.uid}")
		  short_id_url = id_url.short_url
		  short_uid_url = uid_url.short_url
      if @artist.short_id_url == '' || @artist.short_id_url.blank?
			  @artist.short_id_url = short_id_url
			end
			if @artist.short_uid_url == '' || @artist.short_uid_url.blank?
			  @artist.short_uid_url = short_uid_url
			end
			respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

end