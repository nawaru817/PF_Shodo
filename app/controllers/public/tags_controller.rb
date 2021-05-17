class Public::TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @tag_maps = TagMap.all
    @tags = Tag.all
    @post_items = @tag.post_items.page(params[:page]).order(id: "DESC").per(6)
    @post_item = PostItem.new
    @impression_ranks = PostItem.all.order(impressions_count: "DESC").limit(5)
    @favorite_ranks = PostItem.find(Favorite.group(:post_item_id).order('count(post_item_id) desc').limit(5).pluck(:post_item_id))
    @comment_ranks =PostItem.find(PostComment.group(:post_item_id).order('count(post_item_id) desc').limit(5).pluck(:post_item_id))
  end

end