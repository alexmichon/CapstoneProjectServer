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
end
