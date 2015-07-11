FactoryGirl.define do 
	factory :user do 
		sequence :email do |n|
			"youremail#{n}@gmail.com"
		end
		password "password"
	end
end