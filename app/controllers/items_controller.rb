class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description,:image, :category_id, :prefecture_id, :shipping_charge_id, :shipping_day_id, :status_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end
