class PagesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js
  
  def show
    @page = current_user.pages.find(params[:id])
    @schedule = get_schedule

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

  def next_two_weeks
    days = {}
    (0..13).each do |offset|
      d = Time.now + offset.days
      daystring = d.strftime('%Y%m%d')
      days[daystring] = {:date => d, :visits => []}
    end
    days
  end

  def get_schedule
    @visits = @page.visits.where('start_time < ?', Time.now + 13.days)
    days = next_two_weeks
    @visits.each do |v|
      daystring = v.start_time.strftime('%Y%m%d')
      days[daystring][:visits] << v
    end
    days
  end

end