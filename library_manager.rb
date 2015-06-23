# require 'author'
# require 'book'
# require 'edition'

class LibraryManager

  def penalty edition, issue_datetime
    diff = DateTime.now - issue_datetime
    diff <= 0 ? 0 : (edition.price * 0.001 * diff * 24).round
  end

  def could_meet_each_other? author1, author2
    (author1.date_birth - author2.date_death) * (author2.date_birth - author1.date_death) >= 0
  end

  def days_to_buy price
    42
  end

  def author_translit author
    letters = {"А": "A","а": "a","Б": "B","б": "b","В": "V","в": "v","Г": "H","г": "h","Ґ": "G",
      "ґ": "g","Д": "D","д": "d","Е": "E", "е": "e", "Є": "Y","є": "ie","Ж": "Zh","ж": "zh","З": "Z","з": "z",
      "И": "Y","и": "y","І": "I","і": "i","ї": "i","Й": "Y","й": "i","К": "K","к": "k","Л": "L",
      "л": "l","М": "M","м": "m","Н": "N","н": "n","О": "O","о": "o","П": "P","п": "p","Р": "R",
      "р": "r","С": "S","с": "s","Т": "T","т": "t", "У": "U","у": "u","Ф": "F","ф": "f","Х": "Kh",
      "х": "kh","Ц": "Ts","ц": 'ts',"Ч": "Ch","ч": "ch","Ш": "Sh","ш": "sh","Щ": "Shch","щ": "shch",
      "Ю": "Y","ю": "iu","Я": "Ya","я": "ia","'": "", "’": ""}
    author.name.gsub(/./) { |c| letters.has_key?(c.to_sym) ? letters[c.to_sym] : c }
  end  

  def penalty_to_finish edition, issue_datetime, current_page, reading_speed
    estimated_time = DateTime.now + Rational((edition.pages_num - current_page) / reading_speed, 24)
    diff = issue_datetime - estimated_time
    diff >= 0 ? 0 : -(edition.price * 0.001 * diff * 24).round
  end

end