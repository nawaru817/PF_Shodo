class Public::PostItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:edit]

  def create
    @post_item = PostItem.new(post_item_params)
    @post_item.customer_id = current_customer.id
    tag_list = params[:post_item][:tag_name].split(nil)
    if @post_item.save
      @post_item.save_tag(tag_list)
      redirect_to root_path
    else
      @tag_maps = TagMap.all
      render 'public/homes/top'
    end
  end

  def edit
    @post_item = PostItem.find(params[:id])
    @tag_list = @post_item.tags.pluck(:tag_name).join(" ")
    if current_customer.id != @post_item.customer_id
      redirect_to root_path
    end
  end

  def update
    @post_item = PostItem.find(params[:id])
    tag_list = params[:post_item][:tag_name].split(nil)
    @post_item.update(post_item_params)
    @post_item.save_tag(tag_list)
    redirect_to post_item_path(@post_item.id)
  end

  def show
    @post_item = PostItem.find(params[:id])
    @no_comment_flag = @post_item.post_comments.exists?
    impressionist(@post_item, nil, :unique => [:impressionable_id, :ip_address])
    @post_comment = PostComment.new
  end

  def destroy
    @post_item = PostItem.find(params[:id])
    @post_item.destroy
    redirect_to root_path
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
