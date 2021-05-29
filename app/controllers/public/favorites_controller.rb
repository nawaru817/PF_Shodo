class Public::FavoritesController < ApplicationController

  before_action :post_item_params

  def create
    post_item = PostItem.find(params[:post_item_id])
    favorite = current_customer.favorites.new(post_item_id: post_item.id)
    favorite.save
    redirect_to post_item_path(post_item)
  end

  def destroy
    post_item = PostItem.find(params[:post_item_id])
    favorite = current_customer.favorites.find_by(post_item_id: post_item.id)
    favorite.destroy
    redirect_to post_item_path(post_item)
  end

  private

  def post_item_params
    @post_item = PostItem.find(params[:post_item_id])
  end

end
