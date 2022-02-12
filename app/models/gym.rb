class Gym < ApplicationRecord
  belongs_to :admin
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :image
    validates :name
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true do
    validates :city_name
    validates :street
    validates :gym_url
  end
end
