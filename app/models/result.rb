class Result < ApplicationRecord
  belongs_to :user
  belongs_to :gym
  belongs_to :problem

  with_options presence: true do
    validates :climb
    validates :holding
    validates :physical
    validates :move
    validates :positioning
    validates :footwork
    validates :coordination
  end
end
