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
      bring_in_models
      @artist = Artist.find(params[:id])
      if request.path != artist_path(@artist)
        redirect_to @artist, status: :moved_permanently
      end
      set_meta_tags og: {
        url: "#{@currentUrl}",
        image: "#{@artist.facebook_image}",
        title: "#{@artist.name}",
        description: "#{truncate(@artist.description, :length => 50)}",
        type: "musician"
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "#{@artist.name}",
        description: "#{@artist.description}",
        image: "#{@artist.facebook_image}"
      }
      render :show, flush: true
    end

    def index
      bring_in_models
      @artists = Artist.common_order
      set_meta_tags :og => {
        :url => "#{@currentUrl}",
        :title    => 'Fairsplit Music | Artists',
        :image    => 'https://s3.amazonaws.com/fairsplit-images/SPLIT_MUSIC_1200_630_all_top_level.jpg'
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "Fairsplit music's Artists",
        description: "The home for all of Fairsplit's artists",
        image: "https://s3.amazonaws.com/fairsplit-images/SPLIT_MUSIC_1200_630_all_top_level.jpg"
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
		  id_url = bitly.shorten("http://www.fairsplitmusic.com/artists/" + "#{@artist.slug}")
		  short_id_url = id_url.short_url
      if @artist.short_id_url == '' || @artist.short_id_url.blank?
			  @artist.short_id_url = short_id_url
			end
		  @artist.update_attributes(params[:artist])
			respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end    

end