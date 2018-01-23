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

require 'rails_helper'

RSpec.describe ExerciseResult, type: :model do
  
	it { should validate_presence_of(:exercise) }

end
