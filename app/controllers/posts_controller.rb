class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :check_user_login, only: [:vote]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    # binding.pry
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Create Successful!"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def update
    # binding.pry
    if @post.update_attributes(post_params)
      flash[:notice] = "Update Successful!"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def vote
    #binding.pry
    if @post.votes.find_by(user: current_user)
      flash[:alert] = 'A user can vote onlhy once!'
      redirect_to posts_path
    else
      @post.votes.build(vote: params[:vote], user: current_user)
      if @post.save
        flash[:notice] = 'You vote!'
        redirect_to posts_path
      else
        render :index
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])  
  end

  def post_params
    params.require(:post).permit(:url, :title, :description, category_ids: [])
  end
end
