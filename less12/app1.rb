# lesson 12
# count number of translation

hh = {
      'dog'=>['собака','кабель', 'сука', 'пес'],
      'cat'=>['кошка', 'кот'],
      'girl'=>['девушка']}

numder_translation = 0

hh.each_value do |value|
  
  numder_translation += value.size
  
end

puts numder_translation
