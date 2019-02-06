# Урок 10
# 

arr = %w{walt hank jr jessie lidia}

#arr[2].capitalize!

#~ arr.size.times do |i|
  
  #~ puts "#{i} - #{arr[i]}"
  
#~ end

arr.each_index do |i|
  
  if i == 2 

    puts "#{i} - #{arr[i].capitalize}"
    
  else
  
    puts "#{i} - #{arr[i]}"
    
  end
  
end

arr2 = arr[1..2]
puts arr2
