class ExerciseGoal < ApplicationRecord
	belongs_to :exercise
	has_many :metric_goals
end
