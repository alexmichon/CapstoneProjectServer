json.measurements measurement_set.measurements do |meas|
	json.partial! 'api/v1/measurements/measurement', measurement: meas
end