class PostsController < ApplicationController
  def index
    @posts = Post.joins(:user).where(user: { id: params[:user_id] })
  end

  def show
    @post = Post.joins(:user).where(user: { id: params[:user_id] }).find(params[:id])
    @comments = @post.comments
  end
end
