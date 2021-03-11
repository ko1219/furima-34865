class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :create]
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :description,:image, :category_id, :prefecture_id, :shipping_charge_id, :shipping_day_id, :status_id, :price).merge(user_id: current_user.id)
  end

end
