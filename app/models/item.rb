class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :status
  has_one_attached :image


with_options presence: true do
  validates :image
  validates :name
  validates :description
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' },
  inclusion: { in: 300..9999999, message: 'Out of setting range' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_charge_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_day_id, numericality: { other_than: 1, message: 'Select' }
  validates :status_id, numericality: { other_than: 1, message: 'Select' }
  validates :category_id, numericality: { other_than: 1, message: 'Select' }
end

end
