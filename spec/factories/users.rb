FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'sample' }
    email { 'sample@example.com' }
    password { '000000' }
    admin { false }
  end
end
