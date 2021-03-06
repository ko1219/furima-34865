class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には全角文字を使用してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には全角文字を使用してください' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'には全角文字を使用してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'には全角文字を使用してください' }
    validates :nickname
    validates :birthday
  end
end
