FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@gmail.com" }
    password 'example0000'
    password_confirmation 'example0000'
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end

  factory :admin_user, class: "AdminUser" do
    sequence(:email) { |n| "admin_example#{n}@gmail.com" }
    password 'example0000'
    password_confirmation 'example0000'
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end

  factory :non_authorized_user, class: "User" do
    sequence(:email) { |n| "admin_example#{n}@gmail.com" }
    password 'example0000'
    password_confirmation 'example0000'
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end

  factory :post do
    date Faker::Date.between(2.months.ago, Date.today)
    rationale Faker::Lorem.sentence
  end

  factory :second_post, class: "Post" do
    date Faker::Date.between(2.months.ago, Date.today)
    rationale Faker::Lorem.sentence
  end 
end