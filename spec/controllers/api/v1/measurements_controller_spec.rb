require 'rails_helper'

RSpec.describe Api::V1::MeasurementsController, :type => :controller, api: true do

	render_views

	describe 'GET #index' do

		let(:user) {create(:user)}
		before { authenticate(user) }

		it_behaves_like "GET #index" do
			let!(:exercise) {create(:exercise, user: user)}
			let!(:resources) { create_list(:measurement, 10, exercise: exercise)}
			let!(:params) {{exercise_id: exercise.id}}
		end
	end
	

	describe 'GET #show' do

		let(:user) {create(:user)}
		before { authenticate(user) }

		it_behaves_like "GET #show", :measurements do
			let!(:exercise) {create(:exercise, user: user)}
			let!(:resource) { create(:measurement, exercise: exercise)}
			let!(:params) {{exercise_id: exercise.id}}
		end 
	end
end