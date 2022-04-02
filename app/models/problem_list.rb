class ProblemList < ApplicationRecord
  belongs_to :admin
  belongs_to :gym
  has_many :problems, dependent: :destroy

  validates :name, presence: true
end
