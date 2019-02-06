# Урок 10
# Камень - ножницы - бумага
# rock - scissors - paper

def get_random_value
  
  [:rock, :scissors, :paper][rand(0..2)]
  
end

print "Enter you name: "
user_name = gets.strip.capitalize

puts "Hi #{user_name}. Let's game [r]ock - [s]cissors - [p]aper or e[x]it"

loop  do
  
  print "Enter you variant: "
  vars = gets.strip.upcase
  
  if vars == "ROCK" || vars == "R"
    
    var = :rock
    
  elsif vars == "SCISSORS" || vars == "S"
    
    var = :scissors
    
  elsif vars == "PAPER" || vars == "P"
    
    var = :paper
    
  elsif vars == "EXIT" || vars == "X"
    
    exit
    
  end
  
  valrnd = get_random_value
  
  puts "#{user_name} - #{var} || computer - #{valrnd}"
  
  if var == :rock && valrnd == :scissors || var == :scissors && valrnd == :paper || var == :paper && valrnd == :rock
    
    puts "#{user_name} - you are win"
    
  else
    
    puts "compute is win"
    
  end
    
  #~ puts var.object_id
  #~ puts :rock.object_id
  #~ puts :scissors.object_id
  #~ puts :paper.object_id
  
end

