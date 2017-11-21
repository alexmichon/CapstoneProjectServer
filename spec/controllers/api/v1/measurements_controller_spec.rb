require 'rails_helper'

RSpec.describe Api::V1::MeasurementsController, :type => :controller, api: true do

	render_views

	describe 'GET #index' do
		it_behaves_like "GET #index" do
			let!(:measurement_set) {create(:measurement_set)}
			let!(:resources) { create_list(:measurement, 10, measurement_set: measurement_set)}
			let!(:params) {{measurement_set_id: measurement_set.id}}
		end
	end
	

	describe 'GET #show' do
		it_behaves_like "GET #show", :measurements do
			let!(:measurement_set) {create(:measurement_set)}
			let!(:resource) { create(:measurement, measurement_set: measurement_set)}
			let!(:params) {{measurement_set_id: measurement_set.id}}
		end 
	end
end