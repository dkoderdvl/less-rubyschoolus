# laesson 16
# 



say_hi = lambda { puts 'Hi'}
say_by = lambda { puts 'Bye'}

say_hi.call
say_by.call

puts '=' * 40

arr = []

arr << lambda { puts 'Hi'}
arr << lambda { puts 'Hi'}
arr << lambda { puts 'Bye'}

arr.each do |lmbd|
  
  lmbd.call
  
end

puts '=' * 40

#~ sub_10 = lambda do |x|
  
  #~ return x -10
  
#~ end

sub_10 = lambda { |x| x - 10 }

a = sub_10.call 1000
puts a
