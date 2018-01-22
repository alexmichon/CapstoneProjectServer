FactoryBot.define do
	factory :exercise_type do
		sequence :name do |n|
			"Test Exercise Type #{n}"
		end
		duration 10
	end
end