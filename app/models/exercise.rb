class Exercise < ApplicationRecord
	has_many :metrics, dependent: :destroy
end
