# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
   name { Faker::Name.name }
   email "test@test.com"
   dob '12/10/1999'
   password '12345678'
   password_confirmation '12345678'
  end
end


