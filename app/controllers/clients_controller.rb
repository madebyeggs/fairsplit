class ClientsController < ApplicationController
  before_action :authenticate_user!
  
    def new
      bring_in_models
      @client = Client.new
    end

    def create
      @client = Client.create(client_params)
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end
    
    def edit
      bring_in_models
      @client = Client.find(params[:id])
    end

    def update   
      @client = Client.find(params[:id])
      if @client.update_attributes(client_params)
        respond_to do |format|
         format.html { redirect_to cms_path }
        end
      else
        render :action => 'edit'
      end
    end

    def destroy
      @client = Client.find(params[:id])
      @client.destroy
      respond_to do |format|
        format.html { redirect_to cms_path }
      end
    end  
    
    def client_params
      params.require(:client).permit(:name, :image, :url)
    end

end