# == Schema Information
#
# Table name: exercise_goal_defaults
#
#  id               :integer          not null, primary key
#  exercise_type_id :integer          not null
#
# Indexes
#
#  index_exercise_goal_defaults_on_exercise_type_id  (exercise_type_id)
#

class ExerciseGoalDefault < ApplicationRecord
	belongs_to :exercise_type
	has_many :metric_goal_defaults
end
