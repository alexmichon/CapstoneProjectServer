class Api::V1::MeasurementsController < Api::V1::ApiController
	before_action :authenticate_user!
	before_action :find_exercise

	def index
		@measurements = @exercise.measurements.all
	end

	def show
		@measurement = @exercise.measurements.find(params[:id])
	end

	private

	def find_exercise
		@exercise = current_user.exercises.find(params[:exercise_id])
	end

end
