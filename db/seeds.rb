100.times do |post|
  Post.create(date: Faker::Date.between(2.months.ago, Date.today), rationale: Faker::Lorem.sentence)
end
