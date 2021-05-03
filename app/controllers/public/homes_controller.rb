class Public::HomesController < ApplicationController

  def top
    @post_item = PostItem.new
    @post_items = PostItem.all
  end

  def ranking
    @post_item_impressions = PostItem.all.order(impressions_count: "DESC")
    @favorite_ranks = PostItem.find(Favorite.group(:post_item_id).order('count(post_item_id) desc').limit(3).pluck(:post_item_id))

  end
end
