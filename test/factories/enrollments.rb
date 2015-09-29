FactoryGirl.define do
  factory :enrollment do
  	association :user
  	asociation :course
  end
end
