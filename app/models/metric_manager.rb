class MetricManager

	def self.create_metric_goal(user, exercise_goal, metric_goal_default)
		goal = self.last_value(user, metric_goal_default.metric, metric_goal_default.aggregator)
		MetricGoal.create(
			:exercise_goal_id => exercise_goal.id,
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
		MeasurementManager.aggregate(measurements, aggregator)
	end

end