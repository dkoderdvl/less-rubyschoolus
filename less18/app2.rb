# lesson 18
# 

print 'Enter passwort: '
psswrd = gets.strip

exit if psswrd.empty?

input = File.open("./passwords.txt", "r")

psswrd_is_weak = false

while ( line = input.gets )
  
  line.strip!
  
  if psswrd.include? line
    
    psswrd_is_weak = true
    break
    
  end
  
end

if psswrd_is_weak
  
  puts 'Your password is weak'
  
else
  
  puts 'Your password is not weak'
  
end

