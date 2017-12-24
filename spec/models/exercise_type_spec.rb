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
#

require 'rails_helper'

RSpec.describe ExerciseType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
