# Урок 10
# 

def get_command
  
  [:left, :right, :up, :down][rand(0..3)]
  
end

def get_stepen(number, stepen)
  
  number ** stepen
  
end


command = get_command

10.times do |i|
  
  command = get_command
  
  puts command
  
  puts get_stepen(i, rand(2..4))
  #puts get_stepen(2, 3)
  
end

