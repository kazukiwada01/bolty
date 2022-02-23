class Problem < ApplicationRecord
  belongs_to :admin
  belongs_to :problem_list

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade
  end
end
