class Api::V1::MetricsController < Api::V1::ApiController

	before_action :find_exercise

	def index
		@metrics = @exercise.metrics.all
	end

	def show
		@metric = @exercise.metrics.find(params[:id])
	end

	def create
		@metric = @exercise.metrics.build metrics_params
		@metric.save!
		render :show
	end

	private

	def metrics_params
		params.require(:metric).permit(:name, :sensor, :sensor_id)
	end

	def find_exercise
		@exercise = Exercise.find(params[:exercise_id])
	end
end