# lesson 17
# 

input = File.open("./task.txt", "r")

sum = 0.0

arr = []

while ( line = input.gets )
  
  arrstr = line.split ','
  
  arr << { :month => arrstr[0], :sum => arrstr[1].to_f }
  
  sum += arrstr[1].to_f
  
end

input.close

puts "Total: #{sum}"

puts arr

sum6 = 0.0

0.upto 5 do |i|
  
  sum6 += arr[i][:sum]
  
end

puts sum6
