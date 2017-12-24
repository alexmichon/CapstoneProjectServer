# == Schema Information
#
# Table name: sensors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sensor < ApplicationRecord
	has_many :metrics, dependent: :destroy
end
