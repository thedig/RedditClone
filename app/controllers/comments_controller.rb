class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @comment.link_id = params[:link_id]
    @comment.save
    redirect_to link_url(params[:link_id])
  end


  def destroy

  end

end
