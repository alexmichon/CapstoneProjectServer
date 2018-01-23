require 'rails_helper'

RSpec.describe Metric, type: :model do

	subject { build(:metric) }

	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:sensor) }

	it { should validate_uniqueness_of(:name) }

end