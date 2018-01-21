# == Schema Information
#
# Table name: exercises
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  exercise_type_id :integer          not null
#  user_id          :integer          not null
#  done             :boolean          default(FALSE)
#  duration         :integer          not null
#
# Indexes
#
#  index_exercises_on_exercise_type_id  (exercise_type_id)
#  index_exercises_on_user_id           (user_id)
#

FactoryBot.define do
	factory :exercise do
	end
end
