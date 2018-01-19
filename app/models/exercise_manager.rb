class ExerciseManager

	def self.new_exercise(user, params)
		exercise = Exercise.create! (params || {}).merge(:user => user)
		self.create_exercise_goal(user, exercise)
		exercise
	end

	def self.default_goal(user, exercise_type)
	  	exercise = user.exercises.where(exercise_type: exercise_type).order(created_at: :desc).limit(1).first
	  	exercise_result = exercise.nil? ? nil : exercise.exercise_result

	  	exercise_goal_default = exercise_type.exercise_goal_default
	  	return nil if exercise_goal_default.nil?

	  	exercise_goal = ExerciseGoalDefault.new
	  	exercise_goal_default.metric_goal_defaults.each do |m|
	  		metric_result = exercise_result.nil? ? nil : exercise_result.metric_results.where(metric: m.metric).limit(1).first
	  		goal = metric_result.nil? ? m.goal : metric_result.actual
	  		exercise_goal.metric_goal_defaults.build(metric: m.metric, goal: goal, aggregator: m.aggregator, comparator: m.comparator)
	  	end
	  	exercise_goal
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
		exercise_result = exercise.create_exercise_result(:exercise_goal_id => exercise_goal.id)

		exercise_goal.metric_goals.each do |metric_goal|
			MetricManager.create_metric_result(exercise, exercise_result, metric_goal)
		end
		exercise_result
	end

end