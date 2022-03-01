class Problem < ApplicationRecord
  belongs_to :admin
  belongs_to :problem_list

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade

  validates :name, presence: true
  validates :grade_id, numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true do
    validates :holding
    validates :physical
    validates :move
    validates :positioning
    validates :footwork
    validates :coordination
  end
end
