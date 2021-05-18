class Admin::TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @tag_maps = TagMap.all
    @tags = Tag.all
    @post_items = @tag.post_items.page(params[:page]).order(id: "DESC").per(6)
    @post_item = PostItem.new
  end

end
