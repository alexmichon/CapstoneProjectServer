class ExerciseManager

	def self.new_exercise(user, params)
		Exercise.new (params || {}).merge(:user => user)
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
		exercise_goal = ExerciseGoal.create(:exercise_id => exercise.id)

		default_goal = exercise.exercise_type.exercise_goal_default
		default_goal.metric_goal_defaults.each do |metric_goal_default|
			MetricManager.create_metric_goal(user, exercise_goal, metric_goal_default)
		end
		exercise_goal
	end

end