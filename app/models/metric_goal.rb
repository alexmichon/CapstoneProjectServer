class MetricGoal < ApplicationRecord
	belongs_to :exercise_goal
	belongs_to :metric
end
