class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(params[:id])
  end

  def create
    @order_address = OrderAddress.create(order_address_params)
  end

  private
  def order_address_params
    params.permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number, :price, :order_id, :user_id)
  end
end
