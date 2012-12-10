class VisitsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_page
  respond_to :html, :js
  
  def show
    @visit = @page.visits.find(params[:id])
    respond_with(@visit)
  end

  def edit
    @visit = @page.visits.find(params[:id])
    respond_with(@visit)
  end

  def new
    respond_with(@visit = @page.visits.new)   
  end 

  def create
    @visit = @page.visits.new(params[:visit])
    @visit.user_id = current_user.id
    if @visit.save
      @schedule = @page.get_schedule
      respond_with([@page,@visit])
    else
      respond_with(@visit.errors)
    end
  end

  def update
    @visit = @page.visits.find(params[:id])
    @visit.update_attributes(params[:visit])
    
    respond_with([@page,@visit])
  end


  private
    def find_page
      @page = current_user.pages.find(params[:page_id])
    end

end
