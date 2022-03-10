class Gym < ApplicationRecord
  belongs_to :admin
  has_one_attached :image
  has_many :problem_lists
  has_many :results

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

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
  validates :gym_url, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/
end
