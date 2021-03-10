class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shippingcharge
  belongs_to :prefecture
  belongs_to :shippingdate
  belongs_to :status
  has_one_attached :image
  belongs_to :user

with_options presence: true do
  validates :name
  validates :description
  validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' },
  format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :user_id
  validates :image, attached_file_presence: true
end

end
