# less 13
# 

hh = {}

def set_age hhg, name, age
  
  hhg[name] = age
  
end

def show_hash hh
  
  hh.each do |k,v|
    
    puts "#{k} - #{v}"
    
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
