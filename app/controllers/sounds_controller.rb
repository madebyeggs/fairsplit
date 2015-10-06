class SoundsController < ApplicationController
  before_filter :authenticate_user!, :except => ["index", "show"]
  
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
      @sound = Sound.find(params[:id])
      if request.path != sound_path(@sound)
        redirect_to @sound, status: :moved_permanently
      end
      set_meta_tags :og => {
        :title    => "Fairsplit Music Playlist:" + " " + "#{@sound.title}",
        :url      => "http://fairsplitmusic.com/artists/" + "#{@sound.slug}",
        :image    => ""
      }
    end

    def index
      @sounds = Sound.common_order
      set_meta_tags :og => {
        :title    => 'Fairsplit Playlists',
        :url      => 'http://fairsplitmusic.com/sounds',
        :image    => ''
      }
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
		  short_id_url = id_url.short_url
      if @sound.short_id_url == '' || @sound.short_id_url.blank?
			  @sound.short_id_url = short_id_url
			end
		  @sound.update_attributes(params[:sound])
			respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

end