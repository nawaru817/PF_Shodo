class Admin::PostItemsController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @post_item = PostItem.find(params[:id])
    @tag_list = @post_item.tags.pluck(:tag_name).join(" ")
  end

  def update
    @post_item = PostItem.find(params[:id])
    tag_list = params[:post_item][:tag_name].split(nil)
    @post_item.update(post_item_params)
    @post_item.save_tag(tag_list)
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

  def search_post_item
    @post_item = PostItem.new
    @tag_maps = TagMap.all
  end

   private

  def post_item_params
    params.require(:post_item).permit(:customer_id, :title, :image, :caption, :price, :url)
  end

end
