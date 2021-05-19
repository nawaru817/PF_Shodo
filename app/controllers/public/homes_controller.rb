class Public::HomesController < ApplicationController

  def top
    @post_item = PostItem.new
    @tag_maps = TagMap.all
    @post_items = PostItem.page(params[:page]).order(id: "DESC").per(6)
  end

  def guest_sign_in
    customer = Customer.find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.name = "ゲスト"
      customer.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def ranking
    @post_item = PostItem.new
    @impression_ranks = PostItem.all.order(impressions_count: "DESC").limit(10)
    @favorite_ranks = PostItem.find(Favorite.group(:post_item_id).order('count(post_item_id) desc').limit(10).pluck(:post_item_id))
    @comment_ranks =PostItem.find(PostComment.group(:post_item_id).order('count(post_item_id) desc').limit(10).pluck(:post_item_id))

  end
end
