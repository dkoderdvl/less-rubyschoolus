# Урок 11
# Сложный словарь

dictionary = {
              'dog'=>['собака','кабель', 'сука'],
              'cat'=>['кошка', 'кот'],
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
  
  if dictionary[word].class == [].class
    
    puts "number of translations the word = #{dictionary[word].size}:"
    puts "translations: "
    
    dictionary[word].each_with_index do |item, i|
      
      puts "#{i+1}. #{item}"
      
    end
  
  else
    
    puts "translation word: #{dictionary[word]}"
    
  end
  
end
