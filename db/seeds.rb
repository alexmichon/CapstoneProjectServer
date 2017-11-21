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

Metric.create(:name => "Acc X", :sensor => accelero)
Metric.create(:name => "Acc Y", :sensor => accelero)
Metric.create(:name => "Acc Z", :sensor => accelero)

Metric.create(:name => "Gyr X", :sensor => gyro)
Metric.create(:name => "Gyr Y", :sensor => gyro)
Metric.create(:name => "Gyr Z", :sensor => gyro)

Metric.create(:name => "Angle", :sensor => encoder)