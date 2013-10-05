FactoryGirl.define do
   factory :project do
	name "Tiketee"
   end
   factory :user do |user|
   	user.sequence(:email) { |n| "user#{n}@example.org"} #this generates some thing like this user101@example.org
   	user.password "password"
   	user.password_confirmation "password"
   end
end