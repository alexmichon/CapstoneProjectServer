# == Schema Information
#
# Table name: exercises
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  exercise_type_id :integer          not null
#  user_id          :integer          not null
#  done             :boolean          default(FALSE)
#
# Indexes
#
#  index_exercises_on_exercise_type_id  (exercise_type_id)
#  index_exercises_on_user_id           (user_id)
#

class Exercise < ApplicationRecord
	has_many :measurements, dependent: :destroy

	has_one :exercise_goal, dependent: :destroy
	has_one :exercise_result, dependent: :destroy

	belongs_to :exercise_type

	belongs_to :user

	before_create :set_default_name


	default_scope { order(created_at: :desc) }

	scope :finished, -> { where(done: true) }

	def metrics
		Metric.where(:id => measurements.pluck(:metric_id).uniq)
	end


	private

	def set_default_name
		self.name ||= default_name
	end

	def default_name
		self.exercise_type.name
	end
end
