class MetricResult < ApplicationRecord
	belongs_to :metric_goal
	belongs_to :exercise_result
	
end
