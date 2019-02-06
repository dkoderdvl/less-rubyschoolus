# Урок 10
# 

# урок 9
# методы.

def get_command
  
  #@arr_actions[rand(0..3)]
  [:left, :right, :up, :down][rand(0..3)]
end

#@arr_actions = [:left, :right, :up, :down]

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
