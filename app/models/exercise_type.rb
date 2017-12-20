class ExerciseType < ApplicationRecord
	has_many :exercises
	has_and_belongs_to_many :metrics
end
