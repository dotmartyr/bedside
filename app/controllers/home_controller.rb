class HomeController < ApplicationController
  def index
    # If the user doesn't have any pages yet, redirect to the page creation screen
    redirect_to '/pages/new' if current_user && current_user.pages.blank?
    # If the user has pages, redirect to the the most recent
    # TODO: order this properly to ensure it's the most recent
    redirect_to current_user.pages.first if current_user && current_user.pages.exists?
  end
end
