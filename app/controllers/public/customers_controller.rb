class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:edit]


  def show
    @post_item = PostItem.new
    @tag_maps = TagMap.all
    @customer = Customer.find(params[:id])
    @post_items_count = PostItem.all.order(id: "DESC")
    @post_items = PostItem.page(params[:page]).order(id: "DESC").per(7)
    @customer_id = (params[:id]).to_i
  end

  def favorite
    @post_item = PostItem.new
    @post_items_count = PostItem.all.order(id: "DESC")
    @customer = Customer.find(params[:customer_id])
    @favorites = @customer.favorites.page(params[:page]).order(id: "DESC").per(6)
    @tag_maps = TagMap.all
  end

  def edit
    @customer = Customer.find(params[:id])
    if current_customer.id != @customer.id
      redirect_to root_path
    end
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def unsubscribe
  end

  def withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email)
  end

end
