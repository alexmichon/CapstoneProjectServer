class MeasurementManager

	def self.aggregate(measurements, aggregator)
		case aggregator
		when GoalAggregator::MEAN
			GoalAggregator.mean(measurements)
		when GoalAggregator::MIN
			GoalAggregator.min(measurements)
		when GoalAggregator::MAX
			GoalAggregator.max(measurements)
		end
	end
end