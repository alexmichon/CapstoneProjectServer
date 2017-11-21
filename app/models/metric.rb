class Metric < ApplicationRecord
	has_many :measurements, dependent: :destroy
	belongs_to :sensor

	default_scope { order(name: :asc) }
end
