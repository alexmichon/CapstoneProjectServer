class Metric < ApplicationRecord
	belongs_to :exercise
	has_many :measurements, dependent: :destroy

	default_scope { order(name: :asc) }
end
