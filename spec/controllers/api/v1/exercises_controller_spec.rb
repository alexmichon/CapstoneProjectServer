require 'rails_helper'

RSpec.describe Api::V1::ExercisesController, :type => :controller, api: true do

	render_views

	describe 'GET #index' do

		let(:user) {create(:user)}
		before { authenticate(user) }

		it_behaves_like "GET #index" do
			let!(:resources) { create_list(:exercise, 10, user: user)}
			let(:params) {{}}
		end
	end
	

	describe 'GET #show' do

		let(:user) {create(:user)}
		before { authenticate(user) }

		it_behaves_like "GET #show" do
			let(:resource) { create(:exercise, user: user)}
			let(:params) {{}}
		end
	end
end