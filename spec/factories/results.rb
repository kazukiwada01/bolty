FactoryBot.define do
  factory :result do
    climb          { 1 }
    holding        { 1 }
    physical       { 1 }
    move           { 1 }
    positioning    { 1 }
    footwork       { 1 }
    coordination   { 1 }
    user
    gym
    problem
  end
end
