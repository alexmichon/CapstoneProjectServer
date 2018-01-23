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
#  duration         :integer          not null
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

	default_scope { order(created_at: :desc) }

	scope :finished, -> { where(done: true) }



	after_initialize :set_default_name
	after_initialize :set_default_duration

	validates :name, :duration, :user, :exercise_type, presence: true



	def metrics
		Metric.where(:id => measurements.pluck(:metric_id).uniq)
	end


	private

	def set_default_name
		self.name ||= default_name
	end

	def default_name
		self.exercise_type.name if self.exercise_type
	end

	def set_default_duration
		self.duration  ||= default_duration
	end

	def default_duration
		self.exercise_type.duration if self.exercise_type
	end
	
end
