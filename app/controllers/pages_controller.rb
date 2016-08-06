class PagesController < ApplicationController

  def show
    @page = @site.page
  end

  def new
    @page = @site.build_page
  end

  def create
    @page = @site.build_page( page_params)

    if @page.save
      redirect_to site_page_url(@site)
    else
      render :new
    end
  end

  def edit
    @page = @site.page
  end

  def update
    @page = @site.page

    if @site.page.update( page_params )
      redirect_to site_page_url( @site )
    else
      render :edit
    end
  end

  def destroy
    @page = @site.page
    @page.destroy

    redirect_to site_page_url( @site )
  end

  protected

  def find_site
    @site = Site.find( Paeams[:id] )
  end

  def page_params
    params.require(:page).permit(:title, :body, :slug)
  end

end
