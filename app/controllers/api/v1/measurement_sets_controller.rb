class Api::V1::MeasurementSetsController < Api::V1::ApiController

	def index
		@measurement_sets = MeasurementSet.all
	end

	def show
		@measurement_set = MeasurementSet.find(params[:id])
	end

	def create
		@measurement_set = MeasurementSet.new measurement_set_params
		@measurement_set.save!
		render :show
	end

	private

	def measurement_set_params
		params.require(:measurement_set).permit(:name)
	end

end