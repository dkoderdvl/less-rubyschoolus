# lesson 12
# 

hh = {
      'dog'=>['собака','кабель', 'сука', 'пес'],
      'cat'=>['кошка', 'кот'],
      'girl'=>['девушка']}

if hh.has_key? 'dog'
  
  puts 'find dog'
  
end

if hh.has_value? ['девушка']
  
  puts '1. Есть значение Девушка'
  
end

if hh.has_value? 'девушка'
  
  puts '2. Есть значение Девушка'
  
end
