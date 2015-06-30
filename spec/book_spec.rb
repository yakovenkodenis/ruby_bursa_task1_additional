require 'rspec'
require 'active_support/all'
require '../author'
require '../book'

describe Author do

	let(:author)	{ Author.new( 'Ivan', DateTime.new(1996, 11, 12), DateTime.new(2004, 6, 19) ) }
	let(:name) 	{ 'Ruby Book' }
	subject(:book) 	{ Book.new( author, name ) }


	it 'exists' do
		expect(book).not_to eq(nil)
	end


	context 'try to access attr_readers' do

		it 'returns its name' do
			expect(name).to eq book.name
		end

		it 'returns its author' do
			expect(author).to eq book.author
		end

		it 'returns the Author object when asked for the author' do
			expect(book.author).to be_an(Author)
		end

	end

end
