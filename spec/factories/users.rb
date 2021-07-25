FactoryBot.define do
  factory :user do
    email { "example@example.com" }
    password_digest { "password" }
  end
end
