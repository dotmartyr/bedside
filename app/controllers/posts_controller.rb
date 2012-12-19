class PostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_page
  respond_to :html, :js
  
  def show
    @post = @page.posts.find(params[:id])
    respond_with(@post)
  end

  def edit
    @post = @page.posts.find(params[:id])
    respond_with(@post)
  end

  def new
    respond_with(@post = @page.posts.new)   
  end 

  def create
    @post = @page.posts.new(params[:post])
    if @post.save
      Resque.enqueue(UpdateEmailEnqueer, @post.id)
      respond_with(@post)
    else
      respond_with(@post.errors)
    end
  end

  def update
    @post = @page.posts.find(params[:id])
    @post.update_attributes(params[:post])
    
    respond_with([@page,@post])
  end

  private
    def find_page
      @page = current_user.pages.find(params[:page_id])
    end

end