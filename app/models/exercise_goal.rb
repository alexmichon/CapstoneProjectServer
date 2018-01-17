# == Schema Information
#
# Table name: exercise_goals
#
#  id          :integer          not null, primary key
#  exercise_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_exercise_goals_on_exercise_id  (exercise_id)
#

class ExerciseGoal < ApplicationRecord
	belongs_to :exercise
	has_many :metric_goals

	def self.create_from_default_goal(default_goal, exercise)
		exercise_goal = ExerciseGoal.create(:exercise_id => exercise.id)
		default_goal.metric_default_goals.each do |metric_default_goal|
			MetricGoal.create_from_default_goal metric_default_goal, exercise_goal, goal
		end
		exercise_goal
	end
end
