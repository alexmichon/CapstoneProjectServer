FactoryBot.define do
	factory :exercise_goal_default do
		exercise_type

		trait :with_metric_goal_defaults do
			after(:create) do |instance|
				create_list(:metric_goal_default, 10, exercise_goal_default: instance)
			end
		end
	end
end