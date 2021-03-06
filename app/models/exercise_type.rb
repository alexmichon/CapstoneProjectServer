# == Schema Information
#
# Table name: exercise_types
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  video_url   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  duration    :integer          not null
#

class ExerciseType < ApplicationRecord
	has_many :exercises
	has_and_belongs_to_many :metrics

	has_one :exercise_goal_default

	validates :name, :description, presence: true
	validates :name, uniqueness: true
end
