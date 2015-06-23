require 'rspec'
require 'active_support/all'
require '../author'
require '../book'
require '../edition'

describe Author do

	let(:book)	{ 
		Book.new( 
			Author.new( 		# Author of the book
					'Ivan', 						# Name of the author
					DateTime.new(1996, 11, 12), 	# Date of birth of the author
					DateTime.new(2004, 6, 19)),		# Date of death of the author
			'Ruby Book' ) 		# Book name
	}
	let(:edition_year) 		{ 2014 }
	let(:pages_num)			{ 450  }
	let(:price)				{ 1400 }
	subject(:edition) 		{ Edition.new( book, edition_year, pages_num, price ) }


	it 'exists' do
		expect(edition).not_to eq(nil)
	end


	context 'try to access attr_readers' do

		it 'returns its book' do
			expect(book).to eq edition.book
		end

		it 'returns its book of the type Book' do
			expect(edition.book).to be_a(Book)
		end

		it 'returns the edition year' do
			expect(edition_year).to eq edition.edition_year
		end

		it 'returns the number of its pages' do
			expect(pages_num).to eq edition.pages_num
		end

		it 'returns its price' do
			expect(price).to eq edition.price
		end

	end

end