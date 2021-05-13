class Public::CustomersController < ApplicationController

  def show
    @post_item = PostItem.new
    @tag_maps = TagMap.all
    @customer = Customer.find(params[:id])
    @post_items = PostItem.all.order(id: "DESC")
    @customer_id = (params[:id]).to_i
  end

  def favorite
    @post_item = PostItem.new
    @customer = Customer.find(params[:customer_id])
    @favorites = @customer.favorites
  end

  def edit
    @customer = Customer.find(params[:id])
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
