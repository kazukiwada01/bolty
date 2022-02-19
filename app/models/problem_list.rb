class ProblemList < ApplicationRecord
  belongs_to :admin
  belongs_to :gym

  validates :name, presence: true
end
