module Api
  class SitesController < ::Api::BaseController

    def index
      @sites = Site.all
    end

    def create
      @site = Site.new( site_params )

      if @site.save
        render :json => { :message => "Successfully created" }
      else
        render :json => { :message => "Failed created" }, :status => 400
      end
    end

    def update
      @site = Site.find( params[:id] )
      if @site.update( site_params)
        render :json => { :message => "Successfully updated" }
      else
        render :json => { :message => "Failed updated"}, :status => 400
      end
    end

    def destroy
      @site = Site.find( params[:id] )
      if @site.destroy
        render :json => { :message => "Successfully deleted" }
      else
        render :json => { :message => "Failed deleted" }
      end
    end

    def site_params
      params.require(:site).permit(:name, :host, :subdomain, :data)
    end
  end
end
