class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!, except: :admin_guest_sign_in

  def top
    @post_item = PostItem.new
    @post_items = PostItem.page(params[:page]).order(id: "DESC").per(6)
    @tag_maps = TagMap.all
  end

  def admin_guest_sign_in
    admin = Admin.find_or_create_by!(email: 'admin@example.com') do |admin|
      admin.password = SecureRandom.urlsafe_base64
    end
    sign_in admin
    redirect_to admin_top_path
  end

  def ranking
    @post_item = PostItem.new
    @impression_ranks = PostItem.all.order(impressions_count: "DESC").limit(5)
    @favorite_ranks = PostItem.find(Favorite.group(:post_item_id).order('count(post_item_id) desc').limit(5).pluck(:post_item_id))
    @comment_ranks =PostItem.find(PostComment.group(:post_item_id).order('count(post_item_id) desc').limit(5).pluck(:post_item_id))

  end
end
