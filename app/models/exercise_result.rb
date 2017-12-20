class ExerciseResult < ApplicationRecord
	belongs_to :exercise
	belongs_to :exercise_goal

	has_many :metric_results
	has_many :metric_goals, through: :metric_results
end
