# == Schema Information
#
# Table name: metric_goal_defaults
#
#  id                       :integer          not null, primary key
#  exercise_goal_default_id :integer
#  metric_id                :integer
#  goal                     :float(24)
#  aggregator               :string(255)
#  comparator               :string(255)
#
# Indexes
#
#  index_metric_goal_defaults_on_exercise_goal_default_id  (exercise_goal_default_id)
#  index_metric_goal_defaults_on_metric_id                 (metric_id)
#

class MetricGoalDefault < ApplicationRecord
	include GoalAggregator
	include GoalComparator

	belongs_to :exercise_goal_default
	belongs_to :metric

end
