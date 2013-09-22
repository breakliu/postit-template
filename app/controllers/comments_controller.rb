class CommentsController < ApplicationController
  before_action :check_user_login, only: [:vote]

  def create
    #binding.pry
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(set_comment)
    if @comment.save
      flash[:notice] = "You leave a cool comment!"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def vote
    #binding.pry
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.votes.find_by(user: current_user)
      flash[:alert] = 'A user can vote onlhy once!'
      redirect_to post_path(@post)
    else
      @comment.votes.build(vote: params[:vote], user: current_user)
      if @comment.save
        flash[:notice] = 'You vote!'
        redirect_to post_path(@post)
      else
        flash[:alert] = 'You vote failed!'
        redirect_to post_path(@post)
      end
    end
  end

  private

  def set_comment
    params.require(:comment).permit(:content)
  end
end
