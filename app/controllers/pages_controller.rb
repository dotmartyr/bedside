class PagesController < ApplicationController
  before_filter :authenticate_user!

  def show
    @page = Page.find_by_id(params[:id])
  end

  def create

  end

  def update
  end

  def destroy
  end

end