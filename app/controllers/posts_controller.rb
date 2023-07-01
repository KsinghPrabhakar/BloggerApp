class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
    def index
      @posts = Post.all.order("created_at DESC") #select all post for render by descending order
      @post = Post.new
    end
  
    def show
      @post = Post.find(params[:id])
      @post.update(views: (@post.views || 0) + 1) # for counting post views 
      @comment = Comment.new
    end
  
    def new
      @post = Post.new
    end
  
    def create
      # Creating post with users.
      @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @post = Post.find(params[:id])
    end
  
    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @post = Post.find(params[:id])
      @post.comments.destroy_all
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end
    
  
    private
  
    def post_params
      params.require(:post).permit(:title, :description, :image)
    end
  end
  