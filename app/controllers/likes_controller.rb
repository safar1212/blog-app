class LikesController < ApplicationController
  def create
    @post = Post.find(params[:PostId])

    like = current_user.likes.new(
      user_id: current_user.id,
      PostId: @post.id
    )

    if like.save
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", notice: 'Success liked the post!'
    else
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", alert: 'Error occured, could not liked the post!'
    end
  end
end
