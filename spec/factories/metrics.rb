FactoryBot.define do
	factory :metric do
		sensor
		sequence(:name) {|n| "metric#{n}"}
	end
end