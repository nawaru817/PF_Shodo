class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @post_item = PostItem.new
    @post_items = PostItem.page(params[:page]).order(id: "DESC").per(6)
    @tag_maps = TagMap.all
    @impression_ranks = PostItem.all.order(impressions_count: "DESC").limit(5)
    @favorite_ranks = PostItem.find(Favorite.group(:post_item_id).order('count(post_item_id) desc').limit(5).pluck(:post_item_id))
    @comment_ranks =PostItem.find(PostComment.group(:post_item_id).order('count(post_item_id) desc').limit(5).pluck(:post_item_id))

  end

  def ranking
    @post_item = PostItem.new
    @impression_ranks = PostItem.all.order(impressions_count: "DESC").limit(5)
    @favorite_ranks = PostItem.find(Favorite.group(:post_item_id).order('count(post_item_id) desc').limit(5).pluck(:post_item_id))
    @comment_ranks =PostItem.find(PostComment.group(:post_item_id).order('count(post_item_id) desc').limit(5).pluck(:post_item_id))

  end
end
