class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @new_post = current_user.posts.new(post_params)
    respond_to do |format|
      format.html do
        if @new_post.save
          redirect_to "/users/#{@new_post.author.id}/posts/", notice: 'Post created successfully!'
        else
          render :new, alert: 'Error occured!, post could not be created'
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:Title, :text)
  end
end
