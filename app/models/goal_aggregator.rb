module GoalAggregator
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
end