@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "John", last_name: "Doe")

100.times do |post|
  Post.create(date: Faker::Date.between(2.months.ago, Date.today), rationale: Faker::Lorem.sentence, user_id: @user.id)
end
