class ArtistsController < ApplicationController
  before_filter :authenticate_user!, :except => ["index", "show"]
  
    def new
      bring_in_models
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
      set_meta_tags :og => {
        :title    => "Fairsplit Music Artist:" + " " + "#{@artist.name}",
        :url      => "http://fairsplitmusic.com/artists/" + "#{@artist.id}",
        :image    => "#{@artist.square_image}"
      }
    end

    def index
      @artists = Artist.all
      set_meta_tags :og => {
        :title    => 'Fairsplit Artists',
        :url      => 'http://fairsplitmusic.com/artists',
        :image    => 'http://ia.media-imdb.com/rock.jpg'
      }
    end
    
    def edit
      bring_in_models
      bring_in_models
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
		  id_url = bitly.shorten("http://www.fairsplitmusic.com/#filter=.artists/" + "artist" + "#" + "#{@artist.id}")
		  uid_url = bitly.shorten("http://www.fairsplitmusic.com/#filter=.artists/" + "artist" + "#" + "#{@artist.uid}")
		  short_id_url = id_url.short_url
		  short_uid_url = uid_url.short_url
      if @artist.short_id_url == '' || @artist.short_id_url.blank?
			  @artist.short_id_url = short_id_url
			end
			if @artist.short_uid_url == '' || @artist.short_uid_url.blank?
			  @artist.short_uid_url = short_uid_url
			end
		  @artist.update_attributes(params[:artist])
			respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end    

end