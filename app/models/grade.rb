class Grade < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '6級' },
    { id: 3, name: '5級' },
    { id: 4, name: '4級' },
    { id: 5, name: '3級' },
    { id: 6, name: '2級' },
    { id: 7, name: '1級' },
    { id: 8, name: '初段' }
  ]

  include ActiveHash::Associations
  has_many :problems
end
