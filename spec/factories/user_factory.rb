FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    sequence (:email) {|n| "email#{n}@nightnurses.com"}
    password "password"
  end

  factory :patient do
  	first_name "Donna"
  	last_name "Trenton"
    sex "f"
    room_number 10
    sequence(:birthdate) {|n| (10..50).to_a.sample.years.ago - n.weeks}
  end

end