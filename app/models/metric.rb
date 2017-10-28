class Metric < ApplicationRecord
	belongs_to :exercise
	has_many :measurements, dependent: :destroy
end
