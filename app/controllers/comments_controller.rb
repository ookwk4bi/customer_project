class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to customer_url(@comment.customer_id)
    else
      redirect_to customer_url(@comment.customer_id)
    end
  end

  def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :customer_id, :user_id)
  end
end