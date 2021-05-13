class Public::PostItemsController < ApplicationController

  def create
    @post_item = PostItem.new(post_item_params)
    @post_item.customer_id = current_customer.id
    tag_list = params[:post_item][:tag_name].split(nil)
    @post_item.save
    @post_item.save_tag(tag_list)
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
    redirect_to root_path
  end

  def search_post_item
    @post_item = PostItem.new
    @impression_ranks = PostItem.all.order(impressions_count: "DESC").limit(5)
    @favorite_ranks = PostItem.find(Favorite.group(:post_item_id).order('count(post_item_id) desc').limit(5).pluck(:post_item_id))
    @comment_ranks =PostItem.find(PostComment.group(:post_item_id).order('count(post_item_id) desc').limit(5).pluck(:post_item_id))
  end

   private

  def post_item_params
    params.require(:post_item).permit(:customer_id, :title, :image, :caption, :price, :url)
  end

end
