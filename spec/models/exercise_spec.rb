require 'rails_helper'

RSpec.describe Exercise, type: :model do

	subject { build(:exercise) }

	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:duration) }
	it { should validate_presence_of(:user) }
	it { should validate_presence_of(:exercise_type) }

end