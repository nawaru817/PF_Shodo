class Public::PostCommentsController < ApplicationController

  def create
    post_item = PostItem.find(params[:post_item_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.post_item_id = post_item.id
    comment.save
    redirect_to post_item_path(post_item)
  end

  def destroy
    PostComment.find_by(id: params[:id], post_item_id: params[:post_item_id]).destroy
    redirect_to post_item_path(params[:post_item_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
