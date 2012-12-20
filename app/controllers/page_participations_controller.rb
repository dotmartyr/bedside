class PageParticipationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_page
  respond_to :html, :js
  
  def show
    @page_participations = @page.page_participations.find(params[:id])
    respond_with(@page_participations)
  end

  def new
    respond_with(@page_participation = @page.page_participations.new)   
  end 

  def create
    if @user = User.find_by_email(params[:page_participation][:email])
      @page_participation = @page.page_participations.new(:user_id => @user.id, :permission_level => PageParticipation::PermissionLevel::FOLLOWER)
    else
      invitee = User.invite!({:email => params[:page_participation][:email], 
            :name => params[:page_participation][:name]}, current_user) do |u|
        u.skip_invitation = true
      end
      @page_participation = @page.page_participations.new(:user_id => invitee.id, :permission_level => PageParticipation::PermissionLevel::FOLLOWER)
      BedsideMailer.invitation(invitee.id, @page.id).deliver!
    end
    if @page_participation.save
      respond_with(@page_participation = @page.page_participations.new)
    else
      respond_with(@page_participation.errors)
    end
  end

  def update
    @page_participations = @page.page_participations.find(params[:id])
    @page_participation.update_attributes(params[:page_participation])
    
    respond_with(@page)
  end

  def index
    respond_with(@page_participation = @page.page_participations.new)   
  end

  private
    def find_page
      @page = current_user.pages.find(params[:page_id])
    end
end