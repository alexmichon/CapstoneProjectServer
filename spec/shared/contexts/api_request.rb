def expect_status(status_code)
	expect(response.status).to eq status_code
end

shared_context 'a successful request' do

	it 'returns a successful status code (200)' do
		expect_status 200
	end
end

shared_context 'an unauthenticated request' do

	it 'returns an unauthenticated status code (401)' do
		expect_status 401
	end

	it "returns the error message" do
		expect(json["error"]).not_to be blank?
	end
end

shared_context 'a forbidden request' do

	it 'returns a forbidden status code (403)' do
		expect_status 403
	end

	it "returns the error message" do
		expect(json["error"]).not_to be blank?
	end
end

shared_context 'a not found request' do

	it 'returns a not found status code (404)' do
		expect_status 404
	end

	it "returns the error message" do
		expect(json["error"]).not_to be blank?
	end
end