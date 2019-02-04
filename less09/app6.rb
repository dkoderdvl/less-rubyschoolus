# урок 9
# методы.

def get_command
  
  x = rand(1..4)
  
  if x == 1
    
    cmd = :left
    
  elsif x == 2
    
    cmd = :right
    
  elsif x == 3
    
    cmd = :up
    
  elsif x == 4
    
    cmd = :down
      
  end
  
  cmd
  
end

10.times do
  
  command = get_command

  if command == :left

    puts "Робот едет в лево"

  elsif command == :right

    puts "Робот едет в право"

  elsif command == :up

    puts "Робот едет вперед"

  elsif command == :down

    puts "Робот едет назад"

  end

end
