# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

encoder = Sensor.create(:name => "Encoder")
accelero = Sensor.create(:name => "Accelerometer")
gyro = Sensor.create(:name => "Gyroscope")

Metric.create(:name => "Acc X", :sensor => accelero, :min => -100, :max => 100, :unit => "m/s2")
Metric.create(:name => "Acc Y", :sensor => accelero, :min => -100, :max => 100, :unit => "m/s2")
Metric.create(:name => "Acc Z", :sensor => accelero, :min => -100, :max => 100, :unit => "m/s2")

Metric.create(:name => "Gyr X", :sensor => gyro, :min => -1000, :max => 1000, :unit => "rad/s")
Metric.create(:name => "Gyr Y", :sensor => gyro, :min => -1000, :max => 1000, :unit => "rad/s")
Metric.create(:name => "Gyr Z", :sensor => gyro, :min => -1000, :max => 1000, :unit => "rad/s")

angle_metric = Metric.create(:name => "Angle", :sensor => encoder, :min => 0, :max => 360, :unit => "rad")

exercise_type = ExerciseType.create(:name => "Test Exercise Type", :description => "This is a test exercise type", :video_url => "vZuFq4CfRR8")
exercise_type.metrics << angle_metric

exercise_goal_default = ExerciseGoalDefault.create(:exercise_type => exercise_type)

MetricGoalDefault.create(exercise_goal_default: exercise_goal_default, metric: angle_metric, goal: 180, aggregator: MetricGoal::MAX, comparator: MetricGoal::GTE)

User.create(email: "admin@admin.com", password: "password", first_name: "admin", last_name: "", confirmed_at: Time.now)