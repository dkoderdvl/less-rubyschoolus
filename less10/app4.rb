# Урок 10
# 

arr = %w{walt hank jr jessie lidia}

while true do
  
  arr.each_index do |i|
    
    puts "#{i+1} - #{arr[i]}"
    
  end
  
  print "Кого удалить (порядковый номер)?"
  n_del = gets.to_i
  
  if n_del >= 1 && n_del <=arr.size
    
    arr.delete_at n_del - 1
    
  end
  
end
