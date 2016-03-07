class SoundsController < ApplicationController
  before_action :authenticate_user!, :except => ["index", "show"]
  
    def new
      bring_in_models
      @sound = Sound.new
    end

    def create
      @sound = Sound.create(sound_params)
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

    def show
      bring_in_models
      @sound = Sound.find_by_slug(params[:id])
      if request.path != release_path(@sound)
        redirect_to @sound, status: :moved_permanently and return
      end
      set_meta_tags og: {
        url: "#{@currentUrl}",
        image: "#{@sound.facebook_image}",
        title: "#{@sound.title}",
        description: "#{@sound.description}",
        type: "music.playlist"
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "#{@sound.title}",
        description: "#{@sound.description}",
        image: "#{@sound.facebook_image}"
      }
      render :show, flush: true
    end

    def index
      bring_in_models
      @sounds = Sound.common_order
      set_meta_tags :og => {
        :url => "#{@currentUrl}",
        :title    => 'Split Music | Listen',
        :image    => "#{@social.playlists_image}",
        :description => '21st Century Music Publishing | Unique Music to Picture'
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@FairsplitMusic",
        title: "Split Music | Listen",
        description: "21st Century Music Publishing | Unique Music to Picture",
        image: "#{@social.playlists_image}"
      }
    end

    def edit
      bring_in_models
      @sound = Sound.find_by_slug(params[:id])
    end

    def update   
      @sound = Sound.find_by_slug(params[:id])
      if @sound.update_attributes(sound_params)
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
    
    def sound_params
      params.require(:sound).permit(:title, :description, :soundcloud, :image, :latest, :homepage_title, :square_image, :vimeo, :uid, 
      :is_artist, :is_work, :is_sound, :is_announcement, :large_image, :short_id_url, :short_uid_url, :homepage, :facebook_image, :grid_square_image)
    end

end