class ProblemList < ApplicationRecord
  belongs_to :admin
  belongs_to :gym
  has_many :problems

  validates :name, presence: true
end
