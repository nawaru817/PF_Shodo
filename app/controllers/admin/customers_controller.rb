class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @post_item = PostItem.new
    @customer = Customer.find(params[:id])
    @post_items = PostItem.all.order(id: "DESC")
    @customer_id = (params[:id]).to_i
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  def favorite
    @post_item = PostItem.new
    @customer = Customer.find(params[:customer_id])
    @favorites = @customer.favorites
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email)
  end

end