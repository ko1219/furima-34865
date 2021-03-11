class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :edit]
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
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description,:image, :category_id, :prefecture_id, :shipping_charge_id, :shipping_day_id, :status_id, :price).merge(user_id: current_user.id)
  end

end
