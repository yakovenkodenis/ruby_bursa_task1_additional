 require 'active_support/core_ext'

class Edition

	attr_reader :book, :edition_year, :pages_num, :price

	def initialize book, edition_year, pages_num, price
		@book = book
		@edition_year = edition_year
		@pages_num = pages_num
		@price = price
	end

	def to_s
		"Book: #{@name}. Edition: #{@edition_year} year. #{@author}"
	end

end