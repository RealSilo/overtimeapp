@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "John", last_name: "Doe")
User.create(email: 'test2@test.com', password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Peter", last_name: "Thief")
AdminUser.create(email: "admin@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Peter", last_name: "Thief")

100.times do |post|
  Post.create(date: Faker::Date.between(2.months.ago, Date.today), rationale: Faker::Lorem.sentence, user_id: @user.id, overtime_request: 2.5)
end
