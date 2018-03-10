class CommentsController < ApplicationController
  before_action :authenticate_user!
 protect_from_forgery
  
  def create
    @comments = Comment.new
    @comments.user_id= params[:comment_user_id]
    @comments.post_id = params[:comment_post_id]
    @comments.content = params[:comment_content]
    @comments.save
   
    redirect_to "/posts/show/#{@comments.post_id}"
    
    
  end
  


  def destroy
    @comments = Comment.find(params[:comment_id])
    @comments.destroy
    redirect_to "/posts/show/#{@comments.post_id}"
  end
end
