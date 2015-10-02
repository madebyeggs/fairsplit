class WorksController < ApplicationController
  before_filter :authenticate_user!, :except => ["index", "show"]
  
    def new
      bring_in_models
      @work = Work.new
    end

    def create
      @work = Work.create(params[:work])
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

    def show
      @work = Work.find(params[:id])
      if request.path != work_path(@work)
        redirect_to @work, status: :moved_permanently
      end
      set_meta_tags :og => {
        :title    => "Fairsplit Music Project:" + " " + "#{@work.client}" + " " + "|" + " " + "#{@work.title}",
        :url      => "http://fairsplitmusic.com/works/" + "#{@work.slug}",
        :image    => "#{@work.image}"
      }
    end

    def index
      @works = Work.all
      set_meta_tags :og => {
        :title    => 'Fairsplit Projects',
        :url      => 'http://fairsplitmusic.com/works',
        :image    => 'http://ia.media-imdb.com/rock.jpg'
      }
    end

    def edit
      bring_in_models
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
		  id_url = bitly.shorten("http://www.fairsplitmusic.com/works/" + "#{@work.slug}")
		  short_id_url = id_url.short_url
      if @work.short_id_url == '' || @work.short_id_url.blank?
			  @work.short_id_url = short_id_url
			end
		  @work.update_attributes(params[:work])
			respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end

end