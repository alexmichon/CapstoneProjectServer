require 'rails_helper.rb'

RSpec.describe User, "#create" do

	context "when no password" do

		let(:user) {build :user}

		it "shouldn't save the user" do
			expect(user.save).to be false
		end

	end

end