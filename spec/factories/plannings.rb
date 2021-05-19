FactoryBot.define do
  factory :planning do
    user { nil }
    level { 1 }
    condition { 1.5 }
    adjustment { 1 }
    focus { "MyString" }
    allowed_time { 1 }
  end
end
