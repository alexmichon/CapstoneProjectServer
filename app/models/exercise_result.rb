# == Schema Information
#
# Table name: exercise_results
#
#  id               :integer          not null, primary key
#  exercise_goal_id :integer
#  exercise_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_exercise_results_on_exercise_goal_id  (exercise_goal_id)
#  index_exercise_results_on_exercise_id       (exercise_id)
#

class ExerciseResult < ApplicationRecord
	belongs_to :exercise
	belongs_to :exercise_goal

	has_many :metric_results
	has_many :metric_goals, through: :metric_results

	validates :exercise, presence: true

end
