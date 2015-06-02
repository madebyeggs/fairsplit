class WorksController < ApplicationController
  before_filter :authenticate_user!
  
    def new
      @work = Work.new
    end

    def create
      @work = Work.create(params[:work])
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
      @work = Work.all
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

    def edit
      @work = Work.find(params[:id])
    end

    def update   
      @work = Work.find(params[:id])
      if @work.update_attributes(params[:work])
        respond_to do |format|
         format.html { redirect_to cms_path }
        end
      else
        render :action => 'edit'
      end
    end

    def destroy
      @work = Work.find(params[:id])
      @work.destroy
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end
    
    def create_links
      @work = Work.find(params[:id])
      bitly = Bitly.new(ENV['BITLY_USER'],ENV['BITLY_PASS'])
		  id_url = bitly.shorten("http://www.fairsplitmusic.com/#filter=.works/" + "work" + "#" + "#{@work.id}")
		  uid_url = bitly.shorten("http://www.fairsplitmusic.com/#filter=.works/" + "work" + "#" + "#{@work.uid}")
		  short_id_url = id_url.short_url
		  short_uid_url = uid_url.short_url
      if @work.short_id_url == '' || @work.short_id_url.blank?
			  @work.short_id_url = short_id_url
			end
			if @work.short_uid_url == '' || @work.short_uid_url.blank?
			  @work.short_uid_url = short_uid_url
			end
		  @work.update_attributes(params[:work])
			respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

end