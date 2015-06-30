
class Edition

	attr_reader :book, :edition_year, :pages_num, :price

	def initialize( book, edition_year, pages_num, price )
		@book, @edition_year = book, edition_year
		@pages_num, @price = pages_num, price
	end

	def to_s
		"Book: #{@name}. Edition: #{@edition_year} year. #{@author}"
	end

end
