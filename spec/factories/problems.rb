FactoryBot.define do
  factory :problem do
    name           { '1番' }
    grade_id       { 2 }
    holding        { 1 }
    physical       { 1 }
    move           { 1 }
    positioning    { 1 }
    footwork       { 1 }
    coordination   { 1 }
    admin
    problem_list
  end
end
