require 'rails_helper'

RSpec.describe Api::V1::MeasurementsController, :type => :controller, api: true do

	render_views

	describe 'GET #index' do
		it_behaves_like "GET #index" do
			let!(:exercise) {create(:exercise)}
			let!(:resources) { create_list(:measurement, 10, exercise: exercise)}
			let!(:params) {{exercise_id: exercise.id}}
		end
	end
	

	describe 'GET #show' do
		it_behaves_like "GET #show", :measurements do
			let!(:exercise) {create(:exercise)}
			let!(:resource) { create(:measurement, exercise: exercise)}
			let!(:params) {{exercise_id: exercise.id}}
		end 
	end
end