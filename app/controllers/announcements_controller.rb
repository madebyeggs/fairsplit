class AnnouncementsController < ApplicationController
  before_action :authenticate_user!, :except => ["index", "show"]
  
    def new
      bring_in_models
      @announcement = Announcement.new
    end

    def create
      @announcement = Announcement.create(announcement_params)
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

    def show
      bring_in_models
      @announcement = Announcement.find_by_slug(params[:id])
      if request.path != news_path(@announcement)
        redirect_to @announcement, status: :moved_permanently and return
      end
      set_meta_tags og: {
        url: "#{@currentUrl}",
        image: "#{@announcement.facebook_image}",
        title: "#{@announcement.homepage_title}",
        description: "#{@announcement.description}",
        type: "article"
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "#{@announcement.homepage_title}",
        description: "#{@announcement.description}",
        image: "#{@announcement.facebook_image}"
      }
    end

    def index
      bring_in_models
      set_meta_tags :og => {
        :url => "#{@currentUrl}",
        :title    => 'Split Music',
        :image    => "#{@social.announcements_image}",
        :description => "21st Century Music Publishing | Unique Music to Picture"
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@FairsplitMusic",
        title: "21st Century Music Publishing | Unique Music to Picture",
        description: "21st Century Music Publishing | Unique Music to Picture",
        image: "#{@social.announcements_image}"
      }
      respond_to do |format|
        format.html
        format.js
      end
    end

    def edit
      bring_in_models
      @announcement = Announcement.find_by_slug(params[:id])
    end

    def update   
      @announcement = Announcement.find_by_slug(params[:id])
      if @announcement.update_attributes(announcement_params)
        respond_to do |format|
         format.html { redirect_to cms_path }
        end
      else
        render :action => 'edit'
      end
    end

    def destroy
      @announcement = Announcement.find_by_slug(params[:id])
      @announcement.destroy
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

    def announcement_params
      params.require(:announcement).permit(:homepage_title, :image, :vimeo, :description, :soundcloud, :large_image, :latest, :square_image, 
      :uid, :is_artist, :is_work, :is_sound, :is_announcement, :short_uid_url, :facebook_image)
    end
end