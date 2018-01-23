class ExerciseManager

	def self.create_exercise(user, params)
		exercise = Exercise.create! (params || {}).merge(:user => user)
		self.create_exercise_goal(user, exercise)
		exercise
	end

	def self.create_exercise_goal(user, exercise)
		exercise_goal = exercise.create_exercise_goal

		default_goal = exercise.exercise_type.exercise_goal_default
		default_goal.metric_goal_defaults.each do |metric_goal_default|
			MetricManager.create_metric_goal(user, exercise_goal, metric_goal_default)
		end
		exercise_goal
	end

	def self.create_exercise_result(exercise)
		exercise_goal = exercise.exercise_goal
		exercise_result = exercise.create_exercise_result(:exercise_goal => exercise_goal)

		exercise_goal.metric_goals.each do |metric_goal|
			MetricManager.create_metric_result(exercise, exercise_result, metric_goal)
		end
		exercise_result
	end

end