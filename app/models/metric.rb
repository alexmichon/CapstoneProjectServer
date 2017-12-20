class Metric < ApplicationRecord
	has_many :measurements, dependent: :destroy
	belongs_to :sensor

	has_and_belongs_to_many :exercise_types

	default_scope { order(name: :asc) }
end
