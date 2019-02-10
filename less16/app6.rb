# laesson 16
# 

add_10 = lambda { |x| x + 10 }
add_20 = lambda { |x| x + 20 }
sub_5  = lambda { |x| x - 5 }

hh = { 111 => add_10, 222 => add_10, 333 => add_20, 444 => add_20, 555 => add_20, 666 => add_20, 777 => sub_5, 888 => sub_5, 999 => sub_5}

balance = 100

1000.times do   
  
  x = rand(111..999)
  
  if hh[x] 
    
    balance = hh[x].call balance
    puts balance
    
  else
      
    balance = sub_5 balance
    
  end
  
end
