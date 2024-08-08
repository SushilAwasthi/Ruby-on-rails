class CommentsController < ApplicationController
  before_action :authenticate_user!
  # http_basic_authenticate_with name:"sushil" , password:"123" , only: :destroy
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.user == current_user
    @comment.destroy
    flash[:notice] = "Comment deleted"
    else
      flash[:alert] = "you are not authorized to delete this commment"
    end
    redirect_to post_path(@post), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :description, :status)
    end
end
