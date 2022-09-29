class LikesController < ApplicationController
  def new
    @like = Like.new(post_id: params[:post_id], user_id: current_user.id)
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id] || params[:id])
    like_params = params.require(:like).permit(:post_id)
    @like = Like.new(post_id: like_params[:post_id], user_id: current_user.id)
    respond_to do |format|
      format.html do
        # like.post_id = @post.id
        # like.user_id = @user.id

        if @like.save
          flash[:success] = 'Like saved successfully'
          redirect_to user_post_path(current_user.id, params[:post_id])
        else
          flash[:error] = 'Error: Like could not be saved'
        end
      end
    end
  end
end
