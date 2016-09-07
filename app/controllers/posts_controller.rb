class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :approve]
  
  def index
    @posts = current_user.posts.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: 'Your post was created successfully!'
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: 'You post was updated successfully!'
    else
      render :new
    end
  end

  def approve
    authorize @post
    @post.approved!
    redirect_to root_path, notice: 'Post was successfully approved!'
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: 'Your post was destroyed successfully!'
    else
      redirect_to posts_path, notice: 'Your post could not be deleted!'
    end
  end

  private

    def post_params
      params.require(:post).permit(:date, :rationale, :status, :overtime_request)
    end

    def set_post
      @post = Post.find(params[:id])
    end  
end
