class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :price, :item_id :user_id

  with_options presence: true do
    validates :postcode
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number
    validates :price
    validates :item_id
    validates :user_id
  end

  def save
  end
end
