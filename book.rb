
class Book

	attr_reader :author, :name

	def initialize( author, name )
		@author, @name = author, name
	end

	def to_s
		"Book: #{@name}. #{@author}"
	end

end
