class Measurement < ApplicationRecord
	belongs_to :metric

	default_scope { order(took_at: :asc) }
end
