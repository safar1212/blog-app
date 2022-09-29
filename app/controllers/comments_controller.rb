class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  # def create
  #   @post = Post.find(params[:PostId])
  #   @comment = current_user.comments.new(
  #     Text: comment_params,
  #     user_id: current_user.id,
  #     PostId: @post.id
  #   )
  #   @comment.PostId = @post.id
  #   if @comment.save
  #     redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", notice: 'Success added new comment!'
  #   else
  #     render :new, alert: 'Error occured! comment not saved'
  #   end
  # end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    comment = Comment.new(params.require(:comment).permit(:Text))
    comment.user_id = @user.id
    comment.post_id = @post.id
    respond_to do |format|
      format.html do
        if comment.save
          flash[:success] = 'Comment saved successfully'
          redirect_to user_post_path(@user, @post)
        else
          flash.now[:error] = 'Error: Comment could not be saved'
          render :new, locals: { comment: }
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:Text)[:text]
  end
end
