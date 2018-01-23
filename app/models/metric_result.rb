# == Schema Information
#
# Table name: metric_results
#
#  id                 :integer          not null, primary key
#  exercise_result_id :integer
#  metric_goal_id     :integer
#  actual             :float(24)
#  result             :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_metric_results_on_exercise_result_id  (exercise_result_id)
#  index_metric_results_on_metric_goal_id      (metric_goal_id)
#

class MetricResult < ApplicationRecord
	belongs_to :metric_goal
	belongs_to :exercise_result

	validates :metric_goal, :exercise_result, presence: true
	validates :metric_goal_id, uniqueness: true
	
	def metric
		self.metric_goal.metric
	end

	def expected
		self.metric_goal.goal
	end
end
