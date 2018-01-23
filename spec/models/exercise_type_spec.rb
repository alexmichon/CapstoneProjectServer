# == Schema Information
#
# Table name: exercise_types
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  video_url   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  duration    :integer          not null
#

require 'rails_helper'

RSpec.describe ExerciseType, type: :model do
  
	subject { build(:exercise_type) }

	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:description) }

	it { should validate_uniqueness_of(:name) }

end
