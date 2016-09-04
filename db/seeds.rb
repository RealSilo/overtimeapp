@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "John", last_name: "Doe", phone: "2053904244")
User.create(email: 'test2@test.com', password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Peter", last_name: "Thief", phone: "2053904244")
AdminUser.create(email: "admin@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Peter", last_name: "Thief", phone: "2053904244")

100.times do |post|
  Post.create(date: Faker::Date.between(2.months.ago, Date.today), rationale: Faker::Lorem.sentence, user_id: @user.id, overtime_request: Faker::Number.decimal(1, 1))
end
