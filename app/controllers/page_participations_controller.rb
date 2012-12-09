class PageParticipationsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js
  
  def show
    @page = current_user.pages.find(params[:id])
    @page_participations = @page.page_participations
    respond_with(@page_participations)
  end

  def new
    @page = current_user.pages.find(params[:id])
    respond_with(@page_participation = @page.page_participations.new)   
  end 

  def create
    @page = current_user.pages.find(params[:id])
    @user = User.create(params[:user])
    binding.pry
    # TODO: What do we need to create a user? Just email, but we need to 
    # protect the main app 
    @page_participation = @page.page_participations.new(:user => @user, :permissions => 'admin')
    if @page_participation.save
      respond_with(@page_participation)
    else
      respond_with(@page_participation.errors)
    end
  end

  def update
    @page = current_user.pages.find(params[:id])

    @page.update_attributes(params[:page])
    
    respond_with(@page)
  end

end