#Тесты для генератора человекопроизносимых паролей

require File.join(File.dirname(__FILE__), "../pass_generator.rb")
  
def vowels?(str)
  PassGenerator::VOWELS.include?(str)
end

def cons?(str)
  PassGenerator::CONS.include?(str)
end
  
  
def check_vowel_cons(str)
  ok = false
  length = str.length
  str.split("").each_with_index do |s, i|
    next if (i + 1) == length
    ok = (vowels?(s) && cons?(str[i + 1])) || (cons?(s) && vowels?(str[i + 1]))
  end
  ok
end

describe 'Password characteristics' do
  it 'alternation of vowels and consonants' do
    pass = PassGenerator.generate
    expect(check_vowel_cons(pass)).to eq true
  end

  it 'default length eq 8' do
    pass = PassGenerator.generate
    expect(pass.length).to eq 8
  end
  
  it 'can set length' do
    pass = PassGenerator.generate(10)
    expect(pass.length).to eq 10
  end
end