class PagesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js
  
  def show
    @page = current_user.pages.find(params[:id])

    respond_with(@page)
  end

  def new
    respond_with(@page = current_user.pages.new)   
  end 

  def create
    @page = current_user.pages.new(params[:page])
    if @page.save
      current_user.page_participations << PageParticipation.create(page_id: @page.id, permission_level: PageParticipation::PermissionLevel::OWNER)
      current_user.save
      respond_with(@page)
    else
      respond_with(@page.errors)
    end
  end

  def update
    @page = current_user.pages.find(params[:id])

    @page.update_attributes(params[:page])
    
    respond_with(@page)
  end

end