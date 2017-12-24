# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  provider               :string(255)      default("email"), not null
#  uid                    :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  username               :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  tokens                 :text(65535)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)      not null
#  last_name              :string(255)      not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#

class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable


  has_many :exercises

  def default_goal(exercise_type)
  	exercise = self.exercises.where(exercise_type: exercise_type).order(created_at: :desc).limit(1).first
  	exercise_result = exercise.nil? ? nil : exercise.exercise_result

  	exercise_goal_default = exercise_type.exercise_goal_default
  	return nil if exercise_goal_default.nil?

  	exercise_goal = ExerciseGoalDefault.new
  	exercise_goal_default.metric_goal_defaults.each do |m|
  		metric_result = exercise_result.nil? ? nil : exercise_result.metric_results.where(metric: m.metric).limit(1).first
  		goal = metric_result.nil? ? m.goal : metric_result.actual
  		exercise_goal.metric_goal_defaults.build(metric: m.metric, goal: goal, aggregator: m.aggregator, comparator: m.comparator)
  	end
  	exercise_goal
  end

end
