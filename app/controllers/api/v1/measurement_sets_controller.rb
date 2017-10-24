class Api::V1::MeasurementSetsController < Api::V1::ApiController

	def index
		@measurement_sets = MeasurementSet.all
	end

	def show
		@measurement_set = MeasurementSet.find(params[:id])
	end

	def create
	end


end