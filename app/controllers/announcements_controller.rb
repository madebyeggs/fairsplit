class AnnouncementsController < ApplicationController
  before_filter :authenticate_user!
  
    def new
      @announcement = Announcement.new
    end

    def create
      @announcement = Announcement.create(params[:announcement])
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
      @announcement = Announcement.all
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

    def edit
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
      @announcement = Artist.find(params[:id])
      bitly = Bitly.new(ENV['BITLY_USER'],ENV['BITLY_PASS'])
		  id_url = bitly.shorten("https://fairsplitmusic.com/#filter=.announcements/" + "announcement" + "#{@announcement.id}")
		  uid_url = bitly.shorten("https://fairsplitmusic.com/#filter=.announcements/" + "announcement" + "#{@announcement.uid}")
		  short_id_url = id_url.short_url
		  short_uid_url = uid_url.short_url
      if @announcement.short_id_url == '' || @announcement.short_id_url.blank?
			  @announcement.short_id_url = short_id_url
			end
			if @announcement.short_uid_url == '' || @announcement.short_uid_url.blank?
			  @announcement.short_uid_url = short_uid_url
			end
		  @announcement.update_attributes(params[:announcement])
			respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

end