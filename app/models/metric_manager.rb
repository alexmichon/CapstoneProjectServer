class MetricManager

	def self.create_metric_goal(user, exercise_goal, metric_goal_default)
		goal = self.last_value(user, metric_goal_default.metric, metric_goal_default.aggregator)
		exercise_goal.metric_goals.create(
			:metric_id => metric_goal_default.metric_id,
			:aggregator => metric_goal_default.aggregator,
			:comparator => metric_goal_default.comparator,
			:goal => goal
		)
	end

	def self.last_value(user, metric, aggregator)
		exercise = user.exercises.where(:done => true).last
		return nil if exercise.nil?

		measurements = exercise.measurements.where(:metric_id => metric.id)
		MeasurementAggregator.aggregate(measurements, aggregator)
	end

	def self.create_metric_result(exercise, exercise_result, metric_goal)
		actual = MeasurementAggregator.aggregate(exercise.measurements.where(:metric_id => metric_goal.metric_id), metric_goal.aggregator)
		result = MeasurementComparator.compare(metric_goal.goal, actual, metric_goal.comparator)

		exercise_result.metric_results.create(
			:metric_goal_id => metric_goal.id,
			:actual => actual,
			:result => result
		)
	end

end