class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
  end

  def new
  end

  def create

  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end
