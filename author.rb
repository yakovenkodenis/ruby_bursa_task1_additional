 class Author

	attr_reader :name, :date_birth, :date_death

	def initialize name, date_birth, date_death
		@name = name
		@date_birth = date_birth
		@date_death = date_death
	end

end