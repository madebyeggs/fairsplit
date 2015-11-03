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
      bring_in_models
      @work = Work.find(params[:id])
      if request.path != work_path(@work)
        redirect_to @work, status: :moved_permanently
      end
      set_meta_tags og: {
        image: "#{@work.facebook_image}",
        url: "https://player.vimeo.com/video/#{@work.vimeo}",
        title: "#{@work.client}" + " " + "#{@work.client}",
        description: "Split Music | NEW WORK: #{@work.title}" + " " + "for" + " " + "#{@work.client}" + " " + "featuring" + " " + "#{@work.track_name}" + " " + "by" + " " + "#{@work.artist_name}",
        type: "video.other"
      }
      set_meta_tags twitter: {
        card: "player",
        site: "@fairsplitmusic",
        title: "#{@work.client}" + " " + "#{@work.client}",
        description: "Split Music | NEW WORK: #{@work.title}" + " " + "for" + " " + "#{@work.client}" + " " + "featuring" + " " + "#{@work.track_name}" + " " + "by" + " " + "#{@work.artist_name}",
        player: {
          _:      "https://player.vimeo.com/video/#{@work.vimeo}",
          stream: "https://player.vimeo.com/video/#{@work.vimeo}"
        }
      }
      render :show, flush: true
    end

    def index
      bring_in_models
      @works = Work.common_order
      set_meta_tags :og => {
        :url => "#{@currentUrl}",
        :title    => 'Split Music | Work',
        :image    => 'https://s3.amazonaws.com/fairsplit-images/SPLIT_MUSIC_1200_630_all_top_level.jpg',
        :description => "21st Century Music Publishing | Unique Music to Picture"
      }
      set_meta_tags twitter: {
        card: "summary_large_image",
        site: "@fairsplitmusic",
        title: "Split Music | Work",
        description: "21st Century Music Publishing | Unique Music to Picture",
        image: "https://s3.amazonaws.com/fairsplit-images/SPLIT_MUSIC_1200_630_all_top_level.jpg"
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
		  id_url = bitly.shorten("http://www.splitmusic.co.uk/works/" + "#{@work.slug}")
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