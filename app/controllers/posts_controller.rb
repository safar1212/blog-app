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
    @user = current_user
    post = Post.new(params.require(:post).permit(:Text, :Title))
    post.user_id = @user.id
    respond_to do |format|
      format.html do
        if post.save
          flash[:success] = 'Post saved successfully'
          redirect_to user_posts_path(@user)
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { post: }
        end
      end
    end
  end

  def destroy
    Post.destroy(params[:id])
    current_user.PostsCounter -= 1
    current_user.save
    redirect_to user_path(current_user.id)
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
