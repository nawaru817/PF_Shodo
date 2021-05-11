class Public::PostItemsController < ApplicationController

  def create
    @post_item = PostItem.new(post_item_params)
    @post_item.customer_id = current_customer.id
    @post_item.save
    redirect_to root_path
  end

  def edit
    @post_item = PostItem.find(params[:id])
  end

  def update
    @post_item = PostItem.find(params[:id])
    @post_item.update(post_item_params)
    redirect_to post_item_path(@post_item.id)
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
    if admin_signed_in?
      redirect_to admin_top_path
    else
      redirect_to root_path
    end
  end

   private

  def post_item_params
    params.require(:post_item).permit(:customer_id, :title, :image, :caption, :price, :url)
  end

end
