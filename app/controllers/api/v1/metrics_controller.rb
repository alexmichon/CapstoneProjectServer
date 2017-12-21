class Api::V1::MetricsController < Api::V1::ApiController

	before_action :find_exercise_type

	def index
		@metrics = @exercise_type.metrics.all
	end

	def show
		@metric = @exercise_type.metrics.find(params[:id])
	end

	private

	def metrics_params
		params.require(:metric).permit(:name, :sensor, :sensor_id)
	end

	def find_exercise_type
		@exercise_type = ExerciseType.find(params[:exercise_type_id])
	end
end