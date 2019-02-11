# lesson 18
# 

input = File.open("./passwords.txt", "r")
output = File.open("./passwords_.txt", "w")

while ( line = input.gets )
  
  #output.write line
  
  line.strip! if line
  puts line if line.size == 6
  
  output.write line + "\n" if line.size == 6
  
end


