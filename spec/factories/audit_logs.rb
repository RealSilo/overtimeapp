FactoryGirl.define do
  factory :audit_log do
    user nil
    status 1
    start_date "2016-09-04"
    date_verified "2016-09-04"
  end
end
