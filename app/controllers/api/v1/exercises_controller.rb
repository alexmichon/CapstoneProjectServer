class Api::V1::ExercisesController < Api::V1::ApiController
	before_action :authenticate_user!

	def index
		@exercises = current_user.exercises.includes(:exercise_type)
	end

	def show
		@exercise = current_user.exercises.find(params[:id])
	end

	def create
		@exercise = ExerciseManager.create_exercise(current_user, exercise_params.to_h)
		render :show
	end

	def stop
		@exercise = current_user.exercises.find(params[:id])
		@exercise.done = true
		ExerciseManager.create_exercise_result(@exercise)
		@exercise.save!
		render :show
	end

	private

	def exercise_params
		params.require(:exercise).permit(:name, :exercise_type_id)
	end

end