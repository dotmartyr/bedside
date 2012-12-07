class PagesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js
  
  def show
    @page = Page.find(params[:id])

    respond_with(@page)
  end

  def new
    respond_with(@page = Page.new)   
  end 

  def create
    @page = Page.new(params[:page])
  
    respond_with(@page)
  end

  def update
    @page = Page.find(params[:id])

    @page.update_attributes(params[:page])
    
    respond_with(@page)
  end

end