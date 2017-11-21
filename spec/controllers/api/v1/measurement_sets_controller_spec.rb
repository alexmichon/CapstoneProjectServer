require 'rails_helper'

RSpec.describe Api::V1::MeasurementSetsController, :type => :controller, api: true do

	render_views

	describe 'GET #index' do
		it_behaves_like "GET #index" do
			let(:resources) { create_list(:measurement_set, 10)}
			let(:params) {{}}
		end
	end
	

	describe 'GET #show' do
		it_behaves_like "GET #show" do
			let(:resource) { create(:measurement_set)}
			let(:params) {{}}
		end
	end
end