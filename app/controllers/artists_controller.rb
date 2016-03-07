class ArtistsController < ApplicationController
  before_action :authenticate_user!, :except => ["index", "show"]
  
    def new
      bring_in_models
      @artist = Artist.new
    end

    def create
      @artist = Artist.create(artist_params)
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

    def show
      bring_in_models
      @artist = Artist.find_by_slug(params[:id])
      if request.path != artist_path(@artist)
        redirect_to @artist, status: :moved_permanently and return
      end
      set_meta_tags og: {
        url: "#{@currentUrl}",
        image: "#{@artist.facebook_image}",
        title: "#{@artist.name}",
        description: "#{@artist.description}",
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
        :title    => 'Split Music | Artists',
        :image    => "#{@social.artists_image}",
        :description => '21st Century Music Publishing | Unique Music to Picture'
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "Split Music | Artists",
        description: "21st Century Music Publishing | Unique Music to Picture",
        image: "#{@social.artists_image}"
      }
    end
    
    def edit
      bring_in_models
      bring_in_models
      @artist = Artist.find_by_slug(params[:id])
    end

    def update   
      @artist = Artist.find_by_slug(params[:id])
      if @artist.update_attributes(artist_params)
        respond_to do |format|
         format.html { redirect_to cms_path }
        end
      else
        render :action => 'edit'
      end
    end

    def destroy
      @artist = Artist.find_by_slug(params[:id])
      @artist.destroy
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end 
    
    def artist_params
      params.require(:artist).permit(:name, :description, :soundcloud, :image, :square_image, :latest, :large_image, :homepage_title, :vimeo, :uid, 
      :is_artist, :is_work, :is_sound, :is_announcement, :short_id_url, :short_uid_url, :homepage, :facebook_image, :fb_url, :twitter_name)
    end

end