# This will guess the User class
FactoryGirl.define do
  factory :user do
    username 'example'
    email 'example@gmail.com'
    password 'password'
    admin false
  end
end