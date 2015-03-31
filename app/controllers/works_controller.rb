class WorksController < ApplicationController
  before_filter :authenticate_user!, except: [:work_show_via_ajax_call]
  
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
    
    def work_show_via_ajax_call
      @work = Work.find(params[:id])
      render :json => @work
    end

end