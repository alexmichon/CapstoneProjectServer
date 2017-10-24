class MeasurementSetsController < ApplicationController

	def index
		@measurement_sets = MeasurementSet.all
	end

	def show
		@measurement_set = MeasurementSet.find(params[:id])
	end

end