class Public::HomesController < ApplicationController

  def top
    @post_item = PostItem.new
    @post_items = PostItem.all
  end
end
