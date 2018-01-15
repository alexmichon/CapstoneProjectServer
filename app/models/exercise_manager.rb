class ExerciseManager

	def self.new_exercise(user, params)
		Exercise.new (params || {}).merge(:user => user)
	end 

end