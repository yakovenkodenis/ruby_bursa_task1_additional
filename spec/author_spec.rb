require 'rspec'
require 'active_support/all'
require '../author'

describe Author do

	let(:name) 			{ 'Ivan' }
	let(:date_birth) 		{ DateTime.new( 1996, 11, 12 ) }
	let(:date_death) 		{ DateTime.new( 2004, 6, 19 ) }
	subject(:author) 		{ Author.new( name, date_birth, date_death ) }


	it 'exists' do
		expect(author).not_to eq(nil)
	end


	context 'try to access attr_readers' do

		it 'returns its name' do
			expect(name).to eq author.name
		end

		it 'returns its date_birth' do
			expect(date_birth).to eq author.date_birth
		end

		it 'returns its date_death' do
			expect(date_death).to eq author.date_death
		end

	end

end
