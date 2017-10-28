class Api::V1::MeasurementsController < Api::V1::ApiController
	before_action :find_exercise
	before_action :find_metric

	def index
		@measurements = @metric.measurements.all
	end

	def show
		@measurement = @metric.measurements.find(params[:id])
	end

	def create
		@measurement = @metric.measurements.build measurement_params
		@measurement.save!
		render :show
	end

	private

	def measurement_params
		params.require(:measurement).permit(:took_at, :value)
	end

	def find_exercise
		@exercise = Exercise.find(params[:exercise_id])
	end

	def find_metric
		@metric = @exercise.metrics.find(params[:metric_id])
	end

end
