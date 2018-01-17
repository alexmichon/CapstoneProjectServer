# == Schema Information
#
# Table name: metric_goals
#
#  id               :integer          not null, primary key
#  exercise_goal_id :integer
#  metric_id        :integer
#  goal             :float(24)
#  aggregator       :string(255)
#  comparator       :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_metric_goals_on_exercise_goal_id  (exercise_goal_id)
#  index_metric_goals_on_metric_id         (metric_id)
#

class MetricGoal < ApplicationRecord
	include GoalAggregator
	include GoalComparator

	belongs_to :exercise_goal
	belongs_to :metric

	def self.create_from_default_goal(metric_default_goal, exercise_goal, goal)
		Metric.create(
			:exercise_goal_id => exercise_goal.id,
			:metric_id => metric_default_goal.metric_id,
			:aggregator => metric_default_goal.aggregator,
			:comparator => metric_default_goal.comparator,
			:goal => goal,
		)
	end
end
