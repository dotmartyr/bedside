
class CommentsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :js
  

  def create
    
    @page = Page.find(params[:page_id])

    @comment = Comment.build_from(@page, current_user.id, params[:comment][:body])

    @comment.save
  
    respond_with(@comment)
    
  end

end



