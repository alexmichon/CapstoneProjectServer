class Sensor < ApplicationRecord
	has_many :metrics, dependent: :destroy
end
