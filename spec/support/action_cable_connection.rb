class ActionCableConnection

	attr_reader :identifiers, :logger

	def initialize(identifiers_hash = {})
		@identifiers = identifiers_hash.keys
		@logger = ActiveSupport::TaggedLogging.new(ActiveSupport::Logger.new(StringIO.new))

		identifiers_hash.each do |identifier, value|
			define_singleton_method(identifier) do
				value
			end
		end
	end

end