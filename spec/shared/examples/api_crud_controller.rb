RSpec.shared_examples "GET #index" do
	before do
		resources
		get :index, params: params, format: :json
	end

	it_behaves_like "a successful request"

	it "returns all elements" do
		expect(json.length).to eq resources.length
	end

end


RSpec.shared_examples "GET #show" do

	context "when the resource exists" do

		before do
			get :show, params: {:id => resource.id}.merge(params || {}), format: :json
		end

		it_behaves_like "a successful request"

		it "returns the correct element" do
			expect(json["id"]).to eq resource.id
		end
	end

	context "when the resource doesn't exists" do
		before do
			get :show, params: {:id => -1}.merge(params || {}), format: :json
		end

		it_behaves_like "a not found request"

		it "returns the error message" do
			expect(json["error"]).not_to be blank?
		end
	end
end