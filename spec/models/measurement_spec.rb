require 'rails_helper'

RSpec.describe Measurement, type: :model do

	subject { build(:measurement) }

	it { should validate_presence_of(:took_at) }
	it { should validate_presence_of(:value) }
	it { should validate_presence_of(:metric) }
	it { should validate_presence_of(:exercise) }
	
end