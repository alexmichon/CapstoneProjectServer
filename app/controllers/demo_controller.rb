class DemoController < ApplicationController

	def create
		puts params
		t = Test.create(value: demo_params[:value], date: Time.at(demo_params[:date].to_i))
		respond_to do |format|
			format.json { render json: t }
		end
	end

	private

	def demo_params
		params.require(:demo).permit(:value, :date)
	end

end
