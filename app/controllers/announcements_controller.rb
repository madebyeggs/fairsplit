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
      bring_in_models
      @announcement = Announcement.find(params[:id])
      if request.path != announcement_path(@announcement)
        redirect_to @announcement, status: :moved_permanently
      end
      set_meta_tags og: {
        url: "#{@currentUrl}",
        image: "#{@announcement.facebook_image}",
        title: "#{@announcement.title}",
        description: "#{@announcement.description}",
        type: "article"
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "#{@announcement.title}",
        description: "#{@announcement.description}",
        image: "#{@announcement.facebook_image}"
      }
      render :show, flush: true
    end

    def index
      bring_in_models
      set_meta_tags :og => {
        :url => "#{@currentUrl}",
        :title    => 'Fairsplit Music | Announcements',
        :image    => 'https://s3.amazonaws.com/fairsplit-images/SPLIT_MUSIC_1200_630_all_top_level.jpg'
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "Fairsplit music's latest news",
        description: "The home for all of Fairsplit's latest news",
        image: "https://s3.amazonaws.com/fairsplit-images/SPLIT_MUSIC_1200_630_all_top_level.jpg"
      }
      respond_to do |format|
        format.html
        format.js
      end
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