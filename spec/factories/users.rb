FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 6)
    email                  { Faker::Internet.free_email }
    password               { password }
    password_confirmation  { password }
    name                   { '田中' }
    employee_number        { '1234' }
  end
end
