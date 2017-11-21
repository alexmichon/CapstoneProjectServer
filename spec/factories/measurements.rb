FactoryBot.define do
	factory :measurement do
		value 1
		took_at Time.now
		measurement_set
	end
end