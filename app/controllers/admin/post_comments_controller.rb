class Admin::PostCommentsController < ApplicationController

  def destroy
    PostComment.find_by(id: params[:id], post_item_id: params[:post_item_id]).destroy
    redirect_to admin_post_item_path(params[:post_item_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
