FactoryBot.define do
	factory :exercise_type do
		sequence :name do |n|
			"Test Exercise Type #{n}"
		end
		description "This is a text exercise type"
		duration 10

		trait :with_exercise_goal_default do
			after(:create) do |instance|
				create(:exercise_goal_default, :with_metric_goal_defaults, exercise_type: instance)
			end
		end
	end
end