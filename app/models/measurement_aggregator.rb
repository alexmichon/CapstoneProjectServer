module MeasurementAggregator
	MAX = "max"
	MIN = "min"
	MEAN = "mean"

	def self.mean(measurements)
		sum = measurements.all.map(&:value).inject(0, :+)
		sum / measurements.count
	end

	def self.min(measurements)
		measurements.all.map(&:value).min
	end

	def self.max(measurements)
		measurements.all.map(&:value).max
	end

	def self.aggregate(measurements, aggregator)
		case aggregator
		when MEAN
			self.mean(measurements)
		when MIN
			self.min(measurements)
		when MAX
			self.max(measurements)
		end
	end
end