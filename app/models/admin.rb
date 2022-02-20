class Admin < ApplicationRecord
  has_many :gyms
  has_many :problem_lists

  validates :company, presence: true
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  validates :password, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' } do
    validates :first_name_kana
    validates :last_name_kana
  end
  validates :phone_number, presence: true
  validates :phone_number, length: { minimum: 10, maximum: 11, message: 'is too short' }
  validates :phone_number, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input only numbers' }
end
