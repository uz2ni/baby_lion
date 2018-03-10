class PostsController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery with: :null_session
  

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new
    @post.user_id = params[:input_user]
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    redirect_to "/posts/show/#{@post.id}"
  end

  def show
    @post = Post.find params[:id]
    @comments = Comment.all
  end

  def update
    @post = Post.find params[:id]
    @post.user_id = params[:input_user]
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    
    redirect_to "/posts/show/#{@post.id}"
  end
  
  
  def edit
    @post =Post.find params[:id]
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to '/'
  end
  


  
  
  def like_toggle
  like = Like.find_by(user_id: params[:current_user_id], post_id: params[:post_id])
    
  if like.nil?
    Like.create(user_id: params[:current_user_id], post_id: params[:post_id])   
  else
    like.destroy
 
  end
    
  redirect_to :back
  end
  
  
  
  # def like_create
  #   @likes = Like.new
  #   @likes.user_id= params[:comment_user_id]
  #   @likes.post_id = params[:id]
  #   @likes.like = 0
  #   @likes.save
    
  #   redirect_to "/posts/show/#{@likes.post_id}"
    
  # end
  
  
  
  
  
  # def like_up
  
  # end
  
  # def like_dn
  # end
  
  
  
end
