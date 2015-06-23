require 'active_support/all'

class Book

	attr_reader :author, :name

	def initialize author, name
		@author = author
		@name = name
	end

	def to_s
		"Book: #{@name}. #{@author}"
	end

end