class MeasurementSetDecorator < Draper::Decorator
  delegate_all

  def line_chart
  	h.line_chart format_data
  end

  def format_data
  	data = {}
  	measurements.each do |m|
  		data[m.took_at] = m.value
  	end
  	data
  end

end
