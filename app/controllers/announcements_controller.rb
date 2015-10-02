class AnnouncementsController < ApplicationController
  before_filter :authenticate_user!, :except => ["index", "show"]
  
    def new
      bring_in_models
      @announcement = Announcement.new
    end

    def create
      @announcement = Announcement.create(params[:announcement])
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

    def show
      @announcement = Announcement.find(params[:id])
      if request.path != announcement_path(@announcement)
        redirect_to @announcement, status: :moved_permanently
      end
      set_meta_tags :og => {
        :title    => "Fairsplit Music Artist:" + " " + "#{@announcement.homepage_title}",
        :url      => "http://fairsplitmusic.com/artists/" + "#{@announcement.slug}",
        :image    => "#{@announcement.square_image}"
      }
    end

    def index
      bring_in_models
    end

    def edit
      bring_in_models
      @announcement = Announcement.find(params[:id])
    end

    def update   
      @announcement = Announcement.find(params[:id])
      if @announcement.update_attributes(params[:announcement])
        respond_to do |format|
         format.html { redirect_to cms_path }
        end
      else
        render :action => 'edit'
      end
    end

    def destroy
      @announcement = Announcement.find(params[:id])
      @announcement.destroy
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end
    
    def create_links
      @announcement = Announcement.find(params[:id])
      bitly = Bitly.new(ENV['BITLY_USER'],ENV['BITLY_PASS'])
		  id_url = bitly.shorten("http://www.fairsplitmusic.com/announcements/" + "#{@announcement.slug}")
		  short_id_url = id_url.short_url
			if @announcement.short_id_url == '' || @announcement.short_id_url.blank?
			  @announcement.short_id_url = short_id_url
			end
		  @announcement.update_attributes(params[:announcement])
			respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

end