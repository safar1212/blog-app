# class LikesController < ApplicationController
#   def create
#     @post = Post.find(params[:PostId])

#     like = current_user.likes.new(
#       user_id: current_user.id,
#       PostId: @post.id
#     )

#     if like.save
#       redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", notice: 'Success liked the post!'
#     else
#       redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", alert: 'Error occured, could not liked the post!'
#     end
#   end
# end

class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id] || params[:id])
    like = Like.new
    like.post_id = @post.id
    like.user_id = @user.id

    if like.save
      flash[:success] = 'Like saved successfully'
    else
      flash[:error] = 'Error: Like could not be saved'
    end
    redirect_to user_post_path(@user, @post)
  end
end
