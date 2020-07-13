FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'sample' }
    email { 'sample@example.com' }
    password { '000000' }
    admin { false }
  end
  
  factory :admin_user, class: User do
    id { 2 }
    name { 'admin' }
    email { 'admin@example.com' }
    password { '111111' }
    admin { true }
  end
end
