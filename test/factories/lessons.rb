FactoryGirl.define do
  factory :lesson do
    title "lesson 1"
    subtitle "part a"
    association :user, :section
  end

end
