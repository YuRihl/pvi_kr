class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit index show create update destroy]
  def index
    @posts = Post.page params[:page]

    authorize Post
  end

  def new
    @post = Post.new
    authorize @post
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def create
    @post = Post.new(post_parameters)
    @post.author = current_user

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_parameters)
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy

    redirect_to posts_path
  end


  private
  def post_parameters
    params.require(:post).permit(:title, :text)
  end
  
end
