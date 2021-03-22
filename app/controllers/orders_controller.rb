class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only:[:index, :create]
  def index
    @order_address = OrderAddress.new
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      card_info
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

  def set_item
    @item.find(params[:item_id])
  end

  def card_info
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price,
    card: order_address_params[:token],
    currency: 'jpy'
    )
  end

end
