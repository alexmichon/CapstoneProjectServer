class Patient < User

	belongs_to :doctor, optional: true

end