FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    sequence (:email) {|n| "email#{n}@nightnurses.com"}
    password "password"
  end
#
end