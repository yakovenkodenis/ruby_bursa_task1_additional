require 'rspec'
require 'active_support/all'
require '../author'
require '../edition'
require '../book'
require '../library_manager'

describe LibraryManager do

  context '#penalty' do

    it 'return penalty, hours equal to 5' do
      overdue_hours = DateTime.now.new_offset(0) - 5.hours
      edition = Edition.new( nil, nil, nil, 1400 )
      res = LibraryManager.new.penalty(edition, overdue_hours)

      expect(res).to eq 7
    end

    it 'return penalty, hours equal to 12' do
      overdue_hours = DateTime.now.new_offset(0) - 12.hours
      edition = Edition.new( nil, nil, nil, 1400 )
      res = LibraryManager.new.penalty(edition, overdue_hours)

      expect(res).to eq 17
    end

    it 'return penalty, hours equal to 1' do
      overdue_hours = DateTime.now.new_offset(0) - 1.hours
      edition = Edition.new( nil, nil, nil, 1400 )
      res = LibraryManager.new.penalty(edition, overdue_hours)

      expect(res).to eq 1
    end

    it 'return penalty, hours equal to 0' do
      overdue_hours = DateTime.now.new_offset(0) - 0.hours
      edition = Edition.new( nil, nil, nil, 1400 )
      res = LibraryManager.new.penalty(edition, overdue_hours)

      expect(res).to eq 0
    end

  end


  context '#could_meet_each_other?' do

    it "didn't meet each other, first died before second was born" do
      res = LibraryManager.new.could_meet_each_other?(
                                      Author.new(nil, 1234, 1256),
                                      Author.new(nil, 1876, 1955))

      expect(res).to eq false
    end

    it "meet each other, first was born earlier" do
      res = LibraryManager.new.could_meet_each_other?(
                                      Author.new(nil, 1940, 2005),
                                      Author.new(nil, 1950, 1999))

      expect(res).to eq true
    end

    it "meet each other, second was born earlier" do
      res = LibraryManager.new.could_meet_each_other?(
                                      Author.new(nil, 1905, 1967),
                                      Author.new(nil, 1900, 1980))

      expect(res).to eq true
    end

    it "didn't meet each other, second died before first was born" do
      res = LibraryManager.new.could_meet_each_other?(
                                      Author.new(nil, 1803, 1855),
                                      Author.new(nil, 1700, 1745))

      expect(res).to eq false
    end
  
    it "meet each other, born and died in same years" do
      res = LibraryManager.new.could_meet_each_other?(
                                      Author.new(nil, 1900, 1950),
                                      Author.new(nil, 1900, 1950))

      expect(res).to eq true
    end

    it "meet each other, first was born earlier in BC" do
      res = LibraryManager.new.could_meet_each_other?(
                                      Author.new(nil, -50, 10),
                                      Author.new(nil, 0, 58))

      expect(res).to eq true
    end

    it "meet each other, second was born earlier in BC" do
      res = LibraryManager.new.could_meet_each_other?(
                                      Author.new(nil, 2, 50),
                                      Author.new(nil,-50, 50))

      expect(res).to eq true
    end

  end


  context '#days_to_buy' do

    it 'return days to buy for particular book with price' do
      price_in_cent = rand(10000)

      res = LibraryManager.new.days_to_buy(price_in_cent)

      expect(res).to eq 42
    end

  end

  context '#author_translit' do

    it 'return name in transliteration' do
      author = Author.new("Гнат Хоткевич", nil, nil)

      res = LibraryManager.new.author_translit(author)

      expect(res).to eq 'Hnat Khotkevych'
    end

    it 'return name in transliteration' do
      author = Author.new("Ґлеб Щуров", nil, nil)

      res = LibraryManager.new.author_translit(author)

      expect(res).to eq 'Gleb Shchurov'
    end

    it 'return name in transliteration' do
      author = Author.new("Григорій Квітка-Основ'яненко", nil, nil)

      res = LibraryManager.new.author_translit(author)

      expect(res).to eq "Hryhorii Kvitka-Osnovianenko"
    end

  end

  context '#penalty_to_finish' do

    it 'return penalty, without expiration' do
      twenty_days_from_now = DateTime.now.new_offset(0) + 480.hours
      edition = Edition.new(nil, nil, 348, 1400)
      current_page = 25
      reading_speed = 5

      res = LibraryManager.new.penalty_to_finish(  edition, twenty_days_from_now, 
                                                   current_page, reading_speed )

      expect(res).to eq 0
    end

    it 'return penalty, with expiration which will happen' do
      twenty_days_from_now = DateTime.now.new_offset(0) + 1.hours
      edition = Edition.new(nil, nil, 100, 1400)
      current_page = 50
      reading_speed = 10

      res = LibraryManager.new.penalty_to_finish(  edition, twenty_days_from_now, 
                                                   current_page, reading_speed )

      expect(res).to eq 6
    end

    it "return penalty, with expiration which haven't happened yet" do
      twenty_days_from_now = DateTime.now.new_offset(0) - 1.hours
      edition = Edition.new(nil, nil, 100, 1400)
      current_page = 50
      reading_speed = 10

      res = LibraryManager.new.penalty_to_finish(  edition, twenty_days_from_now, 
                                                   current_page, reading_speed )

      expect(res).to eq 8
    end

    it 'return penalty, without expiration, book will be returned in time ' do
      twenty_days_from_now = DateTime.now.new_offset(0) + 5.hours
      edition = Edition.new(nil, nil, 100, 1400)
      current_page = 50
      reading_speed = 10

      res = LibraryManager.new.penalty_to_finish(  edition, twenty_days_from_now, 
                                                   current_page, reading_speed )

      expect(res).to eq 0
    end

  end

end 