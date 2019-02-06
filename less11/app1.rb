# Урок 11
#

a = 50
b = 70
puts "a = #{a}"
puts "b = #{b}"

puts "=" * 60
#~ a  = [a, b]
#~ b = a[0]
#~ a = a[1]

a,b = b,a

puts "a = #{a}"
puts "b = #{b}"


puts "=" * 60

arr = %w{liss piter jon}

arr.each_with_index do |item, i|
  
  puts "#{i} - #{item}"
  
end
