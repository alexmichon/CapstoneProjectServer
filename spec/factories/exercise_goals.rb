FactoryBot.define do
	factory :exercise_goal do
		exercise

		trait :with_metric_goals do
			after(:create) do |instance|
				create_list(:metric_goal, 10, exercise_goal: instance)
			end
		end
	end
end