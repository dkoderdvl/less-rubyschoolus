# lesson 18
# 

def is_passwor_weak? psswrd
    
  return nil if psswrd.empty?

  input = File.open("./passwords.txt", "r")

  while ( line = input.gets.strip! )
    
    return true if psswrd.include? line
      
  end
  
  false
  
end

print 'Enter passwort: '
psswrd = gets.strip

exit if psswrd.empty? 

if is_passwor_weak? psswrd
  
  puts 'Your password is weak'
  
else
  
  puts 'Your password is not weak'
  
end
