class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :status
  has_one_attached :image
  belongs_to :user

with_options presence: true do
  validates :image
  validates :name
  validates :description
  validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' },
  inclusion: { in: 300..9999999, message: 'Out of setting range' }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  validates :user_id
end

end
