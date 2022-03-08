class Result < ApplicationRecord
  belongs_to :user
  belongs_to :gym
  belongs_to :problem
end
