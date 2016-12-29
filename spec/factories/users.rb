FactoryGirl.define do
  factory :user do
    name "Joe"
    sequence(:email, 1) { |n| "#{name.gsub(/ /,'').downcase}#{n}@example.com" }
    password "password" 
    password_confirmation "password"
    #user
  end
end
