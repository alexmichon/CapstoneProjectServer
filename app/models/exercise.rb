class Exercise < ApplicationRecord
	has_many :measurements, dependent: :destroy

	has_one :exercise_goal
	has_one :exercise_result

	belongs_to :exercise_type

	def metrics
		Metric.where(:id => measurements.pluck(:metric_id).uniq)
	end
end
