# любимый цвет

arr = []

while :true
  
  print "Введите ваш любимый цвет (или stop для выхода): "
  color = gets.strip
  
  if arr.include?(color)
    
    puts "Вы уже ввели #{color} цвет"
    next
    
  end
  
  if color.upcase == "STOP"
    
    break
    
  end
  
  arr << color
  
end

unless arr.empty?
    
  #arr.size.downto(1) {|n|puts arr[n-1]}
  puts arr.reverse
  
end
