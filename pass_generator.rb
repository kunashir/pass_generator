#Генератор человекопроизносимых паролей

class PassGenerator
  VOWELS = %w(а у о ы и э я ю ё е)
  CONS = %w(б в г д ж з й к л м н п р с т ф х ц ч ш щ)
  def self.generate(length=8)
    source = [VOWELS, CONS]
    letter_from = rand 2
    pass = ""
    i = 0
    while i < length
      pass += source[letter_from][rand(source[letter_from].length)]
      if letter_from  == 0
        letter_from = 1
      else
        letter_from = 0
      end
      i += 1
    end

    pass
  end
    
end