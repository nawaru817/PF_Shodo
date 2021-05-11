class Admin::PostItemsController < ApplicationController

  def edit
    @post_item = PostItem.find(params[:id])
  end

  def update
    @post_item = PostItem.find(params[:id])
    @post_item.update(post_item_params)
    redirect_to admin_post_item_path(@post_item.id)
  end

  def show
    @post_item = PostItem.find(params[:id])
    # impressionist(@post_item, nil, unique: [:session_hash, :ip_address])
    impressionist(@post_item, nil, :unique => [:impressionable_id, :ip_address])
    # impressionist(@post_item)
    @post_comment = PostComment.new
  end

  def destroy
    @post_item = PostItem.find(params[:id])
    @post_item.destroy
    redirect_to admin_top_path
  end

   private

  def post_item_params
    params.require(:post_item).permit(:customer_id, :title, :image, :caption, :price, :url)
  end

end
