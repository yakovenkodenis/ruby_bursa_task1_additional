require 'active_support/all'

class Author

	attr_reader :name, :date_birth, :date_death

	def initialize name, date_birth, date_death
		@name, @date_birth, @date_death = name, date_birth, date_death
	end

	def to_s
		"Author: #{@name}. Life years: #{@date_birth.to_date} - #{@date_death.to_date}."
	end
	
end