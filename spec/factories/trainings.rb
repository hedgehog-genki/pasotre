FactoryBot.define do
  factory :training do
    name { "testTraining" }
    part { "body" }
    point { 1 }
    time { 1 }
    basis { 1.5 }
  end
end