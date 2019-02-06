# Урок 11
# Словарь

dictionary = {
              'dog'=>'собака',
              'cat'=>'кошка',
              'girl'=>'девушка'}

loop do
  
  print 'Enter word: '
  word = gets.strip.downcase
  
  if word == ''
    
    break
    
  end
  
  if dictionary[word] == nil
    
    puts 'I dont known this word'
    next
    
  end
  
  puts "translat word Russi: #{dictionary[word]}"
  
end
