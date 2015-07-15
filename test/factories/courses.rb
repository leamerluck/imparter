FactoryGirl.define do
  factory :course do
    title "CourseA"
    description "Teaches everything about A"
    cost 98.99
    association :user
  end
end
