# Урок 10
# 

arr = []

loop do
  
  print "Кого добавить в список? "
  name = gets.strip.capitalize
  
  if name == ""
    
    break
    
  end
  
  # todo надо вставить проверку на задвоение
  
  arr << name
  
end

if arr.empty?
  
  puts "В списке никого нет"
  
else
  
  puts "Список учеников:"
  arr.each_index do |i|
    
    puts "#{i+1} - #{arr[i]}"
    
  end
  
end
