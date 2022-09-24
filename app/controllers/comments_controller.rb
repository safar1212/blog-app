class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:PostId])
    @comment = current_user.comments.new(
      Text: comment_params,
      user_id: current_user.id,
      PostId: @post.id
    )
    @comment.PostId = @post.id
    if @comment.save
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", notice: 'Success added new comment!'
    else
      render :new, alert: 'Error occured! comment not saved'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:Text)[:text]
  end
end
