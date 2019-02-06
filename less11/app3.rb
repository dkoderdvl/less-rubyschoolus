# Урок 11
# 

hh = {}

loop do
  
  print 'Enter name (Enter to stop): '
  name = gets.strip.capitalize
  
  if name == ''
    
    break
    
  end
  
  print 'Enter phone number: '
  phone_number = gets.strip
  
  hh[name] = phone_number
  
end

hh.each do |key, value|
  
  puts "key = #{key} - value = #{value}"
  
end
