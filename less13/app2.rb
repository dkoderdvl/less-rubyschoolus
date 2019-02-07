# less 13
# 

hh = {}

def set_age hhg, name, age
  
  #~ if hhg[name]              #
    #~ puts 'Already exists!'   # lamer
  #~ end                       #
  
  puts 'Already exists!' if hhg[name] # cool
  
  hhg[name] = age
  
end

def show_hash hh
  
  hh.each do |k,v|
    
    puts "name: #{k}; age: #{v}"
    
  end
  
end

loop do |_|
  
  print 'Enter name: '
  user_name = gets.strip.capitalize
  
  if user_name == ''
    
    break
    
  end
  
  print 'Enter age: '
  age = gets.to_i
  
  set_age hh, user_name, age
  
end

show_hash hh
