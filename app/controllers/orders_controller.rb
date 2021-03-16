class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      Payjp.api_key = "sk_test_c43eed91bc908067b916e42b"
      Payjp::Charge.create(
        amount: @item.price,
        card: order_address_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_address_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end
end
