module MeasurementComparator
	GTE = ">="
	GT = ">"
	LT = "<"
	LTE = "<="
	EQ = "="
	NEQ = "!="

	def self.compare(expected, actual, comparator)
		case comparator
		when GTE
			actual >= expected
		when GT
			actual > expected
		when LTE
			actual <= expected
		when LT
			actual < expected
		when EQ
			actual == expected
		when NEQ
			actual != expected
		end	
	end
end