# less 12
# Tic - Tak - Tex

def print_table hh_steps

  str = '|-----|-----|-----|'
  
  1.upto(3) do |y|
    
    puts str

    puts "|#{hh_steps[[1,y]]}|#{hh_steps[[2,y]]}|#{hh_steps[[3,y]]}|"
    
  end
  
  puts str
  
end


hh = {
  [1,1]=>' 1/1 ',
  [1,2]=>' 1/2 ',
  [1,3]=>' 1/3 ',
  [2,1]=>' 2/1 ',
  [2,2]=>' 2/2 ',
  [2,3]=>' 2/3 ',
  [3,1]=>' 3/1 ',
  [3,2]=>' 3/2 ',
  [3,3]=>' 3/3 ',
}

print 'Enter your name: '
user_name = gets.strip.capitalize

puts "Hi, #{user_name}! This is game Tic - Tak - Tex"

loop do
  
  puts '=' * 80
  print_table hh
  
  print 'enter x:'
  x = gets.to_i
  
  print 'enter y:'
  y = gets.to_i
  
  if hh[[x,y]] == '  X  ' || hh[[x,y]] == '  0  '
    
    puts "cell x=#{x}, y=#{y} busy"
    next
    
  end
  
  hh[[x,y]] = '  X  '
  
  
  
end


