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

require 'rails_helper'

RSpec.describe ExerciseGoal, type: :model do
  
	it { should validate_presence_of(:exercise) }

end
