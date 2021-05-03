class Public::PostItemsController < ApplicationController



  def create
    @post_item = PostItem.new(post_item_params)
    @post_item.customer_id = current_customer.id
    @post_item.save
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def show
    @impressionist = Impression.all
    @post_item = PostItem.find(params[:id])
    # impressionist(@post_item, nil, :unique => [:session_hash])
    impressionist(@post_item, nil, :unique => [:impressionable_id, :ip_address])
    @post_comment = PostComment.new
  end

  def destroy
    @post_item = PostItem.find(params[:id])
    @post_item.destroy
    redirect_to root_path
  end

   private

  def post_item_params
    params.require(:post_item).permit(:customer_id, :title, :image, :caption, :price, :url)
  end

end
