class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id, :token, :price, :order_id

  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/

  VALID_POSTCODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
  with_options presence: true do
    validates :postcode, format: { with: VALID_POSTCODE_REGEX, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :block
    validates :phone_number, numericality: { message: 'Input only number' }
    validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
