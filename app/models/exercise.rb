class Exercise < ApplicationRecord
	has_many :measurements, dependent: :destroy
	has_many :metrics, through: :measurements

	def metrics
		Metric.where(:id => measurements.pluck(:metric_id).uniq)
	end
end
