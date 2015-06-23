class Edition

	attr_reader :book, :edition_year, :pages_num, :price

	def initialize book, edition_year, pages_num, price
		@book = book
		@edition_year = edition_year
		@pages_num = pages_num
		@price = price
	end

end