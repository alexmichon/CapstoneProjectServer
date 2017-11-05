class MetricDecorator < ApplicationDecorator
  delegate_all

  def line_chart
  	h.line_chart single_series
  end

  def single_series
    data = {}
    measurements.each do |m|
      data[m.took_at] = m.value
    end
    data
  end


  def multiple_series
  	data = {}
  	measurements.each do |m|
  		data[m.took_at] = m.value
  	end

    chartdata = {
      name: name,
      data: data
    }

  	chartdata
  end

end
