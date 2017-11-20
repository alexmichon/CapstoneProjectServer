class Measurement < ApplicationRecord
	belongs_to :metric
	belongs_to :exercise

	default_scope { order(took_at: :asc) }
end
