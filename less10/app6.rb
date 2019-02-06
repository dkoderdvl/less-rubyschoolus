# Урок 10
# 

arr = []

loop do
  
  print "Кого добавить в список? "
  name = gets.strip.capitalize
  
  if name == ""
    
    break
    
  end
  
  print "Введите возраст? "
  age = gets.to_i
  
  arr_u = []
  arr_u << name
  arr_u << age
  
  arr << arr_u
  
end

if arr.empty?
  
  puts "В списке никого нет"
  
else
  
  puts "Список учеников:"
  arr.each_index do |i|
    
    puts "#{i+1}. #{arr[i][0]}, #{arr[i][1]}"
    
  end
  
end
